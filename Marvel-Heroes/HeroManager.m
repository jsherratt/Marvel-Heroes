//
//  HeroManager.m
//  Marvel-Heroes
//
//  Created by Joey on 25/10/2016.
//  Copyright © 2016 Joey. All rights reserved.
//

#import "HeroManager.h"

@implementation HeroManager

-(void)fetchHeroesWithPage:(NSUInteger) page completion:(void (^)(RLMResults<Hero *> *heroArray, NSError *error)) completion {
    
    [NetworkManager requestEndpoint:[NSString stringWithFormat:@""] completion:^(NSArray *JSONArray, NSError *error) {
        
        if (error == nil) {
            
            RLMRealm *realm = [RLMRealm defaultRealm];
            
            for (NSDictionary *jsonDict in JSONArray) {
                
                [realm transactionWithBlock:^{
                    
                    [Hero createOrUpdateInRealm:realm withValue:jsonDict];
                    
                }];
                
                completion([Hero allObjects], nil);
            }
            
        }else {
            completion(nil, error);
        }
        
    }];
}

@end

//
//  HeroManager.m
//  Marvel-Heroes
//
//  Created by Joey on 25/10/2016.
//  Copyright © 2016 Joey. All rights reserved.
//

#import "HeroManager.h"

@implementation HeroManager

-(void)fetchHeroesWithPage:(NSUInteger)page completion:(void (^)(Hero *movieArray, NSError *error))completion {
    
    [NetworkManager requestEndpoint:[NSString stringWithFormat:@""] completion:^(NSArray *JSONArray, NSError *error) {
        
        if (error == nil) {
            
            
            
        }else {
            completion(nil, error);
        }
        
    }];
}

@end

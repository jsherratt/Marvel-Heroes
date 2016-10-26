//
//  HeroManager.m
//  Marvel-Heroes
//
//  Created by Joey on 25/10/2016.
//  Copyright © 2016 Joey. All rights reserved.
//

#import "HeroManager.h"
#import <CommonCrypto/CommonDigest.h>

@implementation HeroManager

//Fetches the initial list of data of heroes and also loads the next page(s)
-(void)fetchHeroesWithOffsett:(NSUInteger)offset completion:(void (^)(NSArray *heroArray, NSError *))completion {
    
    NSString *publicKey = @"b2ee33af85d343437b6dd28ac719c9de";
    NSString *privateKey = @"96d9e8c26531e16e3a26d16d20375852a7d66eb4";
    
    long currentTime = (long)(NSTimeInterval)([[NSDate date] timeIntervalSince1970]);
    
    NSString *stringToHash = [NSString stringWithFormat:@"%lu%@%@",currentTime, privateKey, publicKey];
    
    NSString *hash = [self generateMD5:stringToHash];
    
    
    [NetworkManager requestEndpoint:[NSString stringWithFormat:@"http://gateway.marvel.com:80/v1/public/characters?ts=%lu&orderBy=name&offset=%lu&apikey=b2ee33af85d343437b6dd28ac719c9de&hash=%@", currentTime, (long)offset, hash] completion:^(NSArray *JSONArray, NSError *error) {
        
        if (error == nil) {
            
            completion(JSONArray, nil);
            
        }else {
            completion(nil, error);
        }
        
    }];
}

#pragma mark <MD% Hash Method>

//Used to generate MD5 hash required for endpoint
- (NSString *) generateMD5:(NSString *) input
{
    const char *cStr = [input UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest );
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}

@end

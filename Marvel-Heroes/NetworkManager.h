//
//  NetworkManager.h
//  Marvel-Heroes
//
//  Created by Joey on 25/10/2016.
//  Copyright © 2016 Joey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hero.h"

@interface NetworkManager : NSObject

+(void)requestEndpoint:(NSString *)endpoint completion:(void(^)(NSArray *JSONArray, NSError *error))completion;

@end

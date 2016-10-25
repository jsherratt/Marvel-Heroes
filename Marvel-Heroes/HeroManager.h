//
//  HeroManager.h
//  Marvel-Heroes
//
//  Created by Joey on 25/10/2016.
//  Copyright © 2016 Joey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkManager.h"

@interface HeroManager : NSObject

-(void)fetchHeroesWithPage:(NSUInteger)page completion:(void(^)(Hero *heroArray, NSError *error))completion;

@end

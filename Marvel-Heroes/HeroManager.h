//
//  HeroManager.h
//  Marvel-Heroes
//
//  Created by Joey on 25/10/2016.
//  Copyright © 2016 Joey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkManager.h"
#import <Realm/Realm.h>

@interface HeroManager : NSObject

-(void)fetchHeroesWithPage:(NSUInteger) page completion:(void(^)(RLMResults<Hero *> *heroArray, NSError *error)) completion;

@end

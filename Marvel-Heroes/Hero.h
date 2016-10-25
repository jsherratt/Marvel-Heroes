//
//  Hero.h
//  Marvel-Heroes
//
//  Created by Joey on 25/10/2016.
//  Copyright © 2016 Joey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface Hero : RLMObject

@property NSString *name;
@property NSString *description;
@property NSString *path;
@property NSInteger id;

//Other way
-(void)initWithDict: (NSDictionary *)dict;

@end

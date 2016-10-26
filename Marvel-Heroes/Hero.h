//
//  Hero.h
//  Marvel-Heroes
//
//  Created by Joey on 25/10/2016.
//  Copyright © 2016 Joey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hero : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *description;
@property (nonatomic) NSString *path;
@property (nonatomic) NSString *detailUrl;
@property (nonatomic) NSString *wikiUrl;

//Init method
-(id)initWithDict: (NSDictionary *)dict;

@end

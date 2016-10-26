//
//  Hero.m
//  Marvel-Heroes
//
//  Created by Joey on 25/10/2016.
//  Copyright © 2016 Joey. All rights reserved.
//

#import "Hero.h"

@implementation Hero

@synthesize description;

//Hero initializer
-(id)initWithDict:(NSDictionary *)dict{
    
    self = [super init];
        
    self.name = [dict objectForKey:@"name"];
    self.description = [dict objectForKey:@"description"];
        
    NSDictionary *thumbnail = [dict objectForKey:@"thumbnail"];
    self.path = [thumbnail objectForKey:@"path"];
    
    NSArray *urlArray = [dict objectForKey:@"urls"];
    
    if ([[urlArray[0] objectForKey:@"url"] length] == 0) {
        self.detailUrl = @"No detail url";
    }else {
        self.detailUrl = [urlArray[0] objectForKey:@"url"];
    }

    if ([[urlArray[1] objectForKey:@"url"] length] == 0) {
        self.wikiUrl = @"No wiki url";
    }else {
        self.wikiUrl = [urlArray[1] objectForKey:@"url"];
    }

    return self;
}

@end

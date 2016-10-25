//
//  Hero.m
//  Marvel-Heroes
//
//  Created by Joey on 25/10/2016.
//  Copyright © 2016 Joey. All rights reserved.
//

#import "Hero.h"

@implementation Hero

+(NSString *)primaryKey {
    return @"id";
}

//Other way
-(void)initWithDict:(NSDictionary *)dict{
    
    self.name = [dict objectForKey:@"name"];
    self.description = [dict objectForKey:@"description"];
    
    NSDictionary *thumbnail = [dict objectForKey:@"thumbnail"];
    self.path = [thumbnail objectForKey:@"path"];

}

@end

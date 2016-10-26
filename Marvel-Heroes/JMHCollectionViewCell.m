//
//  JMHCollectionViewCell.m
//  Marvel-Heroes
//
//  Created by Joey on 25/10/2016.
//  Copyright © 2016 Joey. All rights reserved.
//

#import "JMHCollectionViewCell.h"

@implementation JMHCollectionViewCell

#pragma mark <Cell reusing>

-(void)prepareForReuse {
    
    [self.heroImageView hnk_cancelSetImage];
    self.heroImageView.image = nil;
}

#pragma mark <Cell configuration>

-(void)configureCellWithHero:(Hero *)hero {
    
    NSString *url = [NSString stringWithFormat:@"%@/%@", hero.path, @"standard_medium.jpg"];
    
    [self.heroImageView hnk_setImageFromURL:[NSURL URLWithString:url]];
}

@end

//
//  JMHCollectionViewCell.h
//  Marvel-Heroes
//
//  Created by Joey on 25/10/2016.
//  Copyright © 2016 Joey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hero.h"
#import "Haneke.h"

@interface JMHCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *heroImageView;

-(void)configureCellWithHero: (Hero *)hero;

@end

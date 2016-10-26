//
//  JMHCollectionViewController.h
//  Marvel-Heroes
//
//  Created by Joey on 24/10/2016.
//  Copyright © 2016 Joey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hero.h"
#import "HeroManager.h"
#import "JMHCollectionViewCell.h"
#import "Haneke.h"
#import "JMHDetailViewController.h"

@interface JMHCollectionViewController : UICollectionViewController

@property (nonatomic, strong) HeroManager *manager;
@property (nonatomic) NSUInteger offset;
@property (nonatomic) NSMutableArray *heroes;

@end

//
//  JMHCollectionViewController.h
//  Marvel-Heroes
//
//  Created by Joey on 24/10/2016.
//  Copyright © 2016 Joey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroManager.h"
#import "JMHCollectionViewCell.h"
#import <Realm/Realm.h>

@interface JMHCollectionViewController : UICollectionViewController

@property (nonatomic, strong) HeroManager *manager;
//@property (nonatomic) RLMResults<Hero *> *heroes;
@property (nonatomic) NSUInteger offset;

//Other way
@property (nonatomic) NSMutableArray *heroes;

@end

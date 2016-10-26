//
//  JMHDetailViewController.h
//  Marvel-Heroes
//
//  Created by Joey on 26/10/2016.
//  Copyright © 2016 Joey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hero.h"
#import "Haneke.h"
#import "JMHWebViewViewController.h"

@interface JMHDetailViewController : UIViewController

@property (nonatomic)Hero *hero;
@property (weak, nonatomic) IBOutlet UIImageView *heroImageView;
@property (weak, nonatomic) IBOutlet UITextView *descriptionText;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *detailBtn;
@property (weak, nonatomic) IBOutlet UIButton *wikiBtn;

@end

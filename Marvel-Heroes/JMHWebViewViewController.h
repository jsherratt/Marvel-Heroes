//
//  JMHWebViewViewController.h
//  Marvel-Heroes
//
//  Created by Joey on 26/10/2016.
//  Copyright © 2016 Joey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hero.h"

@interface JMHWebViewViewController : UIViewController

@property (nonatomic) NSString *heroUrl;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

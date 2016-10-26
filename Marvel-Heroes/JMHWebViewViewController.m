//
//  JMHWebViewViewController.m
//  Marvel-Heroes
//
//  Created by Joey on 26/10/2016.
//  Copyright © 2016 Joey. All rights reserved.
//

#import "JMHWebViewViewController.h"

@interface JMHWebViewViewController ()

@end

@implementation JMHWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Load webview with hero url
    NSString *urlString = self.heroUrl;
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *reqest = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:reqest];
}

@end

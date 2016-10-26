//
//  JMHDetailViewController.m
//  Marvel-Heroes
//
//  Created by Joey on 26/10/2016.
//  Copyright © 2016 Joey. All rights reserved.
//

#import "JMHDetailViewController.h"

@interface JMHDetailViewController ()

@end

@implementation JMHDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Configure view
    [self configureView];
    
    //Configure image view
    [self configureImageViewWithImage:self.hero];
    
    //Set hero name label and description
    self.nameLabel.text = self.hero.name;
    
    if ([self.hero.description length] == 0) {
        
        self.descriptionText.text = @"No description availble";
    }else {
        self.descriptionText.text = self.hero.description;
    }
    
    //Add gesture recognizers
    UITapGestureRecognizer *imageGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTapped)];
    [self.heroImageView addGestureRecognizer:imageGestureRecognizer];
    
    UITapGestureRecognizer *textViewRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(textViewTapped)];
    [self.descriptionText addGestureRecognizer:textViewRecognizer];
}

#pragma mark <Initial setup>

-(void)configureImageViewWithImage:(Hero *)hero {
    
    NSString *url = [NSString stringWithFormat:@"%@/%@", self.hero.path, @"portrait_uncanny.jpg"];
        
    //Fetch hero image from url path
    [self.heroImageView hnk_setImageFromURL:[NSURL URLWithString:url]];
}

-(void)configureView {
    
    //Customise navigation bar
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //Round image view
    self.heroImageView.layer.cornerRadius = 5;
    self.heroImageView.clipsToBounds = YES;
    
    //Round buttons
    self.detailBtn.layer.cornerRadius = 5;
    self.detailBtn.clipsToBounds = YES;
    
    self.wikiBtn.layer.cornerRadius = 5;
    self.wikiBtn.clipsToBounds = YES;

}

#pragma mark  <Button actions>

- (IBAction)detailBtnTapped:(id)sender {
    
    NSLog(@"DetailUrl %@", self.hero.detailUrl);
    
    JMHWebViewViewController *webView = [self.storyboard instantiateViewControllerWithIdentifier:@"WebView"];
    webView.heroUrl = self.hero.detailUrl;
    [self.navigationController pushViewController:webView animated:true];
    
}
- (IBAction)wikiBtnTapped:(id)sender {
    
    NSLog(@"WikiUrl %@", self.hero.wikiUrl);
    
    JMHWebViewViewController *webView = [self.storyboard instantiateViewControllerWithIdentifier:@"WebView"];
    webView.heroUrl = self.hero.wikiUrl;
    [self.navigationController pushViewController:webView animated:true];
}

#pragma mark  <Gesture recognizer methods>

-(void)imageViewTapped {
    
    [self toggleOverviewTextViewHidden];
}

-(void)textViewTapped {
    
    [self toggleOverviewTextViewHidden];
}

-(void)toggleOverviewTextViewHidden {
    
    //Fade the text view in and out
    if (self.descriptionText.alpha == 0) {
        
        [UIView animateWithDuration:0.55 animations:^{
            self.descriptionText.alpha = 0.9;
        }];
        
    } else {
        
        [UIView animateWithDuration:0.55 animations:^{
            self.descriptionText.alpha = 0;
        }];
    }
}

@end

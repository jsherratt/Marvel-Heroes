//
//  JMHCollectionViewController.m
//  Marvel-Heroes
//
//  Created by Joey on 24/10/2016.
//  Copyright © 2016 Joey. All rights reserved.
//

#import "JMHCollectionViewController.h"

@interface JMHCollectionViewController ()

@end

@implementation JMHCollectionViewController

static NSString * const reuseIdentifier = @"MarvelHeroCell";

- (void)viewDidLoad {
    [super viewDidLoad];

    // Register cell classes
   // [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.topItem.title = @"Marvel Heroes";
    
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    cell.backgroundColor = [UIColor blackColor];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
}


 #pragma mark - Navigation
 
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

 }




@end

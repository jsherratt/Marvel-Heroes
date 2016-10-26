//
//  JMHCollectionViewController.m
//  Marvel-Heroes
//
//  Created by Joey on 24/10/2016.
//  Copyright © 2016 Joey. All rights reserved.
//

#import "JMHCollectionViewController.h"
#import <SVPullToRefresh/SVPullToRefresh.h>

@interface JMHCollectionViewController ()

@end

@implementation JMHCollectionViewController

static NSString * const reuseIdentifier = @"MarvelHeroCell";

- (void)viewDidLoad {
    [super viewDidLoad];

    //Customise collection view and navigation bar
    //self.collectionView.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.topItem.title = @"Marvel Heroes";
    
    //Initialise hero manager
    self.manager = [[HeroManager alloc] init];
    
    //Set initial offset
    self.offset = 0;
    
    self.heroes = [[NSMutableArray alloc] init];
    
    
#pragma mark <Fetch initial data>

    [self.manager fetchHeroesWithOffsett:self.offset completion:^(NSArray *heroArray, NSError *error) {
        
        if (error == nil) {
            
            for (NSDictionary *heroDict in heroArray){
                
                //Create hero from dict
                Hero *hero = [[Hero alloc] initWithDict:heroDict];
                
                //Add each hero to array
                [_heroes addObject:hero];
            }
            
            self.offset += 20;
            [self reloadCollectionView];
            
        } else {
            [self showAlertWithTitle:@"There was an error" andMessage:error.localizedDescription];
        }
    }];
    
#pragma mark <Infinite scrolling>
    
    __weak typeof(self) weakSelf = self;
    
    [self.collectionView addInfiniteScrollingWithActionHandler:^{
        __strong typeof(self) strongSelf = weakSelf;
        
        [strongSelf.manager fetchHeroesWithOffsett:strongSelf.offset completion:^(NSArray *heroArray, NSError *error) {
            
            if (error == nil) {
                
                for (NSDictionary *heroDict in heroArray){
                    
                    //Create hero from dict
                    Hero *hero = [[Hero alloc] initWithDict:heroDict];
                    
                    //Add each hero to array
                    [strongSelf.heroes addObject:hero];
                }
                
                strongSelf.offset += 20;
                [strongSelf.collectionView.infiniteScrollingView stopAnimating];
                [strongSelf reloadCollectionView];
                
            } else {
                [strongSelf showAlertWithTitle:@"There was an error" andMessage:error.localizedDescription];
            }
        }];
    }];
}

-(void)reloadCollectionView {
    
    [self.collectionView reloadData];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.heroes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    JMHCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.heroImageView.layer.cornerRadius = 2.5;
    cell.heroImageView.clipsToBounds = YES;
    
    // Configure the cell
    Hero *hero = self.heroes[indexPath.row];
    [cell configureCellWithHero:hero];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    JMHDetailViewController *detailView = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailView"];
     Hero *hero = self.heroes[indexPath.row];
    detailView.hero = hero;
    [self.navigationController pushViewController:detailView animated:true];
}

#pragma mark <UIAlertController>

-(void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:true completion:nil];
}




@end

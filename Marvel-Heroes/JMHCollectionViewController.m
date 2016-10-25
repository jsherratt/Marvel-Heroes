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
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.topItem.title = @"Marvel Heroes";
    
    //Initialise hero manager
    self.manager = [[HeroManager alloc] init];
    
    //Set initial offset
    self.offset = 0;
    
    
#pragma mark <Fetch initial data>
//    [self.manager fetchHeroesWithOffset:self.offset completion:^(RLMResults<Hero *> *heroArray, NSError *error) {
//        
//        if (error == nil) {
//            
//            self.heroes = heroArray;
//            NSLog(@"Yay %@", heroArray);
//            NSLog(@"Count %lu",heroArray.count);
//            //self.offset += 20;
//            [self.collectionView reloadData];
//            
//        } else {
//            [self showAlertWithTitle:@"There was an error" andMessage:error.localizedDescription];
//        }
//        
//    }];
    
    //Other way
    [self.manager fetchHeroesWithOffsett:self.offset completion:^(NSArray *heroArray, NSError *error) {
        
        if (error == nil) {
            
            for (NSDictionary *heroDict in heroArray){
                
                //Create hero from dict
                //Hero *hero = [[Hero alloc] initWithDict:heroDict];
                
                //Add each hero to array
                //[_heroes addObject:hero];
            }
            
            NSLog(@"Yay %@", heroArray);
            NSLog(@"Count %lu",heroArray.count);
            NSLog(@"First item in array %@",heroArray[0]);
            [self.collectionView reloadData];
            
        } else {
            [self showAlertWithTitle:@"There was an error" andMessage:error.localizedDescription];
        }
    }];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.heroes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    JMHCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    Hero *hero = self.heroes[indexPath.row];
    [cell configureCellWithHero:hero];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
}


 #pragma mark - Navigation
 
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

 }

#pragma mark <UIAlertController>

-(void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:true completion:nil];
}




@end

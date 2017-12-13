//
//  ViewController.m
//  Obj-C 2-1-13
//
//  Created by Jack Wong on 2017/12/11.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionViewCell.h"
#import "CollectionReusableView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property NSArray *photoArray;

@property NSArray *fruitArray;

@property NSArray *galleryArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.photoArray = @[@"photo0",@"photo1",@"photo2",@"photo3",@"photo4",@"photo5"];
    self.fruitArray = @[@"fruit0",@"fruit1",@"fruit2",@"fruit3"];
    self.galleryArray = @[self.photoArray,self.fruitArray];
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.galleryArray.count;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [[self.galleryArray objectAtIndex:section] count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[self.galleryArray[indexPath.section] objectAtIndex:indexPath.row]];
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
    headerView.headerLabel.text = @"Photos";
    return headerView;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    float cellWidth = screenWidth / 2.0 - 5 ;
    CGSize size = CGSizeMake(cellWidth, cellWidth);
    
    return size;
}

@end

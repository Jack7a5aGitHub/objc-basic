//
//  CalendarViewController.m
//  CalendarAppVersion2
//
//  Created by Jack Wong on 2018/01/10.
//  Copyright © 2018 Jack. All rights reserved.
//

#import "CalendarViewController.h"
#import "Model.h"
#import "WeekProvider.h"
#import "MonthProvider.h"

@interface CalendarViewController ()<UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *weekCollectionView;

@property (weak, nonatomic) IBOutlet UICollectionView *monthCollectionView;

@property (nonatomic) WeekProvider * weekProvider;

@property (nonatomic) MonthProvider * monthProvider;

@property (nonatomic) Model * model;
@end

static CGFloat const CellMargin = 2.0f;

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupMonthCollectionView];
    [self setupCalendarModel];
    [self setupWeekCollectionView];
}

- (IBAction)previousMonth:(id)sender {
    
    self.model.selectedDate = [self.model.selectedDate monthAgoDate];
    self.monthProvider.numberOfItems = (NSInteger)[self.model calculationNumberOfItems];
    [self setNavigationTitle:self.model.selectedDate];
    [self.monthCollectionView reloadData];
}

- (IBAction)nextMonth:(id)sender {
    
    self.model.selectedDate = [self.model.selectedDate monthLaterDate];
    self.monthProvider.numberOfItems = (NSInteger)[self.model calculationNumberOfItems];
    [self setNavigationTitle:self.model.selectedDate];
    [self.monthCollectionView reloadData];
}

-(void)setNavigationTitle:(NSDate*)date{
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy年M月";
    self.title = [formatter stringFromDate:date];
}

-(void)setupMonthCollectionView{
    self.monthCollectionView.delegate = self;
    self.monthProvider = [MonthProvider new];
    self.monthCollectionView.dataSource = self.monthProvider;
}
-(void)setupWeekCollectionView{
    self.weekCollectionView.delegate = self;
    self.weekProvider = [WeekProvider new];
    self.weekCollectionView.dataSource = self.weekProvider;
}

-(void)setupCalendarModel{
    
    self.model = [Model new];
    self.model.selectedDate = [NSDate date];
    self.monthProvider.monthModel = self.model;
    self.monthProvider.numberOfItems = (NSInteger)[self.model calculationNumberOfItems];
    [self setNavigationTitle:self.model.selectedDate];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger numberOfMargin = 8;
    CGFloat width = floorf((collectionView.frame.size.width - CellMargin * numberOfMargin) / DaysPerWeek);
    CGFloat height = width * 1.5f;
    
    return CGSizeMake(width, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(CellMargin, CellMargin, CellMargin, CellMargin);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return CellMargin;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return CellMargin;
}

@end

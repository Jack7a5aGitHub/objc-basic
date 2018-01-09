//
//  ViewController.m
//  CalendarApp
//
//  Created by Jack Wong on 2018/01/09.
//  Copyright © 2018 Jack. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionViewCell.h"

@implementation NSDate (Extension)

- (NSDate *)monthAgoDate
{
    NSInteger addValue = -1;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc]init];
    dateComponents.month = addValue;
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
}

- (NSDate *)monthLaterDate
{
    NSInteger addValue = 1;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc]init];
    dateComponents.month = addValue;
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
}

@end

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) NSDate *selectedDate;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property NSArray *dayArray;
@property NSString *titleText;

@end

static NSUInteger const DaysPerWeek = 7;

static CGFloat const CellMargin = 2.0f;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectedDate = [NSDate date];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.dayArray = @[@"日",@"月",@"火",@"水",@"木",@"金",@"土"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSDate *)firstDateOfMonth
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth| NSCalendarUnitDay fromDate:self.selectedDate];
    components.day = 1;
    
    NSDate *firstDateMonth = [[NSCalendar currentCalendar] dateFromComponents:components];
    
    return firstDateMonth;
}

- (NSDate *)dateForCellAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSInteger ordinalityOfFirstDay = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay
                                                                             inUnit:NSCalendarUnitWeekOfMonth
                                                                            forDate:self.firstDateOfMonth];
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc]init];
    dateComponents.day = indexPath.item - (ordinalityOfFirstDay - 1);
    
    NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents
                                                                 toDate:self.firstDateOfMonth
                                                                options:0];
    return date;
}

- (void)setSelectedDate:(NSDate*)currentDate
{
    _selectedDate = currentDate;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy年M月";
    self.title = [formatter stringFromDate:currentDate];
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.dayArray.count;
    } else {
        
        NSRange rangeOfWeeks = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitWeekOfMonth
                                                                  inUnit:NSCalendarUnitMonth
                                                                 forDate:self.firstDateOfMonth];
        NSUInteger numberOfWeeks = rangeOfWeeks.length;
        NSInteger numberOfItems = numberOfWeeks * DaysPerWeek;
        
        return numberOfItems;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell"
                                                                               forIndexPath:indexPath];
    
    if (indexPath.row % 7 == 0){
        cell.dayLabel.textColor = [UIColor redColor];
    } else if (indexPath.row % 7 == 6) {
        cell.dayLabel.textColor = [UIColor blueColor];
    } else {
        cell.dayLabel.textColor = [UIColor blackColor];
    }
    
    if (indexPath.section == 0) {
        cell.dayLabel.text = self.dayArray[indexPath.row];
    } else {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat = @"d";
        cell.dayLabel.text = [formatter stringFromDate:[self dateForCellAtIndexPath:indexPath]];
    }
    return cell;
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
- (IBAction)previousMonth:(id)sender {
    
    self.selectedDate = [self.selectedDate monthAgoDate];
    
    [self.collectionView reloadData];
    
}

- (IBAction)nextMonth:(id)sender {
    
    self.selectedDate = [self.selectedDate monthLaterDate];
    
    [self.collectionView reloadData];
    
}
@end

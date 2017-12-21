//
//  PageViewController.m
//  Obj-C 2-1-16
//
//  Created by Jack Wong on 2017/12/12.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "PageViewController.h"
#import "ViewController.h"

@interface PageViewController ()

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numbers = @[@"1",@"2",@"3"];
    self.dataSource = self;
    ViewController *initialVC = (ViewController *)[self viewControllerAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:initialVC];
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIViewController *)viewControllerAtIndex: (NSUInteger)index{
    ViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    viewController.pageIndex = (NSUInteger )index;
    viewController.strNumber = self.numbers[index];
    viewController.totalPage = [NSString stringWithFormat:@"%lu", (unsigned long)self.numbers.count];
    
    return viewController;
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    NSUInteger index = ((ViewController *) viewController).pageIndex;
    if (index == 0 || index == NSNotFound){
        return nil;
    }
    index--; // index = index - 1;
    
    return [self viewControllerAtIndex:index];
    
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    NSUInteger index = ((ViewController *) viewController).pageIndex;
    if (index == NSNotFound){
        return nil;
    }
    index++;
    
    if (index == self.numbers.count){
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

@end

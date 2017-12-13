//
//  ViewController.h
//  Obj-C 2-1-10
//
//  Created by Jack Wong on 2017/12/05.
//  Copyright © 2017 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    
    __weak IBOutlet UITableView *tableView;
}


@end


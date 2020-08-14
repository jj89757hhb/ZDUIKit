//
//  ZDViewController.m
//  ZDUIKit
//
//  Created by jj89757hhb on 07/30/2019.
//  Copyright (c) 2019 jj89757hhb. All rights reserved.
//

#import "ZDViewController.h"
//#import <ZDUIKit.h>
#import <ZDUIKit.h>
#import "TestTableViewCell.h"
@interface ZDViewController ()
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation ZDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [ZDToast showSuccess:@"成功" inView:self.view];
    [self.view addSubview:self.tableView];
    self.tableView.ZDProxy = [ZDTableViewProxy proxyWithTableView:self.tableView];
    ZDTableSection *section0 = [ZDTableSection section];
    for (int i =0; i<20; i++) {
        [section0 addObject:[self tableRow]];
    }
    [self.tableView.ZDProxy reloadData:@[section0]];
    [self.tableView.ZDProxy setScrollViewDidScroll:^(UIScrollView *scrollView) {
        
    }];
    [self.tableView.ZDProxy setScrollViewWillBeginDragging:^(UIScrollView *scrollView) {
        NSLog(@"setScrollViewWillBeginDragging");
    }];
}

- (TestTableViewRow *)tableRow{
    TestTableViewRow *row = [TestTableViewRow row];
    return row;;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)tableView{
    if(!_tableView){
        _tableView  = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    }
    return _tableView;
}
@end

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
@interface ZDViewController ()

@end

@implementation ZDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [ZDToast showSuccess:@"成功" inView:self.view];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

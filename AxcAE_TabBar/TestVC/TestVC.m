//
//  TestVC.m
//  AxcAE_TabBar
//
//  Created by Axc on 2018/6/4.
//  Copyright © 2018年 AxcLogo. All rights reserved.
//

#import "TestVC.h"

@interface TestVC ()

@end

@implementation TestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)click_Test:(id)sender {
    TestVC *vc = [TestVC new];
    vc.hidesBottomBarWhenPushed = NO;
    [self.navigationController pushViewController:vc animated:YES];
}


@end

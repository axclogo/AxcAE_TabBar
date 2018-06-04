//
//  TestPushHiddenVC.m
//  AxcAE_TabBar
//
//  Created by Axc on 2018/6/4.
//  Copyright © 2018年 AxcLogo. All rights reserved.
//

#import "TestPushHiddenVC.h"

@interface TestPushHiddenVC ()

@end

@implementation TestPushHiddenVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)click_Test:(id)sender {
    [self.navigationController pushViewController:[TestPushHiddenVC new] animated:YES];
}
@end

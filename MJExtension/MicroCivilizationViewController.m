//
//  MicroCivilizationViewController.m
//  04-AppJiaXingWenMing
//
//  Created by DC016 on 16/6/22.
//  Copyright © 2016年 ld. All rights reserved.
//

#import "MicroCivilizationViewController.h"

@interface MicroCivilizationViewController ()

@end

@implementation MicroCivilizationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MicroCivilization getDataMicroCivilization];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
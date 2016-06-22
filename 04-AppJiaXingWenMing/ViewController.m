//
//  ViewController.m
//  04-AppJiaXingWenMing
//
//  Created by DC016 on 16/6/3.
//  Copyright © 2016年 ld. All rights reserved.
//

#import "ViewController.h"
#import "CivilizationBroadcastViewController.h"
///这是个分段控制器的第三方类库YSLContainerViewControllerDelegate
@interface ViewController ()<YSLContainerViewControllerDelegate>
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)NSMutableArray *viewControllers;
@end

@implementation ViewController
-(NSMutableArray *)viewControllers{
    if (!_viewControllers) {
        _viewControllers=[NSMutableArray array];
    }
    return _viewControllers;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _array=@[@"文明播报",@"道德模范",@"文明创建",@"志愿服务",@"未成年人",@"区县传真",@"主题活动",@"我们的节日"];
    for (int i=0; i<8; i++) {
        CivilizationBroadcastViewController *cbcv=[self.storyboard instantiateViewControllerWithIdentifier:@"CivilizationBroadcastViewController"];
        cbcv.title=self.array[i];
        [self.viewControllers addObject:cbcv];
    }
    // ContainerView
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    float navigationHeight = self.navigationController.navigationBar.frame.size.height;
    YSLContainerViewController *containVC=[[YSLContainerViewController alloc]initWithControllers:self.viewControllers   topBarHeight:statusHeight + navigationHeight parentViewController:self];
    containVC.delegate=self;
    containVC.menuItemTitleColor=[UIColor blackColor];
    containVC.menuItemSelectedTitleColor=[UIColor redColor];
    [self.view addSubview:containVC.view];
}

#pragma mark -- YSLContainerViewControllerDelegate
- (void)containerViewItemIndex:(NSInteger)index currentController:(CivilizationBroadcastViewController *)controller{
//        NSLog(@"current Index : %ld",(long)index);
//        NSLog(@"current controller : %@",controller);
    [controller viewWillAppear:YES];
    [controller setcategoryId:(int)index+1];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}







@end

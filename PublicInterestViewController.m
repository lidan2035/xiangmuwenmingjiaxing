//
//  PublicInterestViewController.m
//  04-AppJiaXingWenMing
//
//  Created by DC016 on 16/6/22.
//  Copyright © 2016年 ld. All rights reserved.
//

#import "PublicInterestViewController.h"

@interface PublicInterestViewController ()<SDCycleScrollViewDelegate>
@property(nonatomic,strong)NSArray *publicInterestArr;
@end

@implementation PublicInterestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"公益广告";
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(publicInterest:) name:@"获取公益图片" object:nil];
    [PublicInterest getData];
    
    
}
-(void)publicInterest:(NSNotification *)notification{
    if ([notification.object isKindOfClass:[NSArray class]]) {
        self.publicInterestArr=notification.object;
        //所有数据加载完后，再去刷新
        [self showTuPian];
    }
}
-(void)showTuPian{
    SDCycleScrollView *cycleScrollView=[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-120) delegate:self placeholderImage:[UIImage imageNamed:@"regist.jpg"]];
    //轮播图片的加载
    cycleScrollView.imageURLStringsGroup=[self.publicInterestArr valueForKey:@"imageurl"];
    //轮播显示的标题加载
    cycleScrollView.titlesGroup=[self.publicInterestArr valueForKey:@"title"];
    //设置显示lable的高度
    cycleScrollView.titleLabelHeight=70.0f;
    //设置字体大小
    cycleScrollView.titleLabelTextFont=[UIFont  systemFontOfSize: 20.0f];
    [self.view addSubview:cycleScrollView];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"获取公益图片"   object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
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

//
//  DetailViewController.m
//  04-AppJiaXingWenMing
//
//  Created by DC016 on 16/6/7.
//  Copyright © 2016年 ld. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailNews.h"
@interface DetailViewController ()
@property(nonatomic,strong)NSMutableArray<DetailNews *> *newsArray;
@end

@implementation DetailViewController
-(NSMutableArray<DetailNews *> *)newsArray{
    if (!_newsArray) {
        _newsArray=[NSMutableArray array];
    }
    return _newsArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"新闻详情";
   [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(print:) name:@"获取新闻详情" object:nil];
    [DetailNews getDetailDataWithdict:_dict];
}
-(void)print:(NSNotification *)notofication{
    self.detailTitle.text=[notofication.object valueForKey:@"title"];
    //拦截网页中的图片  并修改图片大小
    [self.contentWedView stringByEvaluatingJavaScriptFromString:
     @"var script = document.createElement('script');"
     "script.type = 'text/javascript';"
     "script.text = \"function ResizeImages() { "
     "var myimg,oldwidth;"
     "var maxwidth=450;" //缩放系数
     "for(i=0;i <document.images.length;i++){"
     "myimg = document.images[i];"
     "if(myimg.width > maxwidth){"
     "oldwidth = myimg.width;"
     "myimg.width = 300;"
     "myimg.height = 200;"
     "}"
     "}"
     "}\";"
     "document.getElementsByTagName('head')[0].appendChild(script);"];
    
    //执行一段JavaScript代码
    [self.contentWedView stringByEvaluatingJavaScriptFromString:@"ResizeImages();"];
    [self.contentWedView loadHTMLString:[notofication.object valueForKey:@"content"]baseURL:nil];
    self.detailTime.text=[notofication.object valueForKey:@"issuestime"];
    self.detailSourse.text=[notofication.object valueForKey:@"source"];
    
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"获取新闻详情"   object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}
- (void)didReceiveMemoryWarning {
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

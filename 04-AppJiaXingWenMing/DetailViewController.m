//
//  DetailViewController.m
//  04-AppJiaXingWenMing
//
//  Created by DC016 on 16/6/7.
//  Copyright © 2016年 ld. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailNews.h"
@interface DetailViewController ()<UIWebViewDelegate>
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
    [self registeredNSNotificationCenter];
}
#pragma mark 注册通知及调用数据网络请求方法
-(void)registeredNSNotificationCenter{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(print:) name:@"获取新闻详情" object:nil];
    [DetailNews getDetailDataWithdict:_dict];
}
#pragma mark 通知的回调方法
-(void)print:(NSNotification *)notofication{
    self.detailTitle.text=[notofication.object valueForKey:@"title"];
    [self.contentWedView loadHTMLString:[notofication.object valueForKey:@"content"]baseURL:nil];
    self.detailTime.text=[notofication.object valueForKey:@"issuestime"];
    self.detailSourse.text=[notofication.object valueForKey:@"source"];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"获取新闻详情"   object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}
#pragma mark UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)contentWedView {
    
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
    //获取HTML内容的高度
    CGFloat height = [[self.contentWedView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] floatValue];
    CGRect frame = self.contentWedView.frame;
    frame.size.height = height+10;
    self.contentWedView.frame = frame;
    [self.view layoutIfNeeded];
}

@end

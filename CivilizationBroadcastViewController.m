//
//  CivilizationBroadcastViewController.m
//  04-AppJiaXingWenMing
//
//  Created by DC016 on 16/6/15.
//  Copyright © 2016年 ld. All rights reserved.
//

#import "CivilizationBroadcastViewController.h"
#import "News.h"
#import "LunboPicture.h"
#import "NewsTableViewCell.h"
#import "ThemeTableViewCell.h"
@interface CivilizationBroadcastViewController ()<SDCycleScrollViewDelegate>
//泛型
@property(nonatomic,strong)NSMutableArray<News *> *newsArray;
@property(nonatomic,strong)UIPageControl *pageControl;
@property(nonatomic,assign)int flag;
@property(nonatomic,strong)NSArray *lunboArr;
@property(nonatomic,assign)int pageNum;
@property(nonatomic,assign)int categoryId;
@end

@implementation CivilizationBroadcastViewController
- (void)viewDidLoad {
    [super viewDidLoad];
     _categoryId=1;
     _pageNum=1;
    [LunboPicture lunbotu];
    [self.newsTableView registerClass:[ThemeTableViewCell  class] forCellReuseIdentifier:@"sevenCell"];
    [self.newsTableView registerClass:[NewsTableViewCell class] forCellReuseIdentifier:@"newsCell"];
    
   
    self.newsTableView.tableHeaderView=self.titileView;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(print:) name:@"获取新闻数据" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(lunbop:) name:@"获取轮播图片" object:nil];
    
    //下拉加载数据
    self.newsTableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [News getNewDatacategoryId:_categoryId withpageNum:_pageNum];
    }];
    //开始加载
    [self.newsTableView.mj_header beginRefreshing];
    //上拉加载数据（MJRefreshAutoFooter这个它是自动的，无需开始加载）
    self.newsTableView.mj_footer=[MJRefreshAutoFooter footerWithRefreshingBlock:^{
        [News getNewDatacategoryId:_categoryId withpageNum:++_pageNum];
      
    }];

}
-(void)print:(NSNotification *)notofication{
    if (_pageNum==1) {
        self.newsArray=[NSMutableArray array];
    }
    if ([notofication.object isKindOfClass:[NSArray class]]) {
        [self.newsArray addObjectsFromArray:notofication.object];
        //所有数据加载完后，再去刷新
        [self.newsTableView reloadData ];
    }
    //下拉加载结束
    [self.newsTableView.mj_header endRefreshing];
    //上拉加载结束
    [self.newsTableView.mj_footer endRefreshing];
}
-(void)lunbop:(NSNotification *)notofication{
    if ([notofication.object isKindOfClass:[NSArray class]]) {
        self.lunboArr=notofication.object;
        //所有数据加载完后，再去刷新
        [self showTuPian];
    }
    
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"获取新闻数据"  object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"获取轮播图片"  object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark 显示轮播图
-(void)showTuPian{
    //使用新的类库处理轮播(要想让轮播图宽度在每种类型的手机上显示合适就把SDCycleScrollView的宽度self.view.frame.size.width)
    SDCycleScrollView *cycleScrollview=[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(9, 0, self.view.frame.size.width-20, 191) delegate:self placeholderImage:[UIImage imageNamed:@"regist.jpg"]];
    //轮播图片的加载
    cycleScrollview.imageURLStringsGroup=[self.lunboArr valueForKey:@"imageurl"];
    //轮播显示的标题加载
    cycleScrollview.titlesGroup=[self.lunboArr valueForKey:@"title"];
    //设置显示lable的高度
    cycleScrollview.titleLabelHeight=40.0f;
    //设置字体大小
    cycleScrollview.titleLabelTextFont=[UIFont  systemFontOfSize: 20.0f];
    [self.titileView addSubview:cycleScrollview];
    
}
#pragma mark 设置显示行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.newsArray.count;
}
#pragma mark 绘制cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    News *news=[[News alloc]init];
    news=self.newsArray[indexPath.row];
    if (_categoryId==7) {
        ThemeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"sevenCell"];
        cell.titleSeven.text=news.title;
        [cell.imageSeven setImageWithURL:[NSURL URLWithString:news.image] placeholderImage:[UIImage imageNamed:@"registOne.jpg"]];
        NSString *time=[NSString stringWithFormat:@"%@",news.issuestime];
        NSRange range={5,time.length-5};
        cell.time.text=[time substringWithRange:range];
        ///因为增加了内容，所以调用sizeToFit，将Cell尺寸修正到合适的位置
        [cell.titleSeven sizeToFit];
        //-------计算高度 ： 除去Label的高度120  -------
        height=cell.titleSeven.frame.size.height+120;
//        NSLog(@"%f",cell.frame.size.height);
        
        return cell;
    }else{
        NewsTableViewCell  *cell=[tableView dequeueReusableCellWithIdentifier:@"newsCell"];
        //-----模型(Model)处理用点语法去进行赋值-----
        cell.title.text=news.title;
        NSString *time=[NSString stringWithFormat:@"%@",news.issuestime];
        NSRange range={5,time.length-5};
        cell.issuestime.text=[time substringWithRange:range];
        [cell.image setImageWithURL:[NSURL URLWithString:news.image] placeholderImage:[UIImage imageNamed:@"registOne.jpg"]];
        cell.numberLable.text=[NSString stringWithFormat:@"%@",news.praiseNum];
        cell.browseNum.text=[NSString stringWithFormat:@"%@", news.browseNum ];
        [cell.title sizeToFit];
        //-------计算高度 ： 除去Label的高度80(假设把其他的都看成80，lable多大celld的尺寸就多大，所以加上80，才能让lanle通过文字显示高度（这里就显示两行）)  -------
        height=cell.title.frame.size.height+80;
        return cell;
    }
}
#pragma mark 选择某一行跳转详情
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    News *news = self.newsArray[indexPath.row];
    int tempNum=(_pageNum-1)*10+(int)indexPath.row;
    int detailPageNum=_categoryId;
    NSDictionary *dict=@{@"newsId":news.newsId,@"categoryFk":@(detailPageNum),@"pageNum":@(tempNum)};
    
    [self performSegueWithIdentifier:@"IndextToDetail" sender:dict];
    
}
#pragma mark 传值
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"IndextToDetail"]) {
        UIViewController *vc=[segue destinationViewController];
        //下边@"news"，是目标控制的类属性
        [vc setValue:sender forKey:@"dict"];
    }
}
#pragma mark 设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_categoryId==7) {
        return height;
    }
    return height;
}
-(void)setcategoryId:(int)categoryId{
    self.categoryId=categoryId;
    //这里再让他开始刷新一下
    [self.newsTableView.mj_header beginRefreshing];
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

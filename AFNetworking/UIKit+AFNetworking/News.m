//
//  News.m
//  04-AppJiaXingWenMing
//
//  Created by DC016 on 16/6/8.
//  Copyright © 2016年 ld. All rights reserved.
//
//-------使用数据模型-------
//    1、使用字典写错关键Key编译器不会报错，如果使用模型编译器就会报错
//    2、操作方便，代码简洁，错误率少
//    3、可以由对象点出属性，编码效率高
//    4、专业
//    5、调试的时候可以直接看到值


//M-Model 数据库 ： 获取数据库
//V-View 视图 SB\XIB\自定义的视图类(UIView)
//C-Controller 控制器

#import "News.h"

@implementation News

#pragma mark 网络请求数据
+(void)getNewDatacategoryId:(int)categoryId withpageNum:(int)pageNum{
    [[[self class]alloc] getNewDatawithcategoryId:categoryId withpageNum:pageNum];
}
-(void)getNewDatawithcategoryId:(int)categoryId withpageNum:(int)pageNum{
    //int->NSNumber(简单写 @（整形变量）)例子：@(++_pageNum)
    NSDictionary *dict=@{@"categoryId":@(categoryId),@"pageNum":@(pageNum)};
    //下边请求接口在pch文件中已经定义成宏，在pch文件引用在整个工程中都可以用
    [self.manager POST:HTTP_getNewsByCategoryId parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //result是responseObject它的一个键，打印出来看responseObject是一个字典
        if ([responseObject[@"result"]isEqualToNumber:@0]) {
            //data是responseObject它的一个键，打印出来看responseObject是一个字典
            //-----使用数据模型(Model)去处理-----
            //1、获取到字典，然后转成对象类型（模型），再存入数组
            NSArray *tempData=responseObject[@"data"];
            //把字典数组转化成对象数组
            NSMutableArray *newsArray=[NSMutableArray arrayWithArray:[News mj_objectArrayWithKeyValuesArray:tempData]];
            //一个字典一个news对象（运行一次tempData就有是个10个数据）
            [[NSNotificationCenter defaultCenter]postNotificationName:@"获取新闻数据" object:newsArray];
          
        }else{
            NSLog(@"请求失败%@",responseObject[@"message"]);
        }
       
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"出错了%@",error.localizedDescription);
    }];
}

- (AFHTTPSessionManager *)manager
{
    if (_manager) {
        return  _manager;
    }
    _manager = [AFHTTPSessionManager manager];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    return _manager;
}

@end

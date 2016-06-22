//
//  DetailNews.m
//  04-AppJiaXingWenMing
//
//  Created by DC016 on 16/6/20.
//  Copyright © 2016年 ld. All rights reserved.
//

#import "DetailNews.h"

@implementation DetailNews
+(void)getDetailDataWithdict:(NSDictionary *)dict{
    [[[self class]alloc] getDetailDataNewsWithdict:dict];
}
-(void)getDetailDataNewsWithdict:(NSDictionary *)dict{
    //下边请求接口在pch文件中已经定义成宏，在pch文件引用在整个工程中都可以用
    //增加一个text/html支持
    _set=[NSMutableSet setWithSet:self.manager.responseSerializer.acceptableContentTypes];
    [_set addObject:@"text/html"];
    self.manager.responseSerializer.acceptableContentTypes=_set;
    [self.manager POST:HTTP_NewsDetailById parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //result是responseObject它的一个键，打印出来看responseObject是一个字典
        if ([responseObject[@"result"]isEqualToNumber:@0]) {
            //data是responseObject它的一个键，打印出来看responseObject是一个字典-
            //1、获取到字典，然后转成对象类型（模型），再存入数组
            NSArray *tempData=responseObject[@"data"];
            //把字典数组转化成对象数组
            [[NSNotificationCenter defaultCenter]postNotificationName:@"获取新闻详情" object:tempData];
        }else{
                NSLog(@"请求失败%@",responseObject[@"message"]);
        }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"出错了%@",error);
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

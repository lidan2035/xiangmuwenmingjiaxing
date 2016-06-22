//
//  MicroCivilization.m
//  04-AppJiaXingWenMing
//
//  Created by DC016 on 16/6/22.
//  Copyright © 2016年 ld. All rights reserved.
//

#import "MicroCivilization.h"

@implementation MicroCivilization
+(void)getDataMicroCivilization{
    [[[self class]alloc]getDataMicroCivilizationPage];
}
-(void)getDataMicroCivilizationPage{
    //增加一个text/html支持
    _set=[NSMutableSet setWithSet:self.manager.responseSerializer.acceptableContentTypes];
    [_set addObject:@"text/html"];
    self.manager.responseSerializer.acceptableContentTypes=_set;
    [self.manager POST:@"http://weibo.com/u/2852517300?is_hot=1" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求出错啦。。。%@",error);
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

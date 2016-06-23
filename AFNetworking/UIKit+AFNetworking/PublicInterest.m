//
//  PublicInterest.m
//  04-AppJiaXingWenMing
//
//  Created by DC016 on 16/6/22.
//  Copyright © 2016年 ld. All rights reserved.
//

#import "PublicInterest.h"
@implementation PublicInterest
- (AFHTTPSessionManager *)manager
{
    if (_manager) {
        return  _manager;
    }
    _manager = [AFHTTPSessionManager manager];
    return _manager;
}
+(void)getData{
    [[[self class]alloc] getDataPicture];
}
-(void)getDataPicture{
    //增加一个text/html支持
    _set=[NSMutableSet setWithSet:self.manager.responseSerializer.acceptableContentTypes];
    [_set addObject:@"text/html"];
    self.manager.responseSerializer.acceptableContentTypes=_set;
    [self.manager POST:HTTP_getPsas parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject[@"result"]isEqualToNumber:@0]) {
            NSArray *array = responseObject[@"data"];
            NSMutableArray *mutableArray=[PublicInterest mj_objectArrayWithKeyValuesArray:array];
            [[NSNotificationCenter defaultCenter]postNotificationName:@"获取公益图片" object:mutableArray];
        }else{
            NSLog(@"请求失败%@",responseObject[@"message"]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"出错啦%@",error.localizedDescription);

    }];
}
@end

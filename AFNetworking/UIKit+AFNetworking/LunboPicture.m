//
//  LunboPicture.m
//  04-AppJiaXingWenMing
//
//  Created by DC016 on 16/6/8.
//  Copyright © 2016年 ld. All rights reserved.
//

#import "LunboPicture.h"

@implementation LunboPicture
#pragma mark 轮播图
+(void)lunbotu{
    [[[self class]alloc] lunbotuPictureGetData];
}
-(void)lunbotuPictureGetData{
    NSDictionary *dict=@{@"categoryId":@1};
    //下边请求接口在pch文件中已经定义成宏，在pch文件引用在整个工程中都可以用
    [self.manager POST:HTTP_getBanner parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //        NSLog(@"%@",responseObject);
        if ([responseObject[@"result"]isEqualToNumber:@0]) {
            NSArray *array = responseObject[@"data"];
            NSMutableArray *mutableArray=[LunboPicture mj_objectArrayWithKeyValuesArray:array];
            [[NSNotificationCenter defaultCenter]postNotificationName:@"获取轮播图片" object:mutableArray];
        }else{
            NSLog(@"请求失败%@",responseObject[@"message"]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"出错啦%@",error.localizedDescription);
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

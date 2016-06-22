//
//  DetailNews.h
//  04-AppJiaXingWenMing
//
//  Created by DC016 on 16/6/20.
//  Copyright © 2016年 ld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailNews : NSObject
@property(nonatomic,strong)NSString *newsId;
@property(nonatomic,strong)NSString *categoryFk;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *summary;
@property(nonatomic,strong)NSString *content;
@property(nonatomic,strong)NSString *issuestime;
@property(nonatomic,strong)NSString *source;
@property(nonatomic,strong)NSString *link;
@property(nonatomic,strong)NSString *updatetime;
@property(nonatomic,strong)NSString *browseNum;
@property(nonatomic,strong)NSString *isPush;
@property(nonatomic,strong)NSString *image;
@property(nonatomic,strong)NSString *praiseNum;
@property(nonatomic,strong)AFHTTPSessionManager *manager;
@property(nonatomic,strong)NSMutableSet *set;
+(void)getDetailDataWithdict:(NSDictionary *)dict;
-(void)getDetailDataNewsWithdict:(NSDictionary *)dict;

@end

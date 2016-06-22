//
//  News.h
//  04-AppJiaXingWenMing
//
//  Created by DC016 on 16/6/8.
//  Copyright © 2016年 ld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject
@property(nonatomic,strong)NSNumber *newsId;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *summary;
@property(nonatomic,strong)NSString *source;
@property(nonatomic,strong)NSString *image;
@property(nonatomic,strong)NSString *isPush;
@property(nonatomic,strong)NSString *isBanner;
@property(nonatomic,strong)NSString *praiseNum;
@property(nonatomic,strong)NSString *browseNum;
@property(nonatomic,strong)NSString *issuestime;
@property(nonatomic,strong)AFHTTPSessionManager *manager;

+(void)getNewDatacategoryId:(int)categoryId withpageNum:(int)pageNum;

@end

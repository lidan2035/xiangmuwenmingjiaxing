//
//  PublicInterest.h
//  04-AppJiaXingWenMing
//
//  Created by DC016 on 16/6/22.
//  Copyright © 2016年 ld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicInterest : NSObject
@property(nonatomic,strong)NSString *commonwealId;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *imageurl;
@property(nonatomic,strong)AFHTTPSessionManager *manager;
@property(nonatomic,strong)NSMutableSet *set;
+(void)getData;
-(void)getDataPicture;
@end

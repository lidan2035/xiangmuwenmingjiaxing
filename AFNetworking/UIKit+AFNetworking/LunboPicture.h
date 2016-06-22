//
//  LunboPicture.h
//  04-AppJiaXingWenMing
//
//  Created by DC016 on 16/6/8.
//  Copyright © 2016年 ld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LunboPicture : NSObject
@property(nonatomic,strong)NSString *imageurl;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)AFHTTPSessionManager *manager;
+(void)lunbotu;
-(void)lunbotuPictureGetData;
@end

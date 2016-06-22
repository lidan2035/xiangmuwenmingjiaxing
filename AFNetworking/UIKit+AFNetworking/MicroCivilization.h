//
//  MicroCivilization.h
//  04-AppJiaXingWenMing
//
//  Created by DC016 on 16/6/22.
//  Copyright © 2016年 ld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MicroCivilization : NSObject
@property(nonatomic,strong)AFHTTPSessionManager *manager;
@property(nonatomic,strong)NSMutableSet *set;
+(void)getDataMicroCivilization;
-(void)getDataMicroCivilizationPage;
@end

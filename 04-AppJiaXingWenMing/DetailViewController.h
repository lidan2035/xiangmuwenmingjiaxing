//
//  DetailViewController.h
//  04-AppJiaXingWenMing
//
//  Created by DC016 on 16/6/7.
//  Copyright © 2016年 ld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"
@interface DetailViewController : UIViewController<UITextViewDelegate>
@property(nonatomic,strong)NSDictionary *dict;
@property (strong, nonatomic) IBOutlet UILabel *detailTitle;
@property (strong, nonatomic) IBOutlet UIWebView *contentWedView;
@property (strong, nonatomic) IBOutlet UILabel *detailTime;
@property (strong, nonatomic) IBOutlet UILabel *detailSourse;

@end

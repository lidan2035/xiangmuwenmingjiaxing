//
//  CivilizationBroadcastViewController.h
//  04-AppJiaXingWenMing
//
//  Created by DC016 on 16/6/15.
//  Copyright © 2016年 ld. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CivilizationBroadcastViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    CGFloat height;//全局用于存放Cell的高度的
}
@property (strong, nonatomic) IBOutlet UIView *titileView;

@property (strong, nonatomic) IBOutlet UITableView *newsTableView;
-(void)setcategoryId:(int)categoryId;
@end

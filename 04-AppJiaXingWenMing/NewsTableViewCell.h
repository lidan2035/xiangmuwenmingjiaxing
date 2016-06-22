//
//  NewsTableViewCell.h
//  04-AppJiaXingWenMing
//
//  Created by DC016 on 16/6/3.
//  Copyright © 2016年 ld. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *title;

@property (strong, nonatomic) IBOutlet UILabel *issuestime;
- (IBAction)click:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UILabel *numberLable;
@property(nonatomic,assign)int flag;
@property (strong, nonatomic) IBOutlet UILabel *browseNum;
@property(nonatomic,assign)int flagNum;
@end

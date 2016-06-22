//
//  ThemeTableViewCell.m
//  04-AppJiaXingWenMing
//
//  Created by DC016 on 16/6/15.
//  Copyright © 2016年 ld. All rights reserved.
//

#import "ThemeTableViewCell.h"

@implementation ThemeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self=[[[NSBundle mainBundle]loadNibNamed:@"ThemeTableViewCell" owner:self options:nil] lastObject];
        //把图片处理成圆的
        //设置圆角
        self.imageView.layer.cornerRadius=10;
        //超出部分不显示
        self.imageView.clipsToBounds=YES;
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

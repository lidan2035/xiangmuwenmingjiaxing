//
//  NewsTableViewCell.m
//  04-AppJiaXingWenMing
//
//  Created by DC016 on 16/6/3.
//  Copyright © 2016年 ld. All rights reserved.
//

#import "NewsTableViewCell.h"
@implementation NewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
     _flag=0;
     _flagNum=0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
   

    // Configure the view for the selected state
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self=[[[NSBundle mainBundle]loadNibNamed:@"NewsTableViewCell" owner:self options:nil] lastObject];
        //把图片处理成圆的
        //设置圆角
        self.image.layer.cornerRadius=10;
        //超出部分不显示
        self.image.clipsToBounds=YES;
    }
    return self;
}
- (IBAction)click:(UIButton *)sender {
    int num=[_numberLable.text intValue];
    int liuLanNum=[_browseNum.text intValue];
    if (_flag%2==0) {
        num++;
        _flag++;
        _numberLable.text=[NSString stringWithFormat:@"%i",num];
        if (_flagNum==0) {
             liuLanNum++;
            _flagNum++;
            //点赞的同时，也让浏览的次数加一
            _browseNum.text=[NSString stringWithFormat:@"%i",liuLanNum];
        }
    }else{
        num--;
        _flag++;
        _numberLable.text=[NSString stringWithFormat:@"%i",num];
    }
}
@end

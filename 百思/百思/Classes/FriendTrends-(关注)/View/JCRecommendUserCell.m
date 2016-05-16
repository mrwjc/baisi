//
//  JCRecommendUserCell.m
//  百思
//
//  Created by mr.w on 16/5/8.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import "JCRecommendUserCell.h"
#import "JCRecommandUser.h"
#import <UIImageView+WebCache.h>
@interface JCRecommendUserCell()
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;

@end

@implementation JCRecommendUserCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}
-(void)setUser:(JCRecommandUser *)user{
    _user=user;
    
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:user.header]  placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.screenNameLabel.text=user.screen_name;
    self.fansCountLabel.text=[NSString stringWithFormat:@"有%ld个粉丝",user.fans_count];
}
-(void)setFrame:(CGRect)frame{
    
    frame.size.width-=20;
    frame.size.height-=1;
    frame.origin.x+=10;
    
    [super setFrame:frame];
}
@end

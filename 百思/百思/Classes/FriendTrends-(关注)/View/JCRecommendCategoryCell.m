//
//  JCRecommendCategoryCell.m
//  百思
//
//  Created by mr.w on 16/5/7.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import "JCRecommendCategoryCell.h"
#import "JCRecommandCategory.h"
@interface JCRecommendCategoryCell()
@property (weak, nonatomic) IBOutlet UIView *indecatorView;
@end

@implementation JCRecommendCategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setCategory:(JCRecommandCategory *)category{
    _category=category;
    
    self.textLabel.text=category.name;
}
-(void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];
    
    self.textLabel.textColor=(selected?[UIColor redColor]:[UIColor darkGrayColor]);
    self.indecatorView.hidden=!selected;
}
-(void)setFrame:(CGRect)frame{
    frame.size.height-=1;
    
    [super setFrame:frame];
}
@end

//
//  JCTagCell.m
//  百思
//
//  Created by mr.w on 16/5/11.
//  Copyright © 2016年 mr.w. All rights reserved.
//

#import "JCTagCell.h"
#import <UIImageView+WebCache.h>
#import "JCTag.h"
@interface JCTagCell()
@property (weak, nonatomic) IBOutlet UIImageView *image_ListView;
@property (weak, nonatomic) IBOutlet UILabel *theme_nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sub_numberLabel;
@end
@implementation JCTagCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setTags:(JCTag *)tags{
    _tags=tags;
    
    [self.image_ListView sd_setImageWithURL:[NSURL URLWithString:tags.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    self.theme_nameLabel.text=tags.theme_name;
    if(tags.sub_number>10000){
        self.sub_numberLabel.text=[NSString stringWithFormat:@"已有%.1f人订阅",tags.sub_number/10000.0];
    }else{
        self.sub_numberLabel.text=[NSString stringWithFormat:@"已有%ld人订阅",tags.sub_number];
    }
}

-(void)setFrame:(CGRect)frame{
    
    frame.size.width-=20;
    frame.size.height-=1;
    frame.origin.x+=10;
    
    [super setFrame:frame];
}

@end

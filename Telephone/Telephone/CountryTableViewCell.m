//
//  CountryTableViewCell.m
//  Telephone
//
//  Created by monstarlab6 on 15-8-28.
//  Copyright (c) 2015年 monstarlab6. All rights reserved.
//

#import "CountryTableViewCell.h"

@implementation CountryTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.countryImageview = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 20, 20)];
        [self.contentView addSubview:self.countryImageview];
        self.countryName = [[UILabel alloc]initWithFrame:CGRectMake(30, 5, [UIScreen mainScreen].bounds.size.width-80, 20)];
        [self.contentView addSubview:self.countryName];
        self.countryPhoneNum = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-65, 5, 40, 15)];
        [self.countryPhoneNum setTextAlignment:NSTextAlignmentRight];
        [self.contentView addSubview:self.countryPhoneNum];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

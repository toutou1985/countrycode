//
//  ControyViewController.h
//  Telephone
//
//  Created by monstarlab6 on 15-8-28.
//  Copyright (c) 2015年 monstarlab6. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^countryNum)(NSString * number);
@interface ControyViewController : UIViewController
@property (nonatomic,strong)UITableView * countryTableView;
@property (nonatomic,strong)NSMutableDictionary * dataDic;
@property (nonatomic,strong)NSMutableArray * sectionNameArr;
@property (nonatomic,strong) NSString * value;
@property (nonatomic,copy) countryNum  countryNumBlock;
@end

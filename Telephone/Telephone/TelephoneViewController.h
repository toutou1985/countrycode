//
//  TelephoneViewController.h
//  Telephone
//
//  Created by monstarlab6 on 15-8-28.
//  Copyright (c) 2015年 monstarlab6. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^countryNumReceived)(NSString *);
@interface TelephoneViewController : UIViewController
@property (nonatomic,copy) countryNumReceived numReceived;
@property (strong, nonatomic) IBOutlet UITextField *countryNum;
@property (strong, nonatomic) IBOutlet UITextField *phoneNum;
@property (strong, nonatomic) IBOutlet UIButton *confirmBtn;

@property (strong, nonatomic) IBOutlet UIButton *pickviewBtn;




@end

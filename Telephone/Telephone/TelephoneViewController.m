//
//  TelephoneViewController.m
//  Telephone
//
//  Created by monstarlab6 on 15-8-28.
//  Copyright (c) 2015年 monstarlab6. All rights reserved.
//

#import "TelephoneViewController.h"
#import "ControyViewController.h"
@interface TelephoneViewController ()

    
    


@end

@implementation TelephoneViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    //write to telephone.plist
    [self.pickviewBtn setBackgroundColor:[UIColor redColor]];
    __block TelephoneViewController * blockSelf = self;
    self.numReceived = ^(NSString * numPhone) {
        blockSelf.countryNum.text = numPhone;
    };
        
}
- (IBAction)pickviewBtn:(id)sender {
    ControyViewController * countryVC = [[ControyViewController alloc] init];
    countryVC.countryNumBlock = self.numReceived;
    [self.navigationController pushViewController:countryVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  ControyViewController.m
//  Telephone
//
//  Created by monstarlab6 on 15-8-28.
//  Copyright (c) 2015年 monstarlab6. All rights reserved.
//
#define UIScreenWidth [UIScreen mainScreen].bounds.size.width
#define UIScreenHeight [UIScreen mainScreen].bounds.size.height
#import "ControyViewController.h"
#import "CountryTableViewCell.h"
#import "Utils.h"
@interface ControyViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ControyViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.dataDic = [[NSMutableDictionary alloc] init];
        self.sectionNameArr = [[NSMutableArray alloc] initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    [self loadData];
    self.countryTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, UIScreenWidth, UIScreenHeight) style:UITableViewStylePlain];
    self.countryTableView.delegate = self;
    self.countryTableView.dataSource = self;
    [self.countryTableView setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:self.countryTableView];
    
      
}
- (void)loadData{
    //获取路径对象
    NSString * language = [Utils getPreferredLanguage];
    if ([language isEqualToString:@"en"]) {
        NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"TelephoneEn.plist"];
        
        //根据路径获取test.plist的全部内容
        NSMutableDictionary *infolist= [[[NSMutableDictionary alloc]initWithContentsOfFile:path]mutableCopy];
        [self.dataDic addEntriesFromDictionary:infolist];
        NSLog(@"infolist---%@",self.dataDic);

    }else{
        NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"TelephoneJP.plist"];
        
        //根据路径获取test.plist的全部内容
        NSMutableDictionary *infolist= [[[NSMutableDictionary alloc]initWithContentsOfFile:path]mutableCopy];
        [self.dataDic addEntriesFromDictionary:infolist];
        NSLog(@"infolist---%@",self.dataDic);
    }
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return [self dickey:@"A"];
            break;
        case 1:
            return [self dickey:@"B"];
            break;
        case 2:
            return [self dickey:@"C"];
            break;
        case 3:
            return [self dickey:@"D"];
            break;
        case 4:
            return [self dickey:@"E"];
            break;
        case 5:
            return [self dickey:@"F"];
            break;
        case 6:
            return [self dickey:@"G"];
            break;
        case 7:
            return [self dickey:@"H"];
            break;
        case 8:
            return [self dickey:@"I"];
            break;
        case 9:
            return [self dickey:@"J"];
            break;
        case 10:
            return [self dickey:@"K"];
            break;
        case 11:
            return [self dickey:@"L"];
            break;
        case 12:
            return [self dickey:@"M"];
            break;
        case 13:
            return [self dickey:@"N"];
            break;
        case 14:
            return [self dickey:@"O"];
            break;
        case 15:
            return [self dickey:@"P"];
            break;
        case 16:
            return [self dickey:@"Q"];
            break;
        case 17:
            return [self dickey:@"R"];
            break;
        case 18:
            return [self dickey:@"S"];
            break;
        case 19:
            return [self dickey:@"T"];
            break;
        case 20:
            return [self dickey:@"U"];
            break;
        case 21:
            return [self dickey:@"V"];
            break;
        case 22:
            return [self dickey:@"W"];
            break;
        case 23:
            return [self dickey:@"X"];
            break;
        case 24:
            return [self dickey:@"Y"];
            break;
        case 25:
            return [self dickey:@"Z"];
            break;
            
        default:
            break;
    }
    return 1;
}
- (NSInteger)dickey:(NSString *)key{
        NSMutableDictionary * dicA = [[NSMutableDictionary alloc]initWithDictionary:[self.dataDic objectForKey:key]];
        return [dicA allKeys].count;
    

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 26;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentity = @"country";
    CountryTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentity];
    if (!cell) {
        cell = [[CountryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentity];
        
    }
    for (int i = 0; i<26; i++) {
        if (indexPath.section == i) {
            NSMutableDictionary * dicWhich = [[NSMutableDictionary alloc]initWithDictionary:[self.dataDic objectForKey:[self.sectionNameArr objectAtIndex:i]]];
            NSMutableArray * allValues = [[NSMutableArray alloc] init];
            NSMutableArray * allKeys = [[NSMutableArray alloc] init];
             [allKeys addObjectsFromArray:[dicWhich allKeys]];
            NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
            NSArray *descriptors = [NSArray arrayWithObject:descriptor];
            NSArray *resultArray = [allKeys sortedArrayUsingDescriptors:descriptors];
            for (NSInteger j=0; j<[resultArray count]; j++) {            NSString *obj=[dicWhich objectForKey:[resultArray objectAtIndex:j]];
                NSLog(@"%@",obj);
                [allValues addObject:obj];
            }
            [cell.countryName setText:[resultArray objectAtIndex:indexPath.row]];
            [cell.countryPhoneNum setText:[allValues objectAtIndex:indexPath.row]];
        }
    }
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"A";
    } else if(section == 1){
        return @"B";
    } else if(section == 2){
        return @"C";
    } else if(section == 3){
        return @"D";
    } else if(section == 4){
        return @"E";
    } else if(section == 5){
        return @"F";
    } else if(section == 6){
        return @"G";
    } else if(section == 7){
        return @"H";
    } else if(section == 8){
        return @"I";
    } else if(section == 9){
        return @"J";
    } else if(section == 10){
        return @"K";
    } else if(section == 11){
        return @"L";
    } else if(section == 12){
        return @"M";
    } else if(section == 13){
        return @"N";
    } else if(section == 14){
        return @"O";
    } else if(section == 15){
        return @"P";
    } else if(section == 16){
        return @"Q";
    } else if(section == 17){
        return @"R";
    } else if(section == 18){
        return @"S";
    } else if(section == 19){
        return @"T";
    } else if(section == 20){
        return @"U";
    } else if(section == 21){
        return @"V";
    } else if(section == 22){
        return @"W";
    } else if(section == 23){
        return @"X";
    } else if(section == 24){
        return @"Y";
    } else {
        return @"Z";
    }



    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"section----%ld",(long)indexPath.section);
    NSLog(@"secion------%ld",(long)indexPath.row);
   NSMutableDictionary * dicWhich = [[NSMutableDictionary alloc]initWithDictionary:[self.dataDic objectForKey:[self.sectionNameArr objectAtIndex:indexPath.section]]];
    //NSMutableArray * allValues = [[NSMutableArray alloc] init];
    NSMutableArray * allKeys = [[NSMutableArray alloc] init];
    [allKeys addObjectsFromArray:[dicWhich allKeys]];
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *descriptors = [NSArray arrayWithObject:descriptor];
    NSArray *resultArray = [allKeys sortedArrayUsingDescriptors:descriptors];
    NSString * key = [resultArray objectAtIndex:indexPath.row];
    self.value = [dicWhich objectForKey:key];
    NSLog(@"value----%@",self.value);
    self.countryNumBlock(self.value);
    [self.navigationController popViewControllerAnimated:YES];
    
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

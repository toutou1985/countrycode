//
//  Utils.m
//  Telephone
//
//  Created by monstarlab6 on 15-9-1.
//  Copyright (c) 2015年 monstarlab6. All rights reserved.
//

#import "Utils.h"

@implementation Utils
+ (NSString*)getPreferredLanguage

{
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    
    NSArray * allLanguages = [defaults objectForKey:@"AppleLanguages"];
    
    NSString * preferredLang = [allLanguages objectAtIndex:0];
    
    NSLog(@"当前语言:%@", preferredLang);
    
    return preferredLang;
    
}
@end

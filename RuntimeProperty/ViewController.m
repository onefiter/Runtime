//
//  ViewController.m
//  RuntimeProperty
//
//  Created by humor on 16/3/7.
//  Copyright © 2016年 onefiter. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
    Person *p = [[Person alloc] init];
    
    p.name = @"zhanglili";
 //---------1.获得所有对象的属性名-----------------------
    size_t size = class_getInstanceSize(p.class);
    
    NSLog(@"size=%ld", size);
    
    for (NSString *propertyName in p.allProperties)
    {
        NSLog(@"%@", propertyName);
    }
    
    NSLog(@"=========================================");
    
  //---------2.获得所有对象的属性名和属性值---------------
   NSDictionary *dict =   p.allPropertyNameAndValues;
    
    for (NSString *propertyName in dict.allKeys) {
        NSLog(@"propertyName: %@  propertyValue: %@",propertyName,dict[propertyName] );
    }
    

    NSLog(@"-------------------------------------------");
    
//-------------3.获得所有对象的方法名---------------------
    
    [p allMethods];
    
    NSLog(@"+++++++++++++++++++++++++++++++++++++++++++++");
    
// ------------4.获得所有对象的成员变量的名称--------------
    
    
    for (NSString *varName in p.allMemberVariables) {
        NSLog(@"%@", varName);
    }
    
    
    NSLog(@"============================================");
    
    // -------------5.运行时发消息------------------------
    
    objc_msgSend(p, @selector(allMethods));
    
    
    
    
}




@end

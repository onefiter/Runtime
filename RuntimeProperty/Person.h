//
//  Person.h
//  RuntimeProperty
//
//  Created by humor on 16/3/7.
//  Copyright © 2016年 onefiter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

typedef struct objc_property *objc_property_t;

@interface Person : NSObject
{
    NSString *_variableString;
}

@property(nonatomic, copy) NSString *name;

@property(nonatomic, strong) NSMutableArray *array;

- (NSArray *)allProperties;

- (NSDictionary *)allPropertyNameAndValues;

//获得对象的成员变量名称
- (NSArray *)allMemberVariables;

- (void)allMethods;

@end

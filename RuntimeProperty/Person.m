//
//  Person.m
//  RuntimeProperty
//
//  Created by humor on 16/3/7.
//  Copyright © 2016年 onefiter. All rights reserved.
//

#import "Person.h"




@implementation Person

- (NSArray *)allProperties
{
    unsigned int count;
    
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    
    for(NSInteger i = 0; i < count; i++){
        
        const char *propertyName = property_getName(properties[i]);
        
        NSString *name = [NSString stringWithUTF8String:propertyName];
        
        [propertiesArray addObject:name];
        
    }
    
    free(properties);
    
    return propertiesArray;
    
}

/**
 *  这个方法是用来获得属性名和属性值
 *
 *  @return 字典
 */

- (NSDictionary *)allPropertyNameAndValues
{
    NSMutableDictionary *resultDic = [NSMutableDictionary dictionary];
    
    unsigned int outCount;
    
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    for (NSInteger i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        
        const char *name = property_getName(property);
        
        NSString *propertyName = [NSString stringWithUTF8String:name];
        
        //获得属性值
        id propertyValue = [self valueForKey:propertyName];
        
        if(propertyValue && propertyValue != nil)
        {
            [resultDic setObject:propertyValue forKey:propertyName];
        }
        
    }
    
    free(properties);
    
    return resultDic;
    

}


- (void)allMethods
{
    unsigned int outCount ;
    
    Method *methods = class_copyMethodList([self class], &outCount);

   
    for (NSInteger i = 0; i < outCount; i++) {
        Method  method = methods[i];
        
        //获得方法名称，SEL选择器类型
        SEL methodSEL = method_getName(method);
        
        //获得C字符串
        const char *name = sel_getName(methodSEL);
        
        //将C字符串转化成OC字符串
        NSString *methodName = [NSString stringWithUTF8String:name];
        
        //获得方法参数的列表
        NSInteger  arguments = method_getNumberOfArguments(method);
        
        NSLog(@"方法名：%@，参数个数：%ld", methodName, arguments);
        
        
    }
   
    //释放内存
    free(methods);
}

- (NSArray *)allMemberVariables
{
    unsigned int count;
    
    Ivar *ivars = class_copyIvarList([self class], &count);

    
    NSMutableArray *results = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < count; ++i) {
        Ivar variable = ivars[i];
        
        const char *name = ivar_getName(variable);
        NSString *varName = [NSString stringWithUTF8String:name];
        
        [results addObject:varName];
    }
    
    free(ivars);
    
    return results;
}

@end

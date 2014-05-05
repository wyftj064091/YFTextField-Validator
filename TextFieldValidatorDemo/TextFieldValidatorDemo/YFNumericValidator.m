//
//  YFNumericValidator.m
//  TextFieldValidatorDemo
//
//  Created by Yifeng Wu on 14-5-5.
//  Copyright (c) 2014年 YFKits. All rights reserved.
//

#import "YFNumericValidator.h"

@implementation YFNumericValidator

- (id)init
{
    return [super initWithValidationFunc:^BOOL(id nextValue) {
        NSString * stringValue = (NSString *)nextValue;
        BOOL result = NO;
        NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
        if ([stringValue rangeOfCharacterFromSet:notDigits].location == NSNotFound)
        {
            result = YES;
        }
        return result;
    }];
}


@end

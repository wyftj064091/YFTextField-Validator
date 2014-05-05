//
//  YFEmailValidator.m
//  TextFieldValidatorDemo
//
//  Created by Yifeng Wu on 14-5-5.
//  Copyright (c) 2014年 YFKits. All rights reserved.
//

#import "YFEmailValidator.h"

@implementation YFEmailValidator

- (id)init
{
    NSString *expression = @"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"; // Email regular expression.
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression options:NSRegularExpressionCaseInsensitive error:NULL];
    return [super initWithReqularExpression:regex];
}

@end

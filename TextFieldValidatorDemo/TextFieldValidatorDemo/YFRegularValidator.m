//
//  YFRegularValidator.m
//  TextFieldValidatorDemo
//
//  Created by Yifeng Wu on 14-5-5.
//  Copyright (c) 2014年 YFKits. All rights reserved.
//

#import "YFRegularValidator.h"

@implementation YFRegularValidator
@synthesize validationExpression = _validationExpression;
#pragma mark -
#pragma mark Helper
- (void)_buildValidationFuncWithRegularExpression
{
    __weak YFRegularValidator * weakSelf = self;
    self.validationBlock = ^BOOL(id nextValue) {
        //The next value must be "NSString"
        NSString * stringValue = (NSString *)nextValue;
        NSTextCheckingResult * matchResult = [weakSelf.validationExpression firstMatchInString:stringValue options:0 range:NSMakeRange(0, [stringValue length])];
        return matchResult != nil;
    };
}

- (void)setValidationExpression:(NSRegularExpression *)validationExpression
{
    if (![_validationExpression isEqual:validationExpression]) {
        _validationExpression = validationExpression;
        [self _buildValidationFuncWithRegularExpression];
    }
}

+ (instancetype)validatorWithRegularExpression:(NSRegularExpression *)expression
{
    return [[self alloc] initWithReqularExpression:expression];
}

- (instancetype)initWithReqularExpression:(NSRegularExpression *)expression
{
    self = [super init];
    if (self) {
        self.validationExpression = expression;
    }
    
    return self;
}

@end

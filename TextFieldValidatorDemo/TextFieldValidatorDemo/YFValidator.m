//
//  YFValidator.m
//  TextFieldValidatorDemo
//
//  Created by Yifeng Wu on 14-5-5.
//  Copyright (c) 2014年 YFKits. All rights reserved.
//

#import "YFValidator.h"

@implementation YFValidator
#pragma mark -

+ (instancetype)validator
{
    return [[self alloc] init];
}

+ (instancetype)validatorWithValidationFunc:(ValidationFunc)block
{
    YFValidator * validator = [[self alloc] initWithValidationFunc:block];
    return validator;
}

- (instancetype)initWithValidationFunc:(ValidationFunc)block
{
    self = [super init];
    if (self) {
        self.validationBlock = block;
    }
    
    return self;
}

- (BOOL)validateNextValue:(id)nextValue
{
    BOOL result = YES;
    if (nil != self.validationBlock) {
        result = self.validationBlock(nextValue);
    }
    
    if (result) {
        if (self.successBlock) {
            self.successBlock(nextValue);
        }
    }else {
        if (self.failureBlock) {
            self.failureBlock(nextValue);
        }
    }
    
    return result;
}

@end

@implementation YFValidator (Combination)

- (YFValidator *)validatorCombineValidator:(YFValidator *)validator
{
    YFValidator *combinedValidator = [[YFValidator alloc] init];
    combinedValidator.validationBlock = ^BOOL(id nextValue) {
        BOOL result = YES;
        if (nil != self.validationBlock) {
            result = self.validationBlock(nextValue);
        }
        
        if (result) {
            result = validator.validationBlock(nextValue);
        }
        
        return result;
    };
    
    combinedValidator.successBlock = self.successBlock;
    combinedValidator.failureBlock = self.failureBlock;
    
    return combinedValidator;
}

- (void)combineValidator:(YFValidator *)validator
{
    ValidationFunc blockCopy = self.validationBlock;
    self.validationBlock = ^BOOL(id nextValue){
        BOOL result = YES;
        if (nil != blockCopy) {
            result = blockCopy(nextValue);
        }
        if (result) {
            if (nil != validator.validationBlock) {
                result = validator.validationBlock(nextValue);
            }
        }
        
        return result;
    };
}

@end

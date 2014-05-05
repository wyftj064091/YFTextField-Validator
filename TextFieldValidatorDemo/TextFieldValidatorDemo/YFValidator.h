//
//  YFValidator.h
//  TextFieldValidatorDemo
//
//  Created by Yifeng Wu on 14-5-5.
//  Copyright (c) 2014年 YFKits. All rights reserved.
//

typedef void (^ValidationResult)(id nextValue);

typedef BOOL (^ValidationFunc)(id nextValue);

@interface YFValidator : NSObject

@property (nonatomic, strong) ValidationFunc validationBlock;

@property (nonatomic, strong) ValidationResult successBlock;

@property (nonatomic, strong) ValidationResult failureBlock;

+ (instancetype)validator;

+ (instancetype)validatorWithValidationFunc:(ValidationFunc)block;

- (instancetype)initWithValidationFunc:(ValidationFunc)block;

- (BOOL)validateNextValue:(id)nextValue;

@end

@interface YFValidator (Combination)

- (YFValidator *)validatorCombineValidator:(YFValidator *)validator;

- (void)combineValidator:(YFValidator *)validator;


@end

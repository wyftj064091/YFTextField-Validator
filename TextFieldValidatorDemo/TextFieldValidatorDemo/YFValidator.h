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

/**
 *  a validation block property, it will be called in validate next value method.
 */
@property (nonatomic, strong) ValidationFunc validationBlock;

/**
 *  a validation result block that indicate what to do when validate succeed.
 */
@property (nonatomic, strong) ValidationResult successBlock;

/**
 *  a validation result block that indicate what to do when validate failed.
 */
@property (nonatomic, strong) ValidationResult failureBlock;

/**
 *  Return the default validator without validation block.
 *
 *  @return validator instance.
 */
+ (instancetype)validator;

/**
 *  Return the validator with given validation block.
 *
 *  @param block validation block which could be nil.
 *
 *  @return the validator instance contains given block.
 */
+ (instancetype)validatorWithValidationFunc:(ValidationFunc)block;

/**
 *  Return the validator with given validation block. Init method.
 *
 *  @param block validation block which cound be nil.
 *
 *  @return the validator instance contains given block.
 */
- (instancetype)initWithValidationFunc:(ValidationFunc)block;

/**
 *  The validate method that will be invoked by the control such as textfield.
 *  Return the validate result of the given value.
 *
 *  @param nextValue the value will be valid.
 *
 *  @return result of validation.
 */
- (BOOL)validateNextValue:(id)nextValue;

@end

@interface YFValidator (Combination)

/**
 *  Create a new validator with given validator and previous validator.
 *  Notice, the success and failure will be the one of receive's.
 *
 *  @param validator given combined validator.
 *
 *  @return new validator that contains previous and combined validation block.
 */
- (YFValidator *)validatorCombineValidator:(YFValidator *)validator;

/**
 *  Combine the validation block of validator with receive.
 *
 *  @param validator previous validator with new validation block.
 */
- (void)combineValidator:(YFValidator *)validator;


@end

//
//  YFRegularValidator.h
//  TextFieldValidatorDemo
//
//  Created by Yifeng Wu on 14-5-5.
//  Copyright (c) 2014年 YFKits. All rights reserved.
//

#import "YFValidator.h"

@interface YFRegularValidator : YFValidator

/**
 *  Validation expression, validate method will not use the validation exppression directory 
 *  but to use the validation block.
 */
@property (nonatomic, strong) NSRegularExpression * validationExpression;

/**
 *  Create the validator with given reqular expression.
 *
 *  @param expression validation expression
 *
 *  @return validator instance with validation expreesion and validation block which generated in init method.
 */
+ (instancetype)validatorWithRegularExpression:(NSRegularExpression *)expression;

/**
 *  Init the validator with given regular expression.
 *
 *  @param expression validation expression
 *
 *  @return validator instance with validation expression, then generate the validation block in validation expression setter.
 */
- (instancetype)initWithReqularExpression:(NSRegularExpression *)expression;

@end

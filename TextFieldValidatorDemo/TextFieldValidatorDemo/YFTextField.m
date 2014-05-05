//
//  YFTextField.m
//  TextFieldValidatorDemo
//
//  Created by Yifeng Wu on 14-5-5.
//  Copyright (c) 2014年 YFKits. All rights reserved.
//

#import "YFTextField.h"
#import "YFValidator.h"

@interface _TextFieldProxy : NSObject <UITextFieldDelegate>

@end

@implementation _TextFieldProxy
#pragma mark -
#pragma mark Forward Delegate Methods

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if ([textField.delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        return [textField.delegate textFieldShouldBeginEditing:textField];
    }else {
        return YES;
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([textField.delegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        [textField.delegate textFieldDidBeginEditing:textField];
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if ([textField.delegate respondsToSelector:@selector(textFieldShouldEndEditing:)]) {
        return [textField.delegate textFieldShouldEndEditing:textField];
    }else {
        return YES;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([textField.delegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
        [textField.delegate textFieldDidEndEditing:textField];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    BOOL result = YES;
    YFTextField * tempTextField = (YFTextField *)textField;
    if (tempTextField.validator != nil) {
        NSString * resultString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        result = [tempTextField.validator validateNextValue:resultString];
    }
    
    if ([textField.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)] && result) {
        result = [textField.delegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    
    return result;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    BOOL result = YES;
    YFTextField * tempTextField = (YFTextField *)textField;

    if (tempTextField.validator != nil) {
        result = [tempTextField.validator validateNextValue:nil];
    }

    if ([textField.delegate respondsToSelector:@selector(textFieldShouldClear:)] && result) {
        return [textField.delegate textFieldShouldClear:textField];
    }
    
    return result;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField.delegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        return [textField.delegate textFieldShouldReturn:textField];
    }else {
        return YES;
    }
}

@end

@interface YFTextField ()
{
    id<UITextFieldDelegate> _realDelegate;
    id<UITextFieldDelegate> _textFieldProxy;
}

@end

@implementation YFTextField

#pragma mark -
#pragma mark Overwrite
- (void)setDelegate:(id<UITextFieldDelegate>)delegate
{
    if (_realDelegate != delegate) {
        //Forward the given delegate to realDelegate
        [self willChangeValueForKey:@"delegate"];
        _realDelegate = delegate;
        [self didChangeValueForKey:@"delegate"];
    }
}

- (id<UITextFieldDelegate>)delegate
{
    return _realDelegate;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _textFieldProxy = [[_TextFieldProxy alloc] init];
        [super setDelegate:_textFieldProxy];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _textFieldProxy = [[_TextFieldProxy alloc] init];
        [super setDelegate:_textFieldProxy];
    }
    
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        _textFieldProxy = [[_TextFieldProxy alloc] init];
        [super setDelegate:_textFieldProxy];
    }
    
    return self;
}

@end

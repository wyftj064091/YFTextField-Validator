//
//  RCDDetailViewController.m
//  TextFieldValidatorDemo
//
//  Created by Yifeng Wu on 14-5-5.
//  Copyright (c) 2014年 YFKits. All rights reserved.
//

#import "RCDDetailViewController.h"
#import "YFTextField.h"
#import "YFNumericValidator.h"
#import "YFEmailValidator.h"

@interface RCDDetailViewController ()
@end

@implementation RCDDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.textField.delegate = self;
    self.textField.validator = [YFNumericValidator validator];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 
#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"Function %s", __FUNCTION__);
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"Function %s", __FUNCTION__);
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    NSLog(@"Function %s", __FUNCTION__);
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"Function %s", __FUNCTION__);
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"Function %s", __FUNCTION__);
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    NSLog(@"Function %s", __FUNCTION__);
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"Function %s", __FUNCTION__);
    return YES;
}

@end

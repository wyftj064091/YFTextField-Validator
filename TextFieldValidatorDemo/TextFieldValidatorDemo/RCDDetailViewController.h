//
//  RCDDetailViewController.h
//  TextFieldValidatorDemo
//
//  Created by Yifeng Wu on 14-5-5.
//  Copyright (c) 2014年 YFKits. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YFTextField;

@interface RCDDetailViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet YFTextField *textField;
@end

//
//  ViewController.m
//  task3
//
//  Created by Anton Lookin on 12/16/15.
//  Copyright © 2015 geekub. All rights reserved.
//

#import "FormViewController.h"

@interface FormViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextView *commentsTextView;

@end

@implementation FormViewController

- (void)viewDidLoad {
	[super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
	
}


- (IBAction)saveButtonTouch:(id)sender {
    
}


- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.nameTextField) {
        [self.emailTextField becomeFirstResponder];
    } else if (textField == self.emailTextField) {
        [self.phoneTextField becomeFirstResponder];
    } else if (textField == self.phoneTextField){
        [self.addressTextField becomeFirstResponder];
    } else if (textField == self.addressTextField) {
        [self.commentsTextView becomeFirstResponder];
    }
    return YES;
}

- (void)keyboardWillShow: (NSNotification *) notification {
    self.navigationController.navigationBarHidden = YES;
}

- (void)keyboardWillHide: (NSNotification *) notification {
    self.navigationController.navigationBarHidden = NO;
}

- (IBAction)tapOnVIew:(id)sender {
    [self.view endEditing:YES];
}

@end

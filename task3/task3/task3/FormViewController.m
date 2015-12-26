//
//  ViewController.m
//  task3
//
//  Created by Anton Lookin on 12/16/15.
//  Copyright © 2015 geekub. All rights reserved.
//

#import "FormViewController.h"
#import "ResultViewController.h"

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
    if (self.nameTextField.text.length == 0 ) {
        [self showAlertMessage:@"Invalid name"];
        return;
    }
    if (![self textIsValidEmailFormat:self.emailTextField.text]) {
        [self showAlertMessage:@"Invalid email"];
        return;
    }
    if (![self textIsNumber:self.phoneTextField.text]) {
        [self showAlertMessage:@"Invalid phone"];
        return;
    }
    if (self.addressTextField.text.length == 0 ) {
        [self showAlertMessage:@"Invalid address"];
        return;
    }
    [self performSegueWithIdentifier:@"showResult" sender:nil];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [segue.destinationViewController setResultString:[self prepareData]];
}

- (NSAttributedString*) prepareData {
    NSMutableAttributedString *result = [[NSMutableAttributedString alloc] init];
    NSDictionary *titleAttributes = @{
                                      NSFontAttributeName: [UIFont fontWithName: @"HelveticaNeue-Bold" size:18],
                                      NSForegroundColorAttributeName: [UIColor blackColor]
                                      };
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName: [UIFont fontWithName: @"HelveticaNeue" size:16],
                                     NSForegroundColorAttributeName: [UIColor darkGrayColor]
                                     };
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentLeft;
    paragraph.lineSpacing = 10;
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    NSAttributedString *lineBreak = [[NSAttributedString alloc] initWithString:@"\n" attributes:nil];
    
    NSMutableAttributedString *nameTitle = [[NSMutableAttributedString alloc]initWithString:@"Name: " attributes:titleAttributes];
    NSMutableAttributedString *name = [[NSMutableAttributedString alloc]initWithString:self.nameTextField.text attributes:textAttributes];
    [nameTitle appendAttributedString:name];
    [nameTitle addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, 1)];
    [nameTitle insertAttributedString:lineBreak atIndex:0];
    [result appendAttributedString:nameTitle];
    
    NSMutableAttributedString *emailTitle = [[NSMutableAttributedString alloc]initWithString:@"Email: " attributes:titleAttributes];
    NSMutableAttributedString *email = [[NSMutableAttributedString alloc]initWithString:self.emailTextField.text attributes:textAttributes];
    [emailTitle appendAttributedString:email];
    [emailTitle addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, 1)];
    [emailTitle insertAttributedString:lineBreak atIndex:0];
    [result appendAttributedString:emailTitle];
    
    NSMutableAttributedString *phoneTitle = [[NSMutableAttributedString alloc]initWithString:@"Phone Number: " attributes:titleAttributes];
    NSMutableAttributedString *phone = [[NSMutableAttributedString alloc]initWithString:self.phoneTextField.text attributes:textAttributes];
    [phoneTitle appendAttributedString:phone];
    [phoneTitle addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, 1)];
    [phoneTitle insertAttributedString:lineBreak atIndex:0];
    [result appendAttributedString:phoneTitle];
    
    NSMutableAttributedString *addressTitle = [[NSMutableAttributedString alloc]initWithString:@"Address: " attributes:titleAttributes];
    NSMutableAttributedString *address = [[NSMutableAttributedString alloc]initWithString:self.addressTextField.text attributes:textAttributes];
    [addressTitle appendAttributedString:address];
    [addressTitle addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, 1)];
    [addressTitle insertAttributedString:lineBreak atIndex:0];
    [result appendAttributedString:addressTitle];
    
    NSMutableAttributedString *commentsTitle = [[NSMutableAttributedString alloc]initWithString:@"Comments: " attributes:titleAttributes];
    NSMutableAttributedString *comments = [[NSMutableAttributedString alloc]initWithString:self.commentsTextView.text attributes:textAttributes];
    [commentsTitle appendAttributedString:comments];
    [commentsTitle addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, 1)];
    [commentsTitle insertAttributedString:lineBreak atIndex:0];
    [result appendAttributedString:commentsTitle];
    return result;
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


- (BOOL)textIsValidEmailFormat:(NSString *)text {
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:text];
}

- (BOOL)textIsNumber:(NSString*)text {
    if([text rangeOfCharacterFromSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]].location == NSNotFound) {
        return YES;
    } else {
        return NO;
    }
}

-(void)showAlertMessage:(NSString*) text {
    [[[UIAlertView alloc] initWithTitle:@"Task3" message:text delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
}



@end

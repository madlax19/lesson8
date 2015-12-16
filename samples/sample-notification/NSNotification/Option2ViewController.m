//
//  Option2ViewController.m
//  NSNotification
//
//  Created by Marcelo Sampaio on 10/26/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "Option2ViewController.h"
#import "Settings.h"

@interface Option2ViewController ()

@end

@implementation Option2ViewController

@synthesize segmentedControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UI Actions
- (IBAction)segmentSelected:(id)sender {
    NSLog(@"segmentedSelectedIndex=%@", @(self.segmentedControl.selectedSegmentIndex));
    // Post notification
	NSString *message = [NSString stringWithFormat:@"Selected Segment is (%@)", @(self.segmentedControl.selectedSegmentIndex)];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SegmentNotification"
														object:[[Settings alloc] initWithMessage:message data:@"0"]];
}



@end

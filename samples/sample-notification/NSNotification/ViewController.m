//
//  ViewController.m
//  NSNotification
//
//  Created by Marcelo Sampaio on 10/26/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "ViewController.h"
#import "Settings.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set up Notification center
    [[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(notificationAction:)
												 name:@"SegmentNotification" object:nil];
    

}


#pragma mark - Notification Selectors
- (void) notificationAction:(NSNotification *)transientObject {
    Settings *settings=transientObject.object;
    
    NSLog(@"*** Action: %@    data=%@",settings.message,settings.data);

    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Notification Center"
													  message:[NSString stringWithFormat:@"%@.     \nData Length = %@.",settings.message,settings.data]
													 delegate:self cancelButtonTitle:@"OK"
											otherButtonTitles:nil];
    [alertView show];
}




#pragma mark - Navigation
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"prepareForSegue identifier = %@",segue.identifier);
}
@end

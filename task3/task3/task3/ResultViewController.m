//
//  ResultViewController.m
//  task3
//
//  Created by Anton Lookin on 12/16/15.
//  Copyright © 2015 geekub. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ResultViewController

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.resultLabel.attributedText = self.resultString;
}


@end

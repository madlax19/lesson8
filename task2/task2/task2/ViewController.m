//
//  ViewController.m
//  task2
//
//  Created by Anton Lookin on 12/16/15.
//  Copyright © 2015 geekub. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	
}

- (IBAction) addButtonTapped:(id)sender {
	NSString* stringTemplate = @"Random styled paragraph skjdf jksfjksfksjkf sldkfj klsjfkl sjlfjskldjfkl sjlfjs lkdfjkls jdfskj";
	NSMutableAttributedString *paragraphContent = [[NSMutableAttributedString alloc]
												   initWithString:stringTemplate
												   attributes:@{
																NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:arc4random_uniform(20)],
																NSForegroundColorAttributeName: [UIColor grayColor]
																}];
	NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
	paragraph.alignment = NSTextAlignmentRight;
	paragraph.lineSpacing = 10;
	paragraph.lineBreakMode = NSLineBreakByCharWrapping;
	
	[paragraphContent addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, 1)];
	NSAttributedString *lineBreak = [[NSAttributedString alloc] initWithString:@"\n" attributes:nil];
	[paragraphContent insertAttributedString:lineBreak atIndex:0];
	
	NSMutableAttributedString *labelContent = [[NSMutableAttributedString alloc] initWithAttributedString:self.textLabel.attributedText];
	[labelContent appendAttributedString:paragraphContent];
	
	self.textLabel.attributedText = labelContent;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end

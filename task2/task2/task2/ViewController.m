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
@property (nonatomic, strong) NSMutableArray *fontsList;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
    self.fontsList = [NSMutableArray array];
    
    for (id familyName in [UIFont familyNames]) {
        for (id fontName in [UIFont fontNamesForFamilyName:familyName])
            [self.fontsList addObject:fontName];
    }
	
}

- (UIColor*) randomColor{
    CGFloat red = (CGFloat)arc4random_uniform(255) / 255.0;
    CGFloat green = (CGFloat)arc4random_uniform(255) / 255.0;
    CGFloat blue = (CGFloat)arc4random_uniform(255) / 255.0;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

- (IBAction) addButtonTapped:(id)sender {
	NSString* stringTemplate = @"Random styled paragraph skjdf jksfjksfksjkf sldkfj klsjfkl sjlfjskldjfkl sjlfjs lkdfjkls jdfskj";
    NSString *fontName = [self.fontsList objectAtIndex:arc4random_uniform(self.fontsList.count)];
	NSMutableAttributedString *paragraphContent = [[NSMutableAttributedString alloc]
												   initWithString:stringTemplate
												   attributes:@{
																NSFontAttributeName: [UIFont fontWithName: fontName size:arc4random_uniform(20)],
                                                                NSForegroundColorAttributeName: [self randomColor]
																}];
	NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
	paragraph.alignment = (NSTextAlignment)arc4random_uniform(5);
	paragraph.lineSpacing = arc4random_uniform(15);
	paragraph.lineBreakMode = (NSLineBreakMode)arc4random_uniform(6);
	
	[paragraphContent addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, 1)];
	NSAttributedString *lineBreak = [[NSAttributedString alloc] initWithString:@"\n" attributes:nil];
	[paragraphContent insertAttributedString:lineBreak atIndex:0];
	
	NSMutableAttributedString *labelContent = [[NSMutableAttributedString alloc] initWithAttributedString:self.textLabel.attributedText];
	[labelContent appendAttributedString:paragraphContent];
	
	self.textLabel.attributedText = labelContent;
}

- (IBAction)clearButtonTouch:(id)sender {
    self.textLabel.text = nil;
}

- (void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        self.textLabel.text = self.textLabel.text;
    } else {
        NSAttributedString *text = [[NSAttributedString alloc] initWithString:[self.textLabel.text substringToIndex:199] attributes:@{
                                                                                                                                      NSStrikethroughStyleAttributeName: @1
                                                                                                                                      }];
        self.textLabel.attributedText = text;
    }
}

@end

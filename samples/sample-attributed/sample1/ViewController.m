//
//  ViewController.m
//  sample1
//
//  Created by Anton Lookin on 12/14/15.
//  Copyright © 2015 geekub. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	NSString* s1 = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate nisi et congue feugiat. Aliquam consectetur ipsum a nunc condimentum, vel ullamcorper velit condimentum.";
	NSMutableAttributedString* content = [[NSMutableAttributedString alloc] initWithString:s1
																				attributes:
										  @{
											NSFontAttributeName: [UIFont fontWithName:@"Arial-BoldMT" size:15],
											NSForegroundColorAttributeName: [UIColor colorWithRed:0.251 green:0.000 blue:0.502 alpha:1]
	   }];
	NSRange r = [s1 rangeOfString:@"Lorem ipsum dolor sit amet"];
	[content addAttributes:
	 @{
	   NSStrokeColorAttributeName:[UIColor redColor],
	   NSStrokeWidthAttributeName: @-2.0
	   }
					 range:r];
	
	NSMutableParagraphStyle* para = [NSMutableParagraphStyle new];
	para.headIndent = 10;
	para.firstLineHeadIndent = 10;
	para.tailIndent = -10;
	para.lineBreakMode = NSLineBreakByWordWrapping;
	para.alignment = NSTextAlignmentRight;
	para.paragraphSpacing = 15;
	[content addAttribute:NSParagraphStyleAttributeName
					value:para range:NSMakeRange(0,1)];
	
	NSString* s2 = @"Curabitur dignissim ligula ex, eu ultricies urna sodales eget. Nullam vitae lacus eu sem egestas tempus sit amet sit amet mi. Nulla eu feugiat erat. Etiam lobortis libero metus, eget volutpat dolor gravida euismod. Donec id eros arcu. Quisque consectetur, ipsum dignissim aliquet ornare, odio lectus posuere sapien, in rhoncus risus ipsum non sapien. Aliquam erat volutpat.";
	NSMutableAttributedString* content2 = [[NSMutableAttributedString alloc] initWithString:s2
																				 attributes:
										   @{
											 NSFontAttributeName: [UIFont fontWithName:@"HoeflerText-Black" size:16]
											 }];
	[content2 setAttributes:
	 @{
	   NSFontAttributeName:[UIFont fontWithName:@"HoeflerText-Black" size:24]
	   }
					  range:NSMakeRange(0,1)];
	[content2 addAttributes:
	 @{
	   NSKernAttributeName:@-4
	   }
					  range:NSMakeRange(0,1)];
	
	NSMutableParagraphStyle* para2 = [NSMutableParagraphStyle new];
	para2.headIndent = 10;
	para2.firstLineHeadIndent = 10;
	para2.tailIndent = -10;
	para2.lineBreakMode = NSLineBreakByWordWrapping;
	para2.alignment = NSTextAlignmentJustified;
	para2.lineHeightMultiple = 1.2;
	para2.hyphenationFactor = 1.0;
	[content2 addAttribute:NSParagraphStyleAttributeName
					 value:para2 range:NSMakeRange(0,1)];
	
	NSInteger end = content.length;
	[content replaceCharactersInRange:NSMakeRange(end, 0) withString:@"\n"];
	[content appendAttributedString:content2];
	
//	self.headerLabel.attributedText = content;
	[self printSystemFonts];
}

- (void)printSystemFonts {
	NSMutableString *fonts = [NSMutableString new];
	for (NSString *fontFamily in [UIFont familyNames]) {
		[fonts appendFormat:@"%@\n", fontFamily];
		NSLog(@"%@", fontFamily);
		for (NSString *fontName in [UIFont fontNamesForFamilyName:fontFamily]) {
			[fonts appendFormat:@"              %@\n", fontName];
		}
	}
	NSLog(@"%@", fonts);
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


-(void) viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
	
	CGRect r = [self.headerLabel.attributedText boundingRectWithSize:self.headerLabel.frame.size
															 options:NSStringDrawingUsesLineFragmentOrigin
															 context:nil];
	NSLog(@"\n%@\n%@", NSStringFromCGRect(r), NSStringFromCGRect(CGRectIntegral(r)));
	
}

@end

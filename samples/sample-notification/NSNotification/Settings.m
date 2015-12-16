//
//  Settings.m
//  NSNotification
//
//  Created by Marcelo Sampaio on 10/26/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "Settings.h"

@implementation Settings
@synthesize message,data;


- (id)initWithMessage:(NSString*)p_Message data:(NSString *)p_Data {
    self = [super init];
    if (self) {
        message=p_Message;
        data=p_Data;
    }
    return self;
}

@end

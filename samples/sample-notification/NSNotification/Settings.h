//
//  Settings.h
//  NSNotification
//
//  Created by Marcelo Sampaio on 10/26/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Settings : NSObject

@property (nonatomic,strong) NSString *message;
@property (nonatomic,strong) NSString *data;

- (id)initWithMessage:(NSString*)p_Message data:(NSString *)p_Data;

@end

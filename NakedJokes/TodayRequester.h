//
//  TodayRequester.h
//  NakedChinese
//
//  Created by IMAC  on 30.12.14.
//  Copyright (c) 2014 Dmitriy Karachentsov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TodayRequesterProtocol <NSObject>
@optional
- (void) requesterProtocolRequestResponse:(NSDictionary*)dict;
- (void) requesterProtocolRequestFailure:(NSString*)failureDescription;
@end

@interface TodayRequester : NSObject

@property (nonatomic, strong) id<TodayRequesterProtocol> delegate;
- (void) requestPath:(NSString*)pathString withParameters:(NSDictionary*) params isPOST:(BOOL) isPost delegate:(SEL) method;

@end

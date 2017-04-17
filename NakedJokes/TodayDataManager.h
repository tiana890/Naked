//
//  TodayDataManager.h
//  NakedChinese
//
//  Created by IMAC  on 30.12.14.
//  Copyright (c) 2014 Dmitriy Karachentsov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TodayRequester.h"

@protocol TodayDataManagerProtocol <NSObject>
@optional
- (void) ncDataManagerProtocolGetWordsWithPackID:(NSArray *)arrayOfWords;
@end

@interface TodayDataManager : NSObject<TodayRequesterProtocol>


+(TodayDataManager *) sharedInstance;

- (void) getWordsWithPackID:(int)packID;

@property (nonatomic, weak) id<TodayDataManagerProtocol> delegate;

@end

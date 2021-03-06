//
//  TodayWord.h
//  NakedChinese
//
//  Created by IMAC  on 30.12.14.
//  Copyright (c) 2014 Dmitriy Karachentsov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TodayMaterial.h"

@interface TodayWord : NSObject

@property (nonatomic, strong) NSNumber *ID;
@property (nonatomic, strong) NSNumber *packID;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *bigImage;
@property (nonatomic, strong) NSNumber *paid;
@property (nonatomic, strong) NSNumber *show;
//material
/*
 @property (nonatomic, strong) NSString *materialZH;
 @property (nonatomic, strong) NSString *materialZH_TR;
 @property (nonatomic, strong) NSString *materialEN;
 @property (nonatomic, strong) NSString *materialRU;
 @property (nonatomic, strong) NSString *materialSound;
 #warning передалать в NSDate
 @property (nonatomic, strong) NSString *materialLastUpdate;
 */
@property (nonatomic, strong) TodayMaterial *material;

+ (TodayWord*) getTodayWordFromJSON:(NSDictionary *)jsonDict;


@end


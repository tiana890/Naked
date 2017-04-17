//
//  TodayWord.m
//  NakedChinese
//
//  Created by IMAC  on 30.12.14.
//  Copyright (c) 2014 Dmitriy Karachentsov. All rights reserved.
//

#import "TodayWord.h"


@implementation TodayWord

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.material = [[TodayMaterial alloc] init];
    }
    return self;
}

+ (TodayWord*) getTodayWordFromJSON:(NSDictionary *)jsonDict
{
    TodayWord *word = [[TodayWord alloc] init];
    
    if([jsonDict objectForKey:@"id"] != [NSNull null])
    {
        word.ID = [jsonDict objectForKey:@"id"];
    }
    
    if([jsonDict objectForKey:@"pack_id"] != [NSNull null])
    {
        word.packID = [jsonDict objectForKey:@"pack_id"];
    }
    
    if([jsonDict objectForKey:@"image"] != [NSNull null])
    {
        word.image = [jsonDict objectForKey:@"image"];
    }
    if([jsonDict objectForKey:@"imageBig"] != [NSNull null])
    {
        word.bigImage = [jsonDict objectForKey:@"image"];
    }
    
    if([jsonDict objectForKey:@"paid"] != [NSNull null])
    {
        word.paid = [jsonDict objectForKey:@"paid"];
    }
    
    if([jsonDict objectForKey:@"show"] != [NSNull null])
    {
        word.show = [jsonDict objectForKey:@"show"];
    }
    
    if([jsonDict objectForKey:@"material"] != [NSNull null])
    {
        NSDictionary *materialDict = [jsonDict objectForKey:@"material"];
        word.material = [TodayMaterial getTodayMaterialFromJSON:materialDict];
        word.material.materialID = word.ID;
    }
    return word;
}



@end


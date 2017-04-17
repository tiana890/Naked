

//
//  NCMaterial.m
//  NakedChinese
//
//  Created by IMAC  on 30.10.14.
//  Copyright (c) 2014 Dmitriy Karachentsov. All rights reserved.
//

#import "TodayMaterial.h"

@implementation TodayMaterial

+ (TodayMaterial *) getTodayMaterialFromJSON:(NSDictionary *)jsonDict
{
    TodayMaterial *material = [[TodayMaterial alloc] init];
    
    if([jsonDict objectForKey:@"zh"] != [NSNull null])
    {
        material.materialZH = [jsonDict objectForKey:@"zh"];
    }
    
    if([jsonDict objectForKey:@"zh_tr"] != [NSNull null])
    {
        material.materialZH_TR = [jsonDict objectForKey:@"zh_tr"];
    }
    
    if([jsonDict objectForKey:@"en"] != [NSNull null])
    {
        material.materialEN = [jsonDict objectForKey:@"en"];
    }
    
    if([jsonDict objectForKey:@"ru"] != [NSNull null])
    {
        material.materialRU = [jsonDict objectForKey:@"ru"];
    }
    
    if([jsonDict objectForKey:@"sound"] != [NSNull null])
    {
        material.materialSound = [jsonDict objectForKey:@"sound"];
    }
    
    if([jsonDict objectForKey:@"last_update"] != [NSNull null])
    {
        material.materialLastUpdate = [jsonDict objectForKey:@"last_update"];
    }
    
    return material;
}

- (NSString *)materialWord
{
    if([NSLocalizedString(@"lang", nil) isEqualToString:@"ru"])
    {
        return self.materialRU;
    }
    else
    {
        return self.materialEN;
    }
    
}

@end

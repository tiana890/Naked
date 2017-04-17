//
//  TodayDataManager.m
//  NakedChinese
//
//  Created by IMAC  on 30.12.14.
//  Copyright (c) 2014 Dmitriy Karachentsov. All rights reserved.
//

#import "TodayDataManager.h"
#import "TodayWord.h"

@implementation TodayDataManager

+(TodayDataManager*) sharedInstance
{
    static TodayDataManager* sDataManager = nil;
    static dispatch_once_t predicate;
    dispatch_once( &predicate, ^{
        sDataManager = [ [ self alloc ] init ];
        
        /*[[NSNotificationCenter defaultCenter] addObserver:sDataManager selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
        sDataManager.internetReachability = [Reachability reachabilityForInternetConnection];
        if(sDataManager.internetReachability.currentReachabilityStatus != NotReachable)
        {
            sDataManager.internetMode = ONLINE_MODE;
        }
        else
        {
            sDataManager.internetMode = OFFLINE_MODE;
        }
        
        [sDataManager.internetReachability startNotifier];
        
        sDataManager.dbHelper = [[DBHelper alloc] init];*/
    } );
    return sDataManager;
}

- (void) getWordsWithPackID:(int)packID
{
    
    TodayRequester *requester = [[TodayRequester alloc] init];
    requester.delegate = self;
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:[NSNumber numberWithInt:packID] forKey:@"pack_id"];
    [requester requestPath:@"word" withParameters:dict isPOST:NO delegate:@selector(getWordsWithPackIDResponse:)];
}

- (void) getWordsWithPackIDResponse:(NSDictionary *)jsonDict
{
    NSArray *jsonArray = (NSArray *)jsonDict;
    NSMutableArray *wordArray = [[NSMutableArray alloc] init];
    for(NSDictionary *dict in jsonArray)
    {
        [wordArray addObject:[TodayWord getTodayWordFromJSON:dict]];
    }
    /*
     //проверяем, есть ли этот пакет в БД
     NSArray *wordsArray = [[NSArray alloc] init];
     
     if(wordArray.count > 0)
     {
     NCWord *word = wordArray[0];
     wordsArray = [[NCDataManager sharedInstance].dbHelper getWordsFromDBWithPackID:[word.packID intValue]];
     }
     if(wordsArray.count > 0)
     {
     [[NCDataManager sharedInstance].dbHelper setWordsToDB:wordArray];
     }
     */
    if([[TodayDataManager sharedInstance].delegate respondsToSelector:@selector(ncDataManagerProtocolGetWordsWithPackID:)])
    {
        [[TodayDataManager sharedInstance].delegate ncDataManagerProtocolGetWordsWithPackID:wordArray];
    }
}


@end

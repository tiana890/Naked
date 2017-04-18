//
//  TodayRequester.m
//  NakedChinese
//
//  Created by IMAC  on 30.12.14.
//  Copyright (c) 2014 Dmitriy Karachentsov. All rights reserved.
//

#import "TodayRequester.h"
//#import "AFNetworking.h"

#define SERVER_ADDRESS @"http://www.nakedchineseapp.com/api/get/"

@implementation TodayRequester

- (void) requestPath:(NSString*)pathString withParameters:(NSDictionary*) params isPOST:(BOOL) isPost delegate:(SEL) method
{
    
//    NSURL *baseURL = [NSURL URLWithString:SERVER_ADDRESS];
//    NSURL *url = [NSURL URLWithString:pathString relativeToURL:baseURL];
//    
//    if(isPost == YES)
//    {
//        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//        //manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
//        
//        [manager POST:pathString parameters:params success:^(NSURLSessionDataTask *task , id responseObject)
//         {
//             NSLog(@"%@", responseObject);
//         }failure:^(NSURLSessionDataTask *task , NSError *error )
//         {
//             if([_delegate respondsToSelector:@selector(requesterProtocolRequestFailure:)])
//             {
//                 [_delegate performSelector:@selector(requesterProtocolRequestFailure:) withObject:[self errorMessage:error]];
//             }
//         }];
//        
//    }
//    else
//    {
//        
//        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//        // manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
//        NSLog(@"%@", url.absoluteString);
//        [manager GET:url.absoluteString parameters:params success:^(NSURLSessionDataTask *task , id responseObject)
//         {
//             if([_delegate respondsToSelector:method])
//             {
//                 NSDictionary *d = responseObject;
//                 NSLog(@"%@", responseObject);
//                 [_delegate performSelector:method withObject:d];
//             }
//             
//         }failure:^(NSURLSessionDataTask *task , NSError *error )
//         {
//             NSLog(@"Error %@", error.description);
//             if([_delegate respondsToSelector:@selector(requesterProtocolRequestFailure:)])
//             {
//                 
//                 [_delegate performSelector:@selector(requesterProtocolRequestFailure:) withObject:[self errorMessage:error]];
//             }
//         }];
//        
//    }
}


- (NSString*) errorMessage:(NSError*) error
{
    NSString *errorMessage = [[NSString alloc] init];
    NSLog(@"%@", [error localizedFailureReason]);
    errorMessage = @"Ошибка при загрузке данных!";
    return errorMessage;
}
@end


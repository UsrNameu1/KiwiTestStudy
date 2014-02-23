//
//  YADWebServiceSpec.m
//  TestStudy
//
//  Created by adachi yuichi on 2014/02/09.
//  Copyright (c) 2014年 yadkari. All rights reserved.
//

#import "Kiwi.h"
#import "YADWebService.h"

SPEC_BEGIN(YADWebServiceSpec)

describe(@"指定URLからレスポンスを取得", ^{
    
    __block YADWebService *webService;
    __block NSURL *mockURL;
    
    beforeAll(^{
        mockURL = [NSURL URLWithString:@"https://"];
        webService = [[YADWebService alloc] initWithURL:mockURL];
    });
    
    context(@"正常系", ^{
        
        __block NSDictionary *object;
        
        beforeAll(^{
            object = @{@"id" : @(12345),
                           @"name" : @"mock"};
            NSData *data = [NSJSONSerialization dataWithJSONObject:object
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:nil];
            [NSURLConnection stub:@selector(sendAsynchronousRequest:queue:completionHandler:)
                        withBlock:^id(NSArray *params) {
                
                void (^handler)(NSURLResponse *, NSData *, NSError *) = params[2];
                handler(nil, data, nil);
                return nil;
            }];
        });
        
        it(@"responceObjectに値を格納して正常な値を返す", ^{
            [webService fetchDataWithCompletion:^(NSDictionary *response, NSError *error) {
                [[response should] beNonNil];
                [[response[@"id"] should] equal:object[@"id"]];
                [[response[@"name"] should] equal:object[@"name"]];
            }];
        });
    });
});

SPEC_END
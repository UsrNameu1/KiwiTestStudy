//
//  YADWebService.m
//  TestStudy
//
//  Created by adachi yuichi on 2014/02/09.
//  Copyright (c) 2014年 yadkari. All rights reserved.
//

#import "YADWebService.h"

@implementation YADWebService

- (instancetype)initWithURL:(NSURL *)url
{
    self = [super init];
    if (self) {
        _url = url;
    }
    return self;
}

- (void)fetchDataWithCompletion:(CompletionHandler)handler
{
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    
    [NSURLConnection
     sendAsynchronousRequest:request
     queue:[NSOperationQueue currentQueue]
     completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
         
         NSError *parseError;
         NSDictionary *responceObject =
         [NSJSONSerialization JSONObjectWithData:data
                                         options:NSJSONReadingAllowFragments
                                           error:&parseError];
         
         if (responceObject) {
             dispatch_async(dispatch_get_main_queue(), ^{
                 handler(responceObject, nil);
             });
         }
     }];
}

@end

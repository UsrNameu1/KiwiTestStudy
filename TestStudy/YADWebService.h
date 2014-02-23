//
//  YADWebService.h
//  TestStudy
//
//  Created by adachi yuichi on 2014/02/09.
//  Copyright (c) 2014年 yadkari. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CompletionHandler) (NSDictionary *responceObject, NSError *error);

@interface YADWebService : NSObject

@property (nonatomic) NSURL *url;

- (instancetype)initWithURL:(NSURL *)url;

- (void)fetchDataWithCompletion:(CompletionHandler)handler;

@end

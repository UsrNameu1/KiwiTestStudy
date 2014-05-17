//
//  YADWebService.h
//  TestStudy
//
//  Created by adachi yuichi on 2014/02/09.
//  Copyright (c) 2014年 yadkari. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  WebServiceの完了ハンドラブロックです。
 *
 *  @param responceObject レスポンスオブジェクト
 *  @param error          エラー
 */
typedef void (^CompletionHandler) (NSDictionary *responceObject, NSError *error);

/**
 *  URLを指定してJSONオブジェクトを取得するWebサービスクラスです。
 */
@interface YADWebService : NSObject

/**
 *  JSONオブジェクト取得先URL
 */
@property (nonatomic) NSURL *url;

/**
 *  指定イニシャライザです。
 *
 *  @param url 指定URL
 *
 *  @return インスタンス
 */
- (instancetype)initWithURL:(NSURL *)url;

/**
 *  データを取得します。完了後は完了ハンドラブロックに処理が渡ります。
 *
 *  @param handler 完了ハンドラ
 */
- (void)fetchDataWithCompletion:(CompletionHandler)handler;

@end

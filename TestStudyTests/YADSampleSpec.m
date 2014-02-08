//
//  YADSampleSpec.m
//  TestStudy
//
//  Created by adachi yuichi on 2014/02/08.
//  Copyright (c) 2014年 yadkari. All rights reserved.
//

#import "Kiwi.h"

SPEC_BEGIN(MathSpec)

describe(@"Math", ^{
    it(@"この計算式は合っておる", ^{
        NSUInteger a = 16;
        NSUInteger b = 26;
        [[theValue(a + b) should] equal:theValue(42)];
    });
});

SPEC_END
//
//  TestObjectiveC.m
//  ManualUILayout
//
//  Created by Alexey Klyotzin on 30/08/15.
//  Copyright (c) 2015 Test projects. All rights reserved.
//

#import "TestObjectiveC.h"
#import "User___.h"

@interface TestObjectiveC ()
{
    NSInteger *_valPtr;
}
@end

@implementation TestObjectiveC

- (void)testValPtr
{
    NSLog(@"%ld", *_valPtr);
}

- (void)run
{
    
    NSInteger value = 156;
    _valPtr = &value;
    
    NSLog(@"%ld", *_valPtr);
    
    [self performSelector:@selector(testValPtr) withObject:nil afterDelay:0.5];
}

@end

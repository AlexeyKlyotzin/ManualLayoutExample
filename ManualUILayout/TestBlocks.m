//
//  TestBlocks.m
//  ManualUILayout
//
//  Created by Alexey Klyotzin on 03/09/15.
//  Copyright (c) 2015 Test projects. All rights reserved.
//

#import "TestBlocks.h"

// Для удобного опререления переменных содержащих блок можно использовать typedef
typedef double (^AddFunc)(double x, double y);
typedef void (^PrintFunc)();


@interface TestBlocks ()
{
    void (^_incrementBy)(float);
    void (^_printAccum)();
    void (^_appendSomeText)(NSString *);
    PrintFunc _printFunc;
    
    NSMutableString * __weak _text;
    
    void (^_retainCycleBlock)();
    
    NSInteger _someInstanceVariable;
}

@property (nonatomic) NSInteger someProperty;

@end

@implementation TestBlocks

- (void)run
{
    //============= Синтаксис определения блоков =========================
    
    // 1      2      3        4              1        3        4
    double (^add)(double x, double y) =  ^ double (double x, double y) {
        return x + y;
    };
    
    /*
     *  1. Тип возвращаемого значения
     *  2. Имя переменной
     *  3. Аргумент 1
     *  4. Аргумент 2
    */
    
    const double value1 = 20.5;
    const double value2 = 27.3;
    
    double addResult = add(value1, value2);
    
    NSLog(@"addResult: %.4f", addResult);
    
    AddFunc add2 = add;
    
    NSLog(@"addResult: %.4f", add2(24.6, 44.1));
    
    void (^addAndPrint)(double x, double y) =  ^(double x, double y) {
        NSLog(@"addResult: %.4f", x + y);
    };
    
    addAndPrint(121.2, 45.258);
    
    void (^doSomenthing)() = ^{
        NSLog(@"addResult: %.4f", 36.0 + 145);
    };
    
    doSomenthing();
    
    //============= Захват переменных из внешней области видимости ==============================
    
    NSInteger multiplier = 4;
    
    NSInteger (^multiplyInt)(NSInteger) = ^ NSInteger (NSInteger intVal) {
        return intVal * multiplier;
    };
    
    NSLog(@"multiplyResult: %ld", multiplyInt(65));
    
    
    __block float accumulator = 0.0;
    
    void (^incrementBy)(float) = ^(float increment) {
        accumulator += increment;
    };
    
    incrementBy(24.8);
    incrementBy(36.6);
    accumulator += 1.4;
    
    NSLog(@"accumulator: %f", accumulator);
    
    _incrementBy = incrementBy;
    _printAccum = ^{
        NSLog(@"accumulator: %f", accumulator);
    };
    
    [self performSelector:@selector(testBlockWithCapture) withObject:nil afterDelay:0.2];
    
    //=========== Захват объектов =======================================
    
    NSMutableString *text = [NSMutableString new];
    
    void (^appendSomeText)(NSString *) = ^(NSString *str) {
        [text appendString:str];
    };
    
    _appendSomeText = appendSomeText;
    
    _printFunc = ^{
        NSLog(@"%@", text);
    };
    
    _text = text;
    
    appendSomeText(@"Word1");
    appendSomeText(@" ");
    appendSomeText(@"Word2");
    _printFunc();
    
    [self performSelector:@selector(testWeakText) withObject:nil afterDelay:0.2];
    
    
    //============ Retain cycle ==================
    
    _retainCycleBlock = ^{
        self.someProperty = 58;
        _someInstanceVariable = 20;
    };
}

- (void)testBlockWithCapture
{
    _incrementBy(1);
    _incrementBy(1);
    _incrementBy(1);
    _incrementBy(1);
    _printAccum();
}

- (void)testWeakText
{
    NSLog(@"%@", _text);
    _printFunc = nil;
    [self performSelector:@selector(testWeakText2) withObject:nil afterDelay:0.2];
}

- (void)testWeakText2
{
    NSLog(@"%@", _text);
}

- (void)dealloc
{
    NSLog(@"TestBlocksDealloc");
}

@end

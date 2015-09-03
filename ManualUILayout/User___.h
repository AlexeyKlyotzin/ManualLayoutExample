//
//  User.h
//  ManualUILayout
//
//  Created by Alexey Klyotzin on 30/08/15.
//  Copyright (c) 2015 Test projects. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User___ : NSObject
{
// По умолчанию все instance variables @protected
    
    NSInteger age;
@public
    NSString *username;
    
@private
    float weight;
}

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName;

@property NSInteger userId; //(assign, atomic, readwrite)
@property (nonatomic) NSString *firstName; //(strong, readwrite)
@property (copy, nonatomic) NSString *lastName;
@property (readonly, nonatomic) NSString *fullName;
@property (weak, nonatomic) NSString *weakProp;
@property (assign, nonatomic) float footSize;

@property (copy, nonatomic) void(^onFirstNameChanged)(NSString *prevFirstName, NSString *newFirstName);


@end

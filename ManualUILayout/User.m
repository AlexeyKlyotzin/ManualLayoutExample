//
//  User.m
//  ManualUILayout
//
//  Created by Alexey Klyotzin on 30/08/15.
//  Copyright (c) 2015 Test projects. All rights reserved.
//

#import "User.h"

@interface User ()
{
    float _height;
}

- (NSString *)calculateFullName;

@end

@implementation User

- (instancetype)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _height = 180;
    
    return self;
}

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.firstName = firstName;
    self.lastName = lastName;
    
    return self;
}

- (NSString *)calculateFullName
{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (NSString *)fullName
{
    return [self calculateFullName];
}

- (void)setFirstName:(NSString *)firstName
{
    NSString *prevFirstName = self.firstName;
    
    self.firstName = prevFirstName;
    
    if (self.onFirstNameChanged) {
        self.onFirstNameChanged(prevFirstName, self.firstName);
    }
}

- (BOOL)isEqual:(id)object
{
    return [object isKindOfClass:[User class]] && self.userId == ((User *)object).userId;
}

- (NSUInteger)hash
{
    return [@(self.userId) hash];
}

@end

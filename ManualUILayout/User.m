//
//  User.m
//  ManualUILayout
//
//  Created by Alexey Klyotzin on 03/09/15.
//  Copyright (c) 2015 Test projects. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithUserId:(NSInteger)userId
                      username:(NSString *)username
                     firstName:(NSString *)firstName
                      lastName:(NSString *)lastName
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.userId = userId;
    self.username = username;
    self.firstName = firstName;
    self.lastName = lastName;
    return self;
}

- (instancetype)initWithUserId:(NSInteger)userId
{
    return [self initWithUserId:userId
                       username:[NSString stringWithFormat:@"username%ld", userId]
                      firstName:[NSString stringWithFormat:@"FirstName%ld", userId]
                       lastName:[NSString stringWithFormat:@"LastName%ld", userId]];
}

- (instancetype)init
{
    return [self initWithUserId:777];
}

- (BOOL)isEqual:(id)object
{
    return [object isKindOfClass:[User class]] && self.userId == ((User *)object).userId;
}

- (NSUInteger)hash
{
    return [@(self.userId) hash];
}

- (id)copyWithZone:(NSZone *)zone
{
    return [[[self class] allocWithZone:zone] initWithUserId:self.userId
                                                    username:self.username
                                                   firstName:self.firstName
                                                    lastName:self.lastName];
}

@end

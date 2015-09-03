//
//  User.h
//  ManualUILayout
//
//  Created by Alexey Klyotzin on 03/09/15.
//  Copyright (c) 2015 Test projects. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject <NSCopying>

- (instancetype)initWithUserId:(NSInteger)userId
                      username:(NSString *)username
                     firstName:(NSString *)firstName
                      lastName:(NSString *)lastName;

- (instancetype)initWithUserId:(NSInteger)userId;


@property (nonatomic) NSInteger userId;
@property (nonatomic) NSString *username;
@property (nonatomic) NSString *firstName;
@property (nonatomic) NSString *lastName;

@end

//
//  TestContainers.m
//  ManualUILayout
//
//  Created by Alexey Klyotzin on 03/09/15.
//  Copyright (c) 2015 Test projects. All rights reserved.
//

#import "TestContainers.h"
#import "User.h"

@interface TestContainers ()

@end

@implementation TestContainers

- (void)run
{
    [self testArray];
    [self testSet];
    [self testDictionary];
}

- (NSArray *)makeUsersList
{
    NSMutableArray *users = [NSMutableArray new];
    
    for (NSInteger i = 1; i <= 20; i++) {
        [users addObject:[[User alloc] initWithUserId:i]];
    }
    
    return [users copy];
}

- (void)testArray
{
    NSMutableArray *users = [[self makeUsersList] mutableCopy];
    NSArray *simpleSyntaxArray = @[users[1], users[2], users[7]];
    
    for (User *user in users) {
        NSLog(@"id: %ld, username: %@", user.userId, user.username);
    }
    
    for (NSInteger i = 0; i < users.count; i++) {
        User *user = users[i];
        NSLog(@"id: %ld, username: %@", user.userId, user.username);
    }
    
    for (User *user in simpleSyntaxArray) {
        NSLog(@"id: %ld, username: %@", user.userId, user.username);
    }
    
    NSInteger index = [users indexOfObject:[[User alloc] initWithUserId:15]];
    
    if (index != NSNotFound) {
        User *user = users[index];
        
         NSLog(@"Found id: %ld, username: %@", user.userId, user.username);
    }
    
    index = [users indexOfObject:users[14]];
    
    index = [users indexOfObjectPassingTest:^BOOL(User *u, NSUInteger idx, BOOL *stop) {
        return u.userId == 5;
    }];
    
    [users addObject:users[index]];
    [users removeObjectAtIndex:10];
    
    return;
}

- (void)testSet
{
    NSMutableSet *users = [NSMutableSet setWithArray:[self makeUsersList]];
    
    for (User *user in users) {
        NSLog(@"id: %ld, username: %@", user.userId, user.username);
    }
    
    BOOL containsObject = [users containsObject:[[User alloc] initWithUserId:15]];
    containsObject = [users containsObject:[[User alloc] initWithUserId:31]];
    
    [users addObject:[[User alloc] initWithUserId:15]];
    [users addObject:[[User alloc] initWithUserId:55]];
    
    return;
}

- (void)testDictionary
{
    NSMutableDictionary *users = [NSMutableDictionary new];
    
    NSDictionary *simpleSyntax = @{@(1): [[User alloc] initWithUserId:1],
                                   @(4): [[User alloc] initWithUserId:4]};
    
    for (User *user in [self makeUsersList]) {
        users[@(user.userId)] = user;
    }
    
    for (NSNumber *key in users) {
        NSLog(@"id: %ld", key.integerValue);
    }
    
    [users enumerateKeysAndObjectsUsingBlock:^(NSNumber *key, User *user, BOOL *stop) {
        NSLog(@"id: %ld, username: %@", user.userId, user.username);
    }];
    
    User *user1 = users[@(10)];
    
    if (user1) {
        NSLog(@"id: %ld, username: %@", user1.userId, user1.username);
    }
    
    user1 = users[@"10"];
    
    users[@(10)] = [[User alloc] initWithUserId:98];
    
    return;
}

- (void)testOrderedSet
{
    NSMutableOrderedSet *users = [[NSMutableOrderedSet alloc] initWithArray:[self makeUsersList]];
    
    for (User *user in users) {
        NSLog(@"id: %ld, username: %@", user.userId, user.username);
    }
}

@end

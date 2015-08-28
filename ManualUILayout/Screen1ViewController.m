//
//  Screen1ViewController.m
//  ManualUILayout
//
//  Created by Alexey Klyotzin on 27/08/15.
//  Copyright (c) 2015 Test projects. All rights reserved.
//

#import "Screen1ViewController.h"

@interface Screen1ViewController ()

@end

@implementation Screen1ViewController

- (instancetype)init
{
    return [self initWithNibName:@"Screen1ViewController" bundle:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title = @"Screen 1";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UINavigationBar *bar = self.navigationController.navigationBar;
    
    [bar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    bar.tintColor = [UIColor blackColor];
    bar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor darkGrayColor],
                                NSFontAttributeName: [UIFont fontWithName:@"Arial" size:20]};
}

@end

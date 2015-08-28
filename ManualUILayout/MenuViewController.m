//
//  MenuViewController.m
//  ManualUILayout
//
//  Created by Alexey Klyotzin on 27/08/15.
//  Copyright (c) 2015 Test projects. All rights reserved.
//

#import "MenuViewController.h"
#import "Screen1ViewController.h"

@interface MenuViewController ()

@property (strong, nonatomic) IBOutlet UIView *uiButtonsConatiner;

@end

@implementation MenuViewController

- (instancetype)init
{
    return [self initWithNibName:@"MenuViewController" bundle:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title = @"Menu";
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UINavigationBar *bar = self.navigationController.navigationBar;
    
    [bar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    bar.tintColor = [UIColor blackColor];
    bar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor greenColor],
                                NSFontAttributeName: [UIFont fontWithName:@"Arial" size:20]};
    
    NSLog(@"MenuViewController viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSLog(@"MenuViewController viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    NSLog(@"MenuViewController viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    NSLog(@"MenuViewController viewDidDisappear");
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.uiButtonsConatiner.frame = CGRectMake(0,
                                               [self.topLayoutGuide length],
                                               self.view.frame.size.width,
                                               self.view.frame.size.height - [self.topLayoutGuide length]);
    
    NSLog(@"MenuViewController viewDidLayoutSubviews");
}


- (IBAction)actShowScreen1
{
    [self.navigationController pushViewController:[Screen1ViewController new] animated:YES];
}

@end

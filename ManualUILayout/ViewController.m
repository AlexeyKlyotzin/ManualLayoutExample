//
//  ViewController.m
//  ManualUILayout
//
//  Created by Alexey Klyotzin on 25/08/15.
//  Copyright (c) 2015 Test projects. All rights reserved.
//

#import "ViewController.h"
#import "SwitchContainer.h"
#import "Switch.h"

@interface ViewController ()
{
    Switch *_selectedSwitch;
}

@property (strong, nonatomic) IBOutlet SwitchContainer *uiSwitchContainer;

@property (strong, nonatomic) IBOutlet Switch *uiSwitch1;
@property (strong, nonatomic) IBOutlet Switch *uiSwicth2;
@property (strong, nonatomic) IBOutlet Switch *uiSwitch3;
@property (strong, nonatomic) IBOutlet Switch *uiSwitch4;
@property (strong, nonatomic) IBOutlet Switch *uiSwitch5;


@end

@implementation ViewController

- (instancetype)init
{
    return [self initWithNibName:@"ViewController" bundle:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.uiSwitchContainer.frame = CGRectMake(0,
                                              [self.topLayoutGuide length],
                                              self.view.frame.size.width,
                                              self.uiSwitchContainer.frame.size.height);
}

- (IBAction)actSwitchTap:(Switch *)sw
{
    _selectedSwitch.selected = NO;
    _selectedSwitch = sw;
    sw.selected = YES;
}


@end

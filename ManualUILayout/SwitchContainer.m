//
//  SwitchContainer.m
//  ManualUILayout
//
//  Created by Alexey Klyotzin on 25/08/15.
//  Copyright (c) 2015 Test projects. All rights reserved.
//

#import "SwitchContainer.h"

static const CGFloat SeparatorWidth = 1;

@interface SwitchContainer ()

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *uiTopRow;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *uiBottomRow;

@end

@implementation SwitchContainer


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    const CGFloat switchHeight = 0.5 * (self.frame.size.height - SeparatorWidth);
    const CGFloat topSwitchWidth = (self.frame.size.width - SeparatorWidth * (self.uiTopRow.count - 1)) / self.uiTopRow.count;
    
    for (NSInteger i = 0; i < self.uiTopRow.count; i++) {
        UIView *switchView = self.uiTopRow[i];
        
        switchView.frame = CGRectMake((topSwitchWidth + SeparatorWidth) * i, 0, topSwitchWidth, switchHeight);
    }
    
    const CGFloat bottomSwitchWidth = (self.frame.size.width - SeparatorWidth * (self.uiBottomRow.count - 1)) / self.uiBottomRow.count;
    
    for (NSInteger i = 0; i < self.uiBottomRow.count; i++) {
        UIView *switchView = self.uiBottomRow[i];
        
        switchView.frame = CGRectMake((bottomSwitchWidth + SeparatorWidth) * i, SeparatorWidth + switchHeight, bottomSwitchWidth, switchHeight);
    }
}

@end

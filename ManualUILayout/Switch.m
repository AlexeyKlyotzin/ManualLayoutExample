//
//  Switch.m
//  ManualUILayout
//
//  Created by Alexey Klyotzin on 25/08/15.
//  Copyright (c) 2015 Test projects. All rights reserved.
//

#import "Switch.h"

@interface Switch ()
{
    UIColor *_bgColor;
    UIColor *_selBgColor;
    UIColor *_hlBgColor;
}

@property (strong, nonatomic) IBOutlet UILabel *uiTitle;

@end

@implementation Switch

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    _bgColor = self.backgroundColor;
    _selBgColor = [UIColor lightGrayColor];
    _hlBgColor = [UIColor lightTextColor];
}

- (void)checkBgColor
{
    if (self.highlighted) {
        self.backgroundColor = _hlBgColor;
    } else if (self.selected) {
        self.backgroundColor = _selBgColor;
    } else {
        self.backgroundColor = _bgColor;
    }
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self checkBgColor];
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self checkBgColor];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.uiTitle sizeToFit];
    
    self.uiTitle.frame = CGRectMake(0.5 * (self.frame.size.width - self.uiTitle.frame.size.width),
                                    0.5 * (self.frame.size.height - self.uiTitle.frame.size.height),
                                    self.uiTitle.frame.size.width,
                                    self.uiTitle.frame.size.height);
}


@end

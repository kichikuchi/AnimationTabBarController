//
//  AnimationTabBarItem.m
//  AnimationTabBarControllerTest
//
//  Created by 菊池和紀 on 2015/11/28.
//  Copyright © 2015年 菊池和紀. All rights reserved.
//

#import "AnimationTabBarItem.h"

@interface AnimationTabBarItem()

@property (nonatomic) BarItemAnimation *animation;

@end

@implementation AnimationTabBarItem

- (id)init
{
    self = [super init];
    if (self) {
        
        self.textColor = UIColor.blackColor;
        self.animation = [[BarItemAnimation alloc] init];
        
        return self;
    }
    
    return nil;
}

- (void)playAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel
{
    [self.animation playAnimation:icon textLabel:textLabel];
}

- (void)deselectAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel defaultTextColor:(UIColor *)defaultColor
{
    [self.animation deselectAnimation:icon textLabel:textLabel defaultTextColor:self.textColor];
}

- (void)selectedState:(UIImageView *)icon textLabel:(UILabel *)textLabel
{
    [self.animation selectedState:icon textLabel:textLabel];
}

@end

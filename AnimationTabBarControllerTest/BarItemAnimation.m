//
//  BarItemAnimation.m
//  AnimationTabBarControllerTest
//
//  Created by 菊池和紀 on 2015/11/29.
//  Copyright © 2015年 菊池和紀. All rights reserved.
//

#import "BarItemAnimation.h"

@implementation BarItemAnimation

- (void)playAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.values = @[@(1.0), @(1.25), @(0.95), @(1.0)];
    animation.duration = 0.5;
    animation.calculationMode = kCAAnimationCubic;
    
    [icon.layer addAnimation:animation forKey:@"transform.scale"];
}

- (void)deselectAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel defaultTextColor:(UIColor *)defaultColor
{
    
}

- (void)selectedState:(UIImageView *)icon textLabel:(UILabel *)textLabel
{
    
}

@end

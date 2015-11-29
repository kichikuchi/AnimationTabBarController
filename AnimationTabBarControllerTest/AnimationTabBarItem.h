//
//  AnimationTabBarItem.h
//  AnimationTabBarControllerTest
//
//  Created by 菊池和紀 on 2015/11/28.
//  Copyright © 2015年 菊池和紀. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BarItemAnimation.h"

@interface AnimationTabBarItem : UITabBarItem <BarItemAnimationProtocol>

@property (nonatomic) UIColor *textColor;

- (void)playAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel;
- (void)selectedState:(UIImageView *)icon textLabel:(UILabel *)textLabel;
- (void)deselectAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel defaultTextColor:(UIColor *)defaultColor;

@end

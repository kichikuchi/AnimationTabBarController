//
//  BarItemAnimation.h
//  AnimationTabBarControllerTest
//
//  Created by 菊池和紀 on 2015/11/29.
//  Copyright © 2015年 菊池和紀. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol BarItemAnimationProtocol;

@interface BarItemAnimation : NSObject <BarItemAnimationProtocol>

@end

@protocol BarItemAnimationProtocol <NSObject>

- (void)playAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel;
- (void)deselectAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel defaultTextColor:(UIColor *)defaultColor;
- (void)selectedState:(UIImageView *)icon textLabel:(UILabel *)textLabel;

@end
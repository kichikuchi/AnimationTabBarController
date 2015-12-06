//
//  AnimationTabBarController.m
//  AnimationTabBarControllerTest
//
//  Created by 菊池和紀 on 2015/11/29.
//  Copyright © 2015年 菊池和紀. All rights reserved.
//

#import "AnimationTabBarController.h"
#import "AnimationTabBarItem.h"

@interface AnimationTabBarController ()

@property NSArray *iconsView;

@end

@implementation AnimationTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIViewController *controller1 = [[UIViewController alloc] init];
    UIViewController *controller2 = [[UIViewController alloc] init];
    UIViewController *controller3 = [[UIViewController alloc] init];
    
    controller1.tabBarItem = [[AnimationTabBarItem alloc] initWithTitle:@"foo" image:[UIImage imageNamed:@"tabIcon"] tag:0];
    controller2.tabBarItem = [[AnimationTabBarItem alloc] initWithTitle:@"bar" image:[UIImage imageNamed:@"tabIcon"] tag:0];
    controller3.tabBarItem = [[AnimationTabBarItem alloc] initWithTitle:@"baz" image:[UIImage imageNamed:@"tabIcon"] tag:0];
    
    NSArray *controllers = @[controller1, controller2, controller3];
    [self setViewControllers:controllers];
    
    NSDictionary *containers = [self createViewContainers];
    [self createCustomIcons:containers];
}

- (void)createCustomIcons:(NSDictionary *)containers
{
    NSArray *items = self.tabBar.items;
    NSInteger itemsCount = self.tabBar.items.count - 1;
    
    
    [items enumerateObjectsUsingBlock:^(AnimationTabBarItem *item, NSUInteger idx, BOOL * _Nonnull stop) {
        UIView *container = containers[[NSString stringWithFormat:@"container%lu", itemsCount - idx]];
        container.tag = idx;
        
        UIImageView *icon = [[UIImageView alloc] initWithImage:item.image];
        icon.translatesAutoresizingMaskIntoConstraints = NO;
        icon.tintColor = UIColor.clearColor;
        
        UILabel *textLabel = [[UILabel alloc] init];
        textLabel.text = item.title;
        textLabel.backgroundColor = UIColor.clearColor;
        textLabel.textColor = item.textColor;
        textLabel.font = [UIFont systemFontOfSize:10];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        [container addSubview:icon];
        [self createConstraints:icon container:container size:item.image.size yOffset:-5];
        
        [container addSubview:textLabel];
        CGFloat textLabelWidth = self.tabBar.frame.size.width / (CGFloat)self.tabBar.items.count - 5.0;
        [self createConstraints:textLabel container:container size:CGSizeMake(textLabelWidth, 10) yOffset:16];
        
        self.iconsView = @[icon, textLabel];
        
        if (idx == 0) {
            [item selectedState:icon textLabel:textLabel];
        }
        
        item.image = nil;
        item.title = nil;
    }];
}

- (void)createConstraints:(UIView *)view container:(UIView *)container size:(CGSize)size yOffset:(CGFloat)yOffset
{
    NSLayoutConstraint *constX = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:container attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    [container addConstraint:constX];
    NSLayoutConstraint *constY = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:container attribute:NSLayoutAttributeCenterY multiplier:1 constant:yOffset];
    [container addConstraint:constY];
    NSLayoutConstraint *constW = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:size.width];
    [container addConstraint:constW];
    NSLayoutConstraint *constH = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:size.height];
    [container addConstraint:constH];
}

- (NSDictionary *)createViewContainers
{
    NSMutableDictionary *containerDict = [NSMutableDictionary dictionary];
    
    NSInteger itemsCount = self.tabBar.items.count - 1;
    
    for (int i = 0; i <= itemsCount; i++) {
        NSString *key = [NSString stringWithFormat:@"container%d",i];
        [containerDict setObject:[self createViewContainer] forKey:key];
    }
    
    NSString *formatString = @"H:|-(0)-[container0]";
    for (int i = 1; i <= itemsCount; i++) {
        [formatString stringByAppendingString:[NSString stringWithFormat:@"-(0)-[container%d(==container0)]",i]];
    }
    formatString = [formatString stringByAppendingString:@"-(0)-|"];
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:formatString options:NSLayoutFormatDirectionRightToLeft metrics:nil views:containerDict];
    [self.view addConstraints:constraints];
    
    return containerDict;
}

- (UIView *)createViewContainer
{
    UIView *viewContainer = [[UIView alloc] init];
    
    viewContainer.backgroundColor = UIColor.clearColor;
    viewContainer.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:viewContainer];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler:)];
    tapGesture.numberOfTouchesRequired = 1;
    [viewContainer addGestureRecognizer:tapGesture];
    
    NSLayoutConstraint *constY = [NSLayoutConstraint constraintWithItem:viewContainer attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [self.view addConstraint:constY];
    
    NSLayoutConstraint *constX = [NSLayoutConstraint constraintWithItem:viewContainer attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:self.tabBar.frame.size.height];
    [viewContainer addConstraint:constX];
    
    return viewContainer;
}

- (void)tapHandler:(UITapGestureRecognizer *)sender
{
    NSLog(@"tapされたよ");
}

@end

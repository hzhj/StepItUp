//
//  DSNavigationBar.m
//  DSTranparentNavigationBar
//
//  Created by Diego Serrano on 10/13/14.
//  Copyright (c) 2014 Diego Serrano. All rights reserved.
//

#import "DSNavigationBar.h"
#import <QuartzCore/QuartzCore.h>

@implementation DSNavigationBar

static CGFloat kEndPoint = 1.5;

-(void)awakeFromNib
{
    [super awakeFromNib];
    if (self.color) {
        //在SIUToDoSB.storyboard 中 建立 color——Color——(r,g,b)的键值对就可以设置不同的顶栏颜色
        [self setNavigationBarWithColor:self.color];
    } else {
        //[self setNavigationBarWithColor:[UIColor whiteColor]];
        //[self setTintColor:[UIColor whiteColor]];
        //[self setBarStyle:UIBarStyleDefault];
        UIImage *image = [UIImage imageNamed:@"multiply_banner_01"];
        [self setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
}

/*
- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        if (self.color) {
            [self setNavigationBarWithColor:self.color];
        } else {
            [self setNavigationBarWithColor:[UIColor whiteColor]];
    }
    
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        if (self.color) {
            [self setNavigationBarWithColor:self.color];
        } else {
            [self setNavigationBarWithColor:[UIColor whiteColor]];
        }
    }
    
    return self;
}
*/
void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor)
{
     CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
     CGFloat locations[] = { 0.0, 1.0 };
     
     NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];
     
     CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
     CGPoint startPoint = CGPointMake(rect.size.width/2, 0);
     CGPoint endPoint = CGPointMake(rect.size.width/2, rect.size.height/kEndPoint);
     
     CGContextSaveGState(context);
     CGContextAddRect(context, rect);
     CGContextClip(context);
     CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
     CGContextSetStrokeColorWithColor(context, [[UIColor clearColor] CGColor]);
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)imageWithGradients:(NSArray *)colours
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor * beginColor = [colours objectAtIndex:0];
    UIColor * endColor = [colours objectAtIndex:1];
    drawLinearGradient(context, rect, beginColor.CGColor, endColor.CGColor);
    CGContextRestoreGState(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

-(void)setNavigationBarWithColor:(UIColor *)color
{
    UIImage *image = [self imageWithColor:color];
    
    [self setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self setBarStyle:UIBarStyleDefault];
    [self setShadowImage:[UIImage new]];
    [self setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [self setTintColor:[UIColor whiteColor]];
    [self setTranslucent:YES];

}

-(void)setNavigationBarWithColors:(NSArray *)colours
{
    UIImage *image = [self imageWithGradients:colours];
    
    [self setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self setBarStyle:UIBarStyleDefault];
    [self setShadowImage:[UIImage new]];
    [self setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [self setTintColor:[UIColor whiteColor]];
    [self setTranslucent:YES];
}


@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 

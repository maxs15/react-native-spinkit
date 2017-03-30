//
// RTSpinKitFadingCircleAltAnimation.m
// SpinKit
//
// Copyright (c) 2014 Ramon Torres
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "RTSpinKitFadingCircleAltAnimation.h"
#include <tgmath.h>

static const CGFloat kRTSpinKitDegToRad = 0.0174532925;

@implementation RTSpinKitFadingCircleAltAnimation

-(void)setupSpinKitAnimationInLayer:(CALayer*)layer withSize:(CGSize)size color:(UIColor*)color {
        NSTimeInterval beginTime = CACurrentMediaTime() ;

        CGFloat radius =  size.width / 2;

        for (NSInteger i=0; i < 12;  i+=1) {
            CALayer *circle = [CALayer layer];
            circle.backgroundColor = color.CGColor;
            circle.anchorPoint = CGPointMake(0.5, 0.5);
            circle.frame = CGRectMake(radius + cosf(kRTSpinKitDegToRad * (30.0 * i)) * radius , radius + sinf(kRTSpinKitDegToRad * (30.0 * i)) * radius, radius / 2, radius / 2);
            circle.shouldRasterize = YES;
            circle.rasterizationScale = [[UIScreen mainScreen] scale];
            circle.cornerRadius = CGRectGetHeight(circle.bounds) * 0.5;

            CAKeyframeAnimation* transformAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];

            transformAnimation.values = @[
                [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 0.0)],
                [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0, 0.0, 0.0)]
            ];

            CAKeyframeAnimation* opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
            
            opacityAnimation.values = @[
                @(1.0),
                @(0.0)
            ];

            CAAnimationGroup* animationGroup = [[CAAnimationGroup alloc] init];
            animationGroup.removedOnCompletion = NO;
            animationGroup.repeatCount = HUGE_VALF;
            animationGroup.duration = 1.2;
            animationGroup.beginTime = beginTime - (1.2 - (0.1 * i));
            animationGroup.animations = @[transformAnimation, opacityAnimation];
            [circle addAnimation:animationGroup forKey:@"spinkit-anim"];
            [layer addSublayer:circle];
        }
}

@end

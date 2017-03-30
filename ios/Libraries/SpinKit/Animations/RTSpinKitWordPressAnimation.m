//
// RTSpinKitWordPressAnimation.m
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

#import "RTSpinKitWordPressAnimation.h"

@implementation RTSpinKitWordPressAnimation

-(void)setupSpinKitAnimationInLayer:(CALayer*)layer withSize:(CGSize)size color:(UIColor*)color
{
    NSTimeInterval beginTime = CACurrentMediaTime();
    
    CALayer *spinner = [CALayer layer];
    spinner.frame = CGRectMake(0.0, 0.0, size.width, size.height);
    spinner.anchorPoint = CGPointMake(0.5, 0.5);
    spinner.transform = CATransform3DIdentity;
    spinner.backgroundColor = color.CGColor;
    spinner.shouldRasterize = YES;
    spinner.rasterizationScale = [[UIScreen mainScreen] scale];
    [layer addSublayer:spinner];

    CAKeyframeAnimation *spinnerAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    spinnerAnim.removedOnCompletion = NO;
    spinnerAnim.repeatCount = HUGE_VALF;
    spinnerAnim.duration = 1.0;
    spinnerAnim.beginTime = beginTime;
    spinnerAnim.keyTimes = @[@(0.0), @(0.25), @(0.5), @(0.75), @(1.0)];
    
    spinnerAnim.timingFunctions = @[
        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]
    ];

    spinnerAnim.values = @[
        [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0, 0, 1.0)],
        [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0, 0, 1.0)],
        [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1.0)],
        [NSValue valueWithCATransform3D:CATransform3DMakeRotation(3 * M_PI_2, 0, 0, 1.0)],
        [NSValue valueWithCATransform3D:CATransform3DMakeRotation(2 * M_PI, 0, 0, 1.0)]
    ];

    [spinner addAnimation:spinnerAnim forKey:@"spinkit-anim"];

    CAShapeLayer *circleMask = [CAShapeLayer layer];
    circleMask.frame = spinner.bounds;
    circleMask.fillColor = [UIColor blackColor].CGColor;
    circleMask.anchorPoint = CGPointMake(0.5, 0.5);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, nil, spinner.frame);

    CGFloat circleSize = size.width * 0.25;
    CGPathAddEllipseInRect(path, nil, CGRectMake(CGRectGetMidX(spinner.frame) - circleSize/2, 3.0, circleSize, circleSize));
    CGPathCloseSubpath(path);
    circleMask.path = path;
    circleMask.fillRule = kCAFillRuleEvenOdd;
    CGPathRelease(path);

    spinner.mask = circleMask;
}

@end

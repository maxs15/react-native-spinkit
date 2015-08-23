//
// RTSpinKitChasingDotsAnimation.m
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

#import "RTSpinKitChasingDotsAnimation.h"

@implementation RTSpinKitChasingDotsAnimation

-(void)setupSpinKitAnimationInLayer:(CALayer*)layer withSize:(CGSize)size color:(UIColor*)color
{
    NSTimeInterval beginTime = CACurrentMediaTime();

    CALayer *spinner = [CALayer layer];
    spinner.frame = CGRectMake(0.0, 0.0, size.width, size.height);
    spinner.anchorPoint = CGPointMake(0.5, 0.5);
    spinner.transform = CATransform3DIdentity;
    spinner.shouldRasterize = YES;
    spinner.rasterizationScale = [[UIScreen mainScreen] scale];
    [layer addSublayer:spinner];

    CAKeyframeAnimation *spinnerAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    spinnerAnim.removedOnCompletion = NO;
    spinnerAnim.repeatCount = HUGE_VALF;
    spinnerAnim.duration = 2.0;
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

    [spinner addAnimation:spinnerAnim forKey:@"spinner-anim"];
    
    for (NSInteger i=0; i < 2; i+=1) {
        CALayer *circle = [CALayer layer];
        CGFloat offset = size.width * 0.3 * i;
        circle.frame = CGRectOffset(CGRectApplyAffineTransform(CGRectMake(0.0, 0.0, size.width, size.height), CGAffineTransformMakeScale(0.6, 0.6)), offset, offset);
        circle.backgroundColor = color.CGColor;
        circle.anchorPoint = CGPointMake(0.5, 0.5);
        circle.cornerRadius = CGRectGetHeight(circle.bounds) * 0.5;
        circle.transform = CATransform3DMakeScale(0.0, 0.0, 0.0);
        
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        anim.removedOnCompletion = NO;
        anim.repeatCount = HUGE_VALF;
        anim.duration = 2.0;
        anim.beginTime = beginTime - (1.0 * i);
        anim.keyTimes = @[@(0.0), @(0.5), @(1.0)];
        
        anim.timingFunctions = @[
            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
        ];
        
        anim.values = @[
            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0, 0.0, 0.0)],
            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 0.0)],
            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0, 0.0, 0.0)]
        ];

        [spinner addSublayer:circle];
        [circle addAnimation:anim forKey:@"spinkit-anim"];
    }
}

@end

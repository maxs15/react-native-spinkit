//
// RTSpinKitArcAnimation.m
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

#import "RTSpinKitArcAnimation.h"

@implementation RTSpinKitArcAnimation

-(void)setupSpinKitAnimationInLayer:(CALayer *)layer withSize:(CGSize)size color:(UIColor *)color
{
    NSTimeInterval beginTime = CACurrentMediaTime();

    CGRect  frame  = CGRectInset(CGRectMake(0.0, 0.0, size.width, size.height), 2.0, 2.0);
    CGFloat radius = CGRectGetWidth(frame) / 2.0;
    CGPoint center = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));

    CALayer *arc = [CALayer layer];
    arc.frame = CGRectMake(0.0, 0.0, size.width, size.height);
    arc.backgroundColor = color.CGColor;
    arc.anchorPoint = CGPointMake(0.5, 0.5);
    arc.cornerRadius = CGRectGetWidth(arc.frame) / 2.0;

    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, NULL, center.x, center.y, radius, 0.0, ((M_PI * 2.0) / 360.0) * 300.0, NO);

    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.frame        = CGRectMake(0.0, 0.0, size.width, size.height);
    mask.path         = path;
    mask.strokeColor  = [[UIColor blackColor] CGColor];
    mask.fillColor    = [[UIColor clearColor] CGColor];
    mask.lineWidth    = 2.0;
    mask.cornerRadius = frame.size.width / 2.0;
    mask.anchorPoint  = CGPointMake(0.5, 0.5);

    arc.mask = mask;

    CGPathRelease(path);

    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    anim.removedOnCompletion = NO;
    anim.repeatCount = HUGE_VALF;
    anim.duration = 0.8;
    anim.beginTime = beginTime;
    anim.keyTimes = @[@(0.0), @(0.5), @(1.0)];

    anim.values = @[
        [NSNumber numberWithDouble:0.0],
		[NSNumber numberWithDouble:M_PI],
		[NSNumber numberWithDouble:M_PI * 2.0]
    ];

    [layer addSublayer:arc];
    [arc addAnimation:anim forKey:@"spinkit-anim"];
}

@end

//
// RTSpinKitFadingCircleAnimation.m
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

#import "RTSpinKitFadingCircleAnimation.h"
#include <tgmath.h>

@implementation RTSpinKitFadingCircleAnimation

-(void)setupSpinKitAnimationInLayer:(CALayer*)layer withSize:(CGSize)size color:(UIColor*)color
{
    NSTimeInterval beginTime = CACurrentMediaTime();
    
    CGFloat radius = size.width / 2;
    CGFloat squareSize = size.width / 6;

    for (NSInteger i=0; i < 12; i+=1) {
        CALayer *square = [CALayer layer];
        
        CGFloat angle = i * (M_PI_2/3.0);
        CGFloat x = radius + sinf(angle) * radius;
        CGFloat y = radius - cosf(angle) * radius;
        square.frame = CGRectMake(x, y, squareSize, squareSize);
        square.backgroundColor = color.CGColor;
        square.anchorPoint = CGPointMake(0.5, 0.5);
        square.opacity = 0.0;

        CATransform3D transform = CATransform3DIdentity;
        transform = CATransform3DRotate(transform, angle, 0, 0, 1.0);
        square.transform = transform;

        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        anim.removedOnCompletion = NO;
        anim.repeatCount = HUGE_VALF;
        anim.duration = 1.0;
        anim.beginTime = beginTime + (0.084 * i);
        anim.keyTimes = @[@(0.0), @(0.5), @(1.0)];
        
        anim.timingFunctions = @[
            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
        ];
        
        anim.values = @[@(1.0), @(0.0), @(0.0)];

        [layer addSublayer:square];
        [square addAnimation:anim forKey:@"spinkit-anim"];
    }
}

@end

//
// RTSpinKitWaveAnimation.m
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

#import "RTSpinKitWaveAnimation.h"

@implementation RTSpinKitWaveAnimation

-(void)setupSpinKitAnimationInLayer:(CALayer*)layer withSize:(CGSize)size color:(UIColor*)color
{
    NSTimeInterval beginTime = CACurrentMediaTime() + 1.2;
    CGFloat barWidth = size.width / 5.0;

    for (NSInteger i=0; i < 5; i+=1) {
        CALayer *bar = [CALayer layer];
        bar.backgroundColor = color.CGColor;
        bar.frame = CGRectMake(barWidth * i, 0.0, barWidth - 3.0, size.height);
        bar.transform = CATransform3DMakeScale(1.0, 0.3, 0.0);

        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        anim.removedOnCompletion = NO;
        anim.beginTime = beginTime - (1.2 - (0.1 * i));
        anim.duration = 1.2;
        anim.repeatCount = HUGE_VALF;

        anim.keyTimes = @[@(0.0), @(0.2), @(0.4), @(1.0)];

        anim.timingFunctions = @[
            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
        ];

        anim.values = @[
            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 0.4, 0.0)],
            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 0.0)],
            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 0.4, 0.0)],
            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 0.4, 0.0)]
        ];

        [bar addAnimation:anim forKey:@"spinkit-anim"];

        [layer addSublayer:bar];
    }
}

@end

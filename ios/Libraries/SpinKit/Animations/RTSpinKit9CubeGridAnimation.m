//
// RTSpinKit9CubeGridAnimation.m
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

#import "RTSpinKit9CubeGridAnimation.h"

@implementation RTSpinKit9CubeGridAnimation

-(void)setupSpinKitAnimationInLayer:(CALayer*)layer withSize:(CGSize)size color:(UIColor*)color
{
    NSTimeInterval beginTime = CACurrentMediaTime();
    
    CGFloat squareSize = size.width / 3;

    for (NSInteger sum = 0; sum < 5; sum++)
    {
        for (NSInteger x = 0; x < 3; x++)
        {
            for (NSInteger y = 0; y < 3; y++)
            {
                if (x + y == sum)
                {
                    CALayer *square = [CALayer layer];
                    square.frame = CGRectMake(x * squareSize, y * squareSize, squareSize, squareSize);
                    square.backgroundColor = color.CGColor;
                    square.transform = CATransform3DMakeScale(0.0, 0.0, 0.0);
                    
                    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
                    anim.removedOnCompletion = NO;
                    anim.repeatCount = HUGE_VALF;
                    anim.duration = 1.5;
                    anim.beginTime = beginTime + (0.1 * sum);
                    anim.keyTimes = @[@(0.0), @(0.4), @(0.6), @(1.0)];
                    
                    anim.timingFunctions = @[
                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                     ];

                    anim.values = @[
                        [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0, 0.0, 0.0)],
                        [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 0.0)],
                        [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 0.0)],
                        [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0, 0.0, 0.0)]
                    ];
                    
                    [layer addSublayer:square];
                    [square addAnimation:anim forKey:@"spinkit-anim"];
                }
            }
        }
    }
}

@end

//
// RTSpinKitWanderingCubesAnimation.m
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

#import "RTSpinKitWanderingCubesAnimation.h"
#include <tgmath.h>

static const CGFloat kRTSpinKitDegToRad = 0.0174532925;

@implementation RTSpinKitWanderingCubesAnimation

-(void)setupSpinKitAnimationInLayer:(CALayer*)layer withSize:(CGSize)size color:(UIColor*)color
{
    NSTimeInterval beginTime = CACurrentMediaTime();
    CGFloat cubeSize = floor(size.width / 3.0);
    CGFloat widthMinusCubeSize = size.width - cubeSize;

    for (NSInteger i=0; i<2; i+=1) {
        CALayer *cube = [CALayer layer];
        cube.backgroundColor = color.CGColor;
        cube.frame = CGRectMake(0.0, 0.0, cubeSize, cubeSize);
        cube.anchorPoint = CGPointMake(0.5, 0.5);
        cube.shouldRasterize = YES;
        cube.rasterizationScale = [[UIScreen mainScreen] scale];
        
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        anim.removedOnCompletion = NO;
        anim.beginTime = beginTime - (i * 0.9);
        anim.duration = 1.8;
        anim.repeatCount = HUGE_VALF;
        
        anim.keyTimes = @[@(0.0), @(0.25), @(0.50), @(0.75), @(1.0)];
        
        anim.timingFunctions = @[
            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
        ];

        CATransform3D t0 = CATransform3DIdentity;
        
        CATransform3D t1 = CATransform3DMakeTranslation(widthMinusCubeSize, 0.0, 0.0);
        t1 = CATransform3DRotate(t1, -90.0 * kRTSpinKitDegToRad, 0.0, 0.0, 1.0);
        t1 = CATransform3DScale(t1, 0.5, 0.5, 1.0);
        
        CATransform3D t2 = CATransform3DMakeTranslation(widthMinusCubeSize, widthMinusCubeSize, 0.0);
        t2 = CATransform3DRotate(t2, -180.0 * kRTSpinKitDegToRad, 0.0, 0.0, 1.0);
        t2 = CATransform3DScale(t2, 1.0, 1.0, 1.0);
        
        CATransform3D t3 = CATransform3DMakeTranslation(0.0, widthMinusCubeSize, 0.0);
        t3 = CATransform3DRotate(t3, -270.0 * kRTSpinKitDegToRad, 0.0, 0.0, 1.0);
        t3 = CATransform3DScale(t3, 0.5, 0.5, 1.0);
        
        CATransform3D t4 = CATransform3DMakeTranslation(0.0, 0.0, 0.0);
        t4 = CATransform3DRotate(t4, -360.0 * kRTSpinKitDegToRad, 0.0, 0.0, 1.0);
        t4 = CATransform3DScale(t4, 1.0, 1.0, 1.0);

        anim.values = @[[NSValue valueWithCATransform3D:t0],
                        [NSValue valueWithCATransform3D:t1],
                        [NSValue valueWithCATransform3D:t2],
                        [NSValue valueWithCATransform3D:t3],
                        [NSValue valueWithCATransform3D:t4]];

        [layer addSublayer:cube];
        [cube addAnimation:anim forKey:@"spinkit-anim"];
    }
}

@end

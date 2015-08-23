//
// RTSpinKitView.m
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

#import "RTSpinKitView.h"
#import "RTSpinKitUtils.h"

#include <tgmath.h>

static const CGFloat kRTSpinKitViewDefaultSpinnerSize = 37.0;

@interface RTSpinKitView ()
@end

@implementation RTSpinKitView

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self applyAnimation];
    }

    return self;
}

-(id)initWithFrame:(CGRect)frame {
    self = [self initWithStyle:RTSpinKitViewStylePlane];
    if (self) {
        self.frame = frame;
    }
    return self;
}

-(instancetype)initWithStyle:(RTSpinKitViewStyle)style {
    return [self initWithStyle:style color:[UIColor grayColor]];
}

-(instancetype)initWithStyle:(RTSpinKitViewStyle)style color:(UIColor *)color {
    return [self initWithStyle:style color:color spinnerSize:kRTSpinKitViewDefaultSpinnerSize];
}

-(instancetype)initWithStyle:(RTSpinKitViewStyle)style color:(UIColor*)color spinnerSize:(CGFloat)spinnerSize {
    self = [super initWithFrame:CGRectMake(0.0, 0.0, spinnerSize, spinnerSize)];
    if (self) {
        _style = style;
        _color = color;
        _spinnerSize = spinnerSize;
        _hidesWhenStopped = YES;
        [self applyAnimation];
        [self sizeToFit];
    }
    return self;
}

-(void)setStyle:(RTSpinKitViewStyle)style {
    _style = style;
    [self applyAnimation];
}

-(void)setSpinnerSize:(CGFloat)spinnerSize {
    _spinnerSize = spinnerSize;
    [self applyAnimation];
    [self invalidateIntrinsicContentSize];
}

#pragma mark - Animation

-(void)applyAnimation {
    // Remove any sublayer.
    self.layer.sublayers = nil;

    CGSize size = CGSizeMake(self.spinnerSize, self.spinnerSize);
    NSObject<RTSpinKitAnimating> *animation = RTSpinKitAnimationFromStyle(self.style);
    [animation setupSpinKitAnimationInLayer:self.layer withSize:size color:self.color];
}

#pragma mark - Hooks

-(void)applicationWillEnterForeground {
    if (self.stopped) {
        [self pauseLayers];
    } else {
        [self resumeLayers];
    }
}

-(void)applicationDidEnterBackground {
    [self pauseLayers];
}

-(BOOL)isAnimating {
    return !self.isStopped;
}

-(void)startAnimating {
    if (self.isStopped) {
        self.hidden = NO;
        self.stopped = NO;
        [self resumeLayers];
    }
}

-(void)stopAnimating {
    if ([self isAnimating]) {
        if (self.hidesWhenStopped) {
            self.hidden = YES;
        }
        
        self.stopped = YES;
        [self pauseLayers];
    }
}

-(void)pauseLayers {
    CFTimeInterval pausedTime = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    self.layer.speed = 0.0;
    self.layer.timeOffset = pausedTime;
}

-(void)resumeLayers {
    CFTimeInterval pausedTime = [self.layer timeOffset];
    self.layer.speed = 1.0;
    self.layer.timeOffset = 0.0;
    self.layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    self.layer.beginTime = timeSincePause;
}

-(CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(self.spinnerSize, self.spinnerSize);
}

-(CGSize)intrinsicContentSize {
    return CGSizeMake(self.spinnerSize, self.spinnerSize);
}

-(void)setColor:(UIColor *)color {
    [self setColor:color animated:NO];
}

-(void)setColor:(UIColor *)color animated:(BOOL)animated {
    UIColor *previousColor = _color;
    
    _color = color;

    if (animated) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
        animation.fromValue = (id)previousColor.CGColor;
        animation.toValue = (id)color.CGColor;
        animation.duration = 0.5;
        animation.removedOnCompletion = YES;

        for (CALayer *l in self.layer.sublayers) {
            l.backgroundColor = color.CGColor;
            [l addAnimation:animation forKey:@"change-color"];
        }
    } else {
        for (CALayer *l in self.layer.sublayers) {
            l.backgroundColor = color.CGColor;
        }
    }
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

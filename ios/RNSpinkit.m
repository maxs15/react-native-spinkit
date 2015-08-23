#import "RNSpinkit.h"
#import "RCTConvert.h"
#import "RCTBridgeModule.h"
#import "UIView+React.h"
#import <AVFoundation/AVFoundation.h>

@implementation RNSpinkit
{
}

#pragma mark - React View Management


- (void)layoutSubviews
{
   [super layoutSubviews];
}

- (void)insertReactSubview:(UIView *)view atIndex:(NSInteger)atIndex
{
   [self addSubview:view];
}

- (void)removeReactSubview:(UIView *)subview
{
   [subview removeFromSuperview];
}

- (void)removeFromSuperview
{
   [super removeFromSuperview];
}

@end
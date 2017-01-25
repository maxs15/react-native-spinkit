#import "RNSpinkit.h"
#import <React/RCTConvert.h>
#import <React/RCTBridgeModule.h>
#import <React/UIView+React.h>

@implementation RNSpinkit
{
   RTSpinKitView *_spinner;
   NSString *_type;
   UIColor *_color;
   NSNumber *_size;
}

#pragma mark - Setter

- (void)setSize:(NSNumber*)size {
   _size = size;
   if (_spinner) {
      _spinner.spinnerSize = [size floatValue];
   }
}

- (NSNumber*)size {
   return _size;
}

- (void)setType:(NSString*)type
{
   _type = type;
   if (_spinner) {
      RTSpinKitViewStyle style = [self getStyleFromString:_type];
      [_spinner setStyle:style];
   }
}

- (NSString*)type {
   return _type;
}

- (void)setColor:(NSNumber*)color
{
   _color = [RCTConvert UIColor:color];
   if (_spinner) {
      [_spinner setColor:_color];
   }
}

- (UIColor*)color {
   return _color;
}

#pragma mark - Utility

- (RTSpinKitViewStyle)getStyleFromString:(NSString*)type
{
   RTSpinKitViewStyle style = RTSpinKitViewStylePlane;

   if ([type isEqual:@"CircleFlip"])
      style = RTSpinKitViewStyleCircleFlip;
   else if ([type isEqual:@"Bounce"])
      style = RTSpinKitViewStyleBounce;
   else if ([type isEqual:@"Wave"])
      style = RTSpinKitViewStyleWave;
   else if ([type isEqual:@"WanderingCubes"])
      style = RTSpinKitViewStyleWanderingCubes;
   else if ([type isEqual:@"Pulse"])
      style = RTSpinKitViewStylePulse;
   else if ([type isEqual:@"ChasingDots"])
      style = RTSpinKitViewStyleChasingDots;
   else if ([type isEqual:@"ThreeBounce"])
      style = RTSpinKitViewStyleThreeBounce;
   else if ([type isEqual:@"Circle"])
      style = RTSpinKitViewStyleCircle;
   else if ([type isEqual:@"9CubeGrid"])
      style = RTSpinKitViewStyle9CubeGrid;
   else if ([type isEqual:@"WordPress"])
      style = RTSpinKitViewStyleWordPress;
   else if ([type isEqual:@"FadingCircle"])
      style = RTSpinKitViewStyleFadingCircle;
   else if ([type isEqual:@"FadingCircleAlt"])
      style = RTSpinKitViewStyleFadingCircleAlt;
   else if ([type isEqual:@"Arc"])
      style = RTSpinKitViewStyleArc;
   else if ([type isEqual:@"ArcAlt"])
      style = RTSpinKitViewStyleArcAlt;
   return style;
}

#pragma mark - React View Management

- (void)layoutSubviews
{
   [super layoutSubviews];
   if (_spinner == nil) {
      RTSpinKitViewStyle style = [self getStyleFromString:_type];
      _spinner = [[RTSpinKitView alloc] initWithStyle:style color:_color spinnerSize:[_size floatValue]];
      [self insertSubview:_spinner atIndex:0];
   }
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

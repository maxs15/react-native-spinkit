#import "RNSpinkit.h"
#import "RCTConvert.h"
#import "RCTBridgeModule.h"
#import "UIView+React.h"

@implementation RNSpinkit
{
   RTSpinKitView *_spinner;
   NSString *_type;
   NSString *_color;
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

- (void)setColor:(NSString*)color
{
   _color = color;
   if (_spinner) {
      UIColor *color = [self getColorFromString:_color];
      [_spinner setColor:color];
   }
}

- (NSString*)color {
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

- (UIColor*)getColorFromString:(NSString*)color
{
   unsigned rgbValue = 0;
   NSScanner *scanner = [NSScanner scannerWithString:color];
   [scanner setScanLocation:1]; // bypass '#' character
   [scanner scanHexInt:&rgbValue];

   if (color.length == @"#00000000".length) {
      return [UIColor colorWithRed:((rgbValue & 0xFF000000) >> 24)/255.0 green:((rgbValue & 0xFF0000) >> 16)/255.0 blue:((rgbValue & 0xFF00) >> 8)/255.0 alpha:(rgbValue & 0xFF)/255.0];
   }

   return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

#pragma mark - React View Management

- (void)layoutSubviews
{
   [super layoutSubviews];
   if (_spinner == nil) {
      UIColor *color = [self getColorFromString:_color];
      RTSpinKitViewStyle style = [self getStyleFromString:_type];
      _spinner = [[RTSpinKitView alloc] initWithStyle:style color:color spinnerSize:[_size floatValue]];
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

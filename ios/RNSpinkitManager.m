#import "RNSpinkitManager.h"
#import "RNSpinkit.h"
#import <React/RCTBridge.h>

@implementation RNSpinkitManager

RCT_EXPORT_MODULE();

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

- (UIView *)view
{
    return [[RNSpinkit alloc] init];
}

RCT_EXPORT_VIEW_PROPERTY(type, NSString);
RCT_EXPORT_VIEW_PROPERTY(size, NSNumber);
RCT_EXPORT_VIEW_PROPERTY(color, NSNumber);

@end

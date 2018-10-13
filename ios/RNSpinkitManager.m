#import "RNSpinkitManager.h"
#import "RNSpinkit.h"

#if __has_include(<React/RCTBridge.h>)
#import <React/RCTBridge.h>
#else // Compatibility for RN version < 0.40
#import "RCTBridge.h"
#endif

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

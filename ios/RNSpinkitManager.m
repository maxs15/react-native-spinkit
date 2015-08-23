#import "RNSpinkitManager.h"
#import "RNSpinkit.h"
#import "RCTBridge.h"

@implementation RNSpinkitManager

RCT_EXPORT_MODULE();

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

- (UIView *)view
{
    return [[RNSpinkit alloc] initWithStyle:RTSpinKitViewStyleWave];
}

@end
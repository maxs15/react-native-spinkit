#ifndef RNSpinkit_RCTViewManager_h
#define RNSpinkit_RCTViewManager_h

#if __has_include(<React/RCTViewManager.h>)
#import <React/RCTViewManager.h>
#else // Compatibility for RN version < 0.40
#import "RCTViewManager.h"
#endif

@interface RNSpinkitManager : RCTViewManager

@end


#endif

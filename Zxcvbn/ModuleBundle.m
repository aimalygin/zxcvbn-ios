//
//  ModuleBundle.m
//  Zxcvbn
//
//  Created by Anton Malygin on 04.10.2022.
//  Copyright © 2022 Dropbox. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EXAMPLEPACKAGE_EXAMPLETARGET_SWIFTPM_MODULE_BUNDLER_FINDER : NSObject
@end

@implementation EXAMPLEPACKAGE_EXAMPLETARGET_SWIFTPM_MODULE_BUNDLER_FINDER
@end

NSBundle* EXAMPLEPACKAGE_EXAMPLETARGET_SWIFTPM_MODULE_BUNDLE() {
    NSString *bundleName = @"Zxcvbn_Zxcvbn";

    NSArray<NSURL*> *candidates = @[
        NSBundle.mainBundle.resourceURL,
        [NSBundle bundleForClass:[EXAMPLEPACKAGE_EXAMPLETARGET_SWIFTPM_MODULE_BUNDLER_FINDER class]].resourceURL,
        NSBundle.mainBundle.bundleURL
    ];
    
    for (NSURL* candiate in candidates) {
        NSURL *bundlePath = [candiate URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.bundle", bundleName]];
    
        NSBundle *bundle = [NSBundle bundleWithURL:bundlePath];
        if (bundle != nil) {
            return bundle;
        }
    }
    
    @throw [[NSException alloc] initWithName:@"SwiftPMResourcesAccessor" reason:[NSString stringWithFormat:@"unable to find bundle named %@", bundleName] userInfo:nil];
}

NS_ASSUME_NONNULL_END

//
//  UIApplication+ZDExtend.h
//  ZD
//
//  Created by huhuabin on 2019/6/11.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (ZDExtend)

/// "Documents" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL *zd_documentsURL;
@property (nonatomic, readonly) NSString *zd_documentsPath;

/// "Caches" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL *zd_cachesURL;
@property (nonatomic, readonly) NSString *zd_cachesPath;

/// "Library" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL *zd_libraryURL;
@property (nonatomic, readonly) NSString *zd_libraryPath;

/// Application's Bundle Name (show in SpringBoard).
@property (nullable, nonatomic, readonly) NSString *zd_appBundleName;

/// Application's Bundle ID.  e.g. "com.ibireme.MyApp"
@property (nullable, nonatomic, readonly) NSString *zd_appBundleID;

/// Application's Version.  e.g. "1.2.0"
@property (nullable, nonatomic, readonly) NSString *zd_appVersion;

/// Application's Build number. e.g. "123"
@property (nullable, nonatomic, readonly) NSString *zd_appBuildVersion;

/// Current thread real memory used in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t zd_memoryUsage;

/// Current thread CPU usage, 1.0 means 100%. (-1 when error occurs)
@property (nonatomic, readonly) float zd_cpuUsage;


+ (BOOL)zd_isAppExtension;

+ (nullable UIApplication *)zd_sharedExtensionApplication;

@end

NS_ASSUME_NONNULL_END

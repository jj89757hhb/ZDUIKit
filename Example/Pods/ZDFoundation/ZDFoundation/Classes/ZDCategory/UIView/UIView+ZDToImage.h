//
//  UIView+ZDToImage.h
//  ZD
//
//  Created by huhuabin on 2019/6/11.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ZDToImage)

- (nullable UIImage *)zd_snapshotImage;
- (nullable UIImage *)zd_snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;


@end

NS_ASSUME_NONNULL_END

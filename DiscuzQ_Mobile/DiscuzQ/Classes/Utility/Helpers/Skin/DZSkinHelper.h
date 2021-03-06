//
//  DZSkinHelper.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/2.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZSkinHelper : NSObject

@property (nonatomic, assign,readonly) BOOL bNight;  //!< 属性注释

+ (instancetype)sharedHelper;

- (NSString*)getGrayDarkTitleColorString;

- (NSString*)getGrayDarkTitleColorString:(BOOL)bNight;

- (NSString*)getGrayLightTitleColorString;


@end

NS_ASSUME_NONNULL_END

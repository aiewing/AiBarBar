//
//  AiTabBarController.h
//  AiBarBar
//
//  Created by Aiewing on 2019/3/4.
//  Copyright © 2019 Aiewing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AiTabBarController : UITabBarController

- (instancetype)initTabBarWithControllers:(NSArray<UIViewController *> *)ctls
                                   titles:(NSArray<NSString *> *)titles
                              titleColors:(NSArray<UIColor *> *)titleColors
                        selectTitleColors:(NSArray<UIColor *> *)selectTitleColors
                                   images:(NSArray<UIImage *> *)imgs
                             selectImages:(NSArray<UIImage *> *)selectImgs;

@end

NS_ASSUME_NONNULL_END

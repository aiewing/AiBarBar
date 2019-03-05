//
//  AiTabBarController.m
//  AiBarBar
//
//  Created by Aiewing on 2019/3/4.
//  Copyright © 2019 Aiewing. All rights reserved.
//

#import "AiTabBarController.h"
#import "AiHeader.h"

@interface AiTabBarController ()

@property (nonatomic, strong) UIImageView *bgImgView;

@end

@implementation AiTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)initTabBarWithControllers:(NSArray<UIViewController *> *)ctls
                           titles:(NSArray<NSString *> *)titles
                      titleColors:(NSArray<UIColor *> *)titleColors
                selectTitleColors:(NSArray<UIColor *> *)selectTitleColors
                           images:(NSArray<UIImage *> *)imgs
                     selectImages:(NSArray<UIImage *> *)selectImgs {
    
    for (int i = 0; i < ctls.count; i++) {
        UIViewController *ctl = ctls[i];
        ctl.title = titles[i];
        ctl.tabBarItem = [[UITabBarItem alloc] initWithTitle:titles[i] image:imgs[i] selectedImage:selectImgs[i]];
    }
    
    self.viewControllers = ctls;
    self.tabBar.hidden = true;
    [self.view addSubview:self.bgImgView];
    
    CGFloat subViewWidth = SCREEN_WIDTH / ctls.count;
    for (int i = 0; i < ctls.count; i++) {
        UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(subViewWidth * i, 0, subViewWidth, 49)];
        [self.bgImgView addSubview:subView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, subView.frame.size.height - 15, subViewWidth, 15)];
        [subView addSubview:label];
        label.userInteractionEnabled = true;
        label.text = titles[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:10];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [subView addSubview:imgView];
        imgView.userInteractionEnabled = true;
        imgView.image = imgs[i];
        imgView.center = CGPointMake(subView.frame.size.width / 2, subView.frame.size.height / 2 - 5);
        
        // 添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tabBarTap:)];
        [subView addGestureRecognizer:tap];
    }
}


- (void)viewWillLayoutSubviews {
    
    self.bgImgView.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
}

- (void)tabBarTap:(UITapGestureRecognizer *)tap {
    
}

#pragma mark - Lazy
- (UIImageView *)bgImgView {
    if (!_bgImgView) {
        _bgImgView = [[UIImageView alloc] init];
        _bgImgView.backgroundColor = [UIColor whiteColor];
        _bgImgView.userInteractionEnabled = true;
    }
    return _bgImgView;
}

@end

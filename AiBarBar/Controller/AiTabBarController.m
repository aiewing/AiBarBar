//
//  AiTabBarController.m
//  AiBarBar
//
//  Created by Aiewing on 2019/3/4.
//  Copyright © 2019 Aiewing. All rights reserved.
//

#import "AiTabBarController.h"
#import "AiHeader.h"


#define TitleDefaultColor RGBA(166, 166, 166, 1)
#define SelectTitleDefaultColor RGBA(69, 153, 247, 1)

@interface AiTabBarController ()

@property (nonatomic, strong) UIImageView *bgImgView;

@property (nonatomic, assign) NSInteger tabBarItemCount;
@property (nonatomic, strong) NSArray<UIViewController *> * subControllers;
@property (nonatomic, strong) NSArray<UIColor *> * titleColors;
@property (nonatomic, strong) NSArray<UIColor *> * selectTitleColors;

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
    
    self.subControllers = ctls;
    self.tabBarItemCount = MIN(ctls.count, 5);
    
    for (int i = 0; i < ctls.count; i++) {
        UIViewController *ctl = ctls[i];
        ctl.title = titles[i];
        ctl.tabBarItem = [[UITabBarItem alloc] initWithTitle:titles[i] image:imgs[i] selectedImage:selectImgs[i]];
    }
    
    self.viewControllers = ctls;
    self.tabBar.hidden = true;
    [self.view addSubview:self.bgImgView];
    
    CGFloat subViewWidth = SCREEN_WIDTH / self.tabBarItemCount;
    NSMutableArray *titleColorArr = [NSMutableArray array];
    NSMutableArray *selectTitleColorArr = [NSMutableArray array];
    for (int i = 0; i < self.tabBarItemCount; i++) {
        UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(subViewWidth * i, 0, subViewWidth, 49)];
        [self.bgImgView addSubview:subView];
        subView.tag = i + 100;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, subView.frame.size.height - 15, subViewWidth, 15)];
        [subView addSubview:label];
        label.tag = i + 120;
        label.userInteractionEnabled = true;
        label.text = titles[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:10];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [subView addSubview:imgView];
        imgView.tag = i + 140;
        imgView.userInteractionEnabled = true;
        imgView.image = imgs[i];
        imgView.center = CGPointMake(subView.frame.size.width / 2, subView.frame.size.height / 2 - 5);
        
        // 添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tabBarTap:)];
        [subView addGestureRecognizer:tap];
        
        if (titleColors[i]) {
            [titleColorArr addObject:titleColors[i]];
        } else {
            if (titleColors.firstObject) {
                [titleColorArr addObject:titleColors.firstObject];
            } else {
                [titleColorArr addObject:TitleDefaultColor];
            }
        }
        
        if (selectTitleColors[i]) {
            [selectTitleColorArr addObject:selectTitleColors[i]];
        } else {
            if (selectTitleColors.firstObject) {
                [selectTitleColorArr addObject:selectTitleColors.firstObject];
            } else {
                [selectTitleColorArr addObject:SelectTitleDefaultColor];
            }
        }
        
        self.titleColors = titleColorArr;
        self.selectTitleColors = selectTitleColorArr;
    }
}


- (void)viewWillLayoutSubviews {
    
    self.bgImgView.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
    
    CGFloat subViewWidth = SCREEN_WIDTH / self.tabBarItemCount;
    for (int i = 0; i < self.tabBarItemCount; i++) {
        UIView *subView = [self.bgImgView viewWithTag:i + 100];
        subView.frame = CGRectMake(subViewWidth * i, 0, subViewWidth, 49);
        
        UILabel *label = (UILabel *)[self.bgImgView viewWithTag:i + 120];
        label.frame = CGRectMake(0, subView.frame.size.height - 15, subViewWidth, 15);
        
        UIImageView *imgView = (UIImageView *)[self.bgImgView viewWithTag:i + 140];
        imgView.center = CGPointMake(subView.frame.size.width / 2, subView.frame.size.height / 2 - 5);
    }
}

- (void)tabBarTap:(UITapGestureRecognizer *)tap {
    // 点击的时候字体需要有变化
    for (int i = 0; i < self.tabBarItemCount; i++) {
        UILabel *label = (UILabel *)[self.bgImgView viewWithTag:i + 120];
        if (label.tag == tap.view.tag + 20) {
            label.textColor = self.selectTitleColors[i];
        } else {
            label.textColor = self.titleColors[i];
        }
    }
    
    // 切换控制器
    self.selectedIndex = tap.view.tag - 100;
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

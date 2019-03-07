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
#define DefaultTitle @"默认"

@interface AiTabBarController ()

@property (nonatomic, strong) UIImageView *bgImgView;

@property (nonatomic, assign) NSInteger tabBarItemCount;
@property (nonatomic, strong) NSArray<UIViewController *> * subControllers;
@property (nonatomic, strong) NSArray<NSString *> * titles;
@property (nonatomic, strong) NSArray<UIColor *> * titleColors;
@property (nonatomic, strong) NSArray<UIColor *> * selectTitleColors;
@property (nonatomic, strong) NSArray<UIImage *> * images;
@property (nonatomic, strong) NSArray<UIImage *> * selectImages;

@end

@implementation AiTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (instancetype)initTabBarWithControllers:(NSArray<UIViewController *> *)ctls
                           titles:(NSArray<NSString *> *)titles
                      titleColors:(NSArray<UIColor *> *)titleColors
                selectTitleColors:(NSArray<UIColor *> *)selectTitleColors
                           images:(NSArray<UIImage *> *)imgs
                     selectImages:(NSArray<UIImage *> *)selectImgs {
    
    self = [super init];
    if (self) {
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
        NSMutableArray *titleArr = [NSMutableArray array];
        NSMutableArray *titleColorArr = [NSMutableArray array];
        NSMutableArray *selectTitleColorArr = [NSMutableArray array];
        NSMutableArray *imgArr = [NSMutableArray array];
        NSMutableArray *selectImgArr = [NSMutableArray array];
        for (int i = 0; i < self.tabBarItemCount; i++) {
            
            // 重新计算参数 防止遗漏和越界
            if (titles[i]) {
                [titleArr addObject:titles[i]];
            } else {
                [titleArr addObject:DefaultTitle];
            }
            
            // 重新计算正常状态颜色
            if (titleColors[i]) {
                [titleColorArr addObject:titleColors[i]];
            } else {
                if (titleColors.firstObject) {
                    [titleColorArr addObject:titleColors.firstObject];
                } else {
                    [titleColorArr addObject:TitleDefaultColor];
                }
            }
            
            // 重新计算选中状态颜色
            if (selectTitleColors[i]) {
                [selectTitleColorArr addObject:selectTitleColors[i]];
            } else {
                if (selectTitleColors.firstObject) {
                    [selectTitleColorArr addObject:selectTitleColors.firstObject];
                } else {
                    [selectTitleColorArr addObject:SelectTitleDefaultColor];
                }
            }
            
            if (imgs[i]) {
                [imgArr addObject:imgs[i]];
            } else {
                [imgArr addObject:[UIImage new]];
            }
            
            if (selectImgs[i]) {
                [selectImgArr addObject:selectImgs[i]];
            } else {
                [selectImgArr addObject:[UIImage new]];
            }
            
            
            UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(subViewWidth * i, 0, subViewWidth, 49)];
            [self.bgImgView addSubview:subView];
            subView.tag = i + 100;
            
            // 文字
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, subView.frame.size.height - 15, subViewWidth, 15)];
            [subView addSubview:label];
            label.tag = i + 120;
            label.userInteractionEnabled = true;
            label.text = titleArr[i];
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:10];
            if (i == self.selectedIndex) {
                label.textColor = selectTitleColorArr[i];
            } else {
                label.textColor = titleColorArr[i];
            }
            
            // 图片
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
            [subView addSubview:imgView];
            imgView.tag = i + 140;
            imgView.userInteractionEnabled = true;
            imgView.center = CGPointMake(subView.frame.size.width / 2, subView.frame.size.height / 2 - 5);
            if (i == self.selectedIndex) {
                imgView.image = selectImgs[i];
            } else {
                imgView.image = imgs[i];
            }
            
            // 添加手势
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tabBarTap:)];
            [subView addGestureRecognizer:tap];
            
            
        }
        
        self.subControllers = ctls;
        self.titles = titleArr;
        self.titleColors = titleColorArr;
        self.selectTitleColors = selectTitleColorArr;
        self.images = imgArr;
        self.selectImages = selectImgArr;
    }
    return self;
    
    
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
    self.selectedIndex = tap.view.tag - 100;
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    
    // 切换控制器
    [super setSelectedIndex:selectedIndex];
    
    for (int i = 0; i < self.tabBarItemCount; i++) {
        UILabel *label = (UILabel *)[self.bgImgView viewWithTag:i + 120];
        if (label.tag == selectedIndex + 120) {
            label.textColor = self.selectTitleColors[i];
        } else {
            label.textColor = self.titleColors[i];
        }
        
        UIImageView *imgView = (UIImageView *)[self.bgImgView viewWithTag:i + 140];
        if (imgView.tag == selectedIndex + 140) {
            imgView.image = self.selectImages[i];
        } else {
            imgView.image = self.images[i];
        }
    }
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

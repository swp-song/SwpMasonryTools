
//
//  ViewController.m
//  SwpMasonryToolsDemo
//
//  Created by swp_song on 2017/1/17.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "ViewController.h"

#import <Masonry/Masonry.h>
#import "SwpMasonryTools.h"

@interface ViewController ()


@property (nonatomic, strong) UIButton *topView;
@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, copy) NSArray<UIView *> *views;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpUI];
    
    [self setUIAutoLayout];
    
    
    [SwpMasonryTools swpMasonryToolsCreateEqualWidthViews:self.views superView:self.view setLRPadding:10 setViewPadding:10 setTopPadding:10 setBottomPadding:10 setEqualTopView:self.topView setEqualBottomView:self.bottomView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**!
 *  @ author swp_song
 *
 *  @ brief  setupUI ( 添加控件 )
 */
- (void)setUpUI {
    
    [self.view addSubview:self.topView];
    [self.view addSubview:self.bottomView];

}

/**!
 *  @ author swp_song
 *
 *  @ brief  setUIAutoLayout ( 设置控件的自动布局 )
 */
- (void)setUIAutoLayout {

    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view).mas_offset(UIEdgeInsetsMake(100, 20, 0, 20));
        make.height.equalTo(@(50));
    }];
    
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(self.topView);
        make.bottom.equalTo(@(-100));
    }];
    
}

- (void)clickEvent:(UIButton *)button {
    
    
    [SwpMasonryTools swpMasonryToolsRemoveAllConstraintsAndView:self.views];
    
    self.views = [self randomViews];
    
    [SwpMasonryTools swpMasonryToolsCreateEqualWidthViews:self.views superView:self.view setLRPadding:20 setViewPadding:20 setTopPadding:10 setBottomPadding:10 setEqualTopView:self.topView setEqualBottomView:self.bottomView];
}


/**!
 *  @ author swp_song
 *
 *  @ brief  randomViews    ( 生成一个 随机 views )
 *
 *  @ return NSArray
 */
- (NSArray<UIView *> *)randomViews {
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i<arc4random_uniform(10); i++) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:255];
        [array addObject:view];
    }
    return array.copy;
}

- (UIButton *)topView {
    return !_topView ? _topView = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor orangeColor];
        [button setTitle:@"随机" forState:UIControlStateNormal];
        [button setTitle:@"随机" forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(clickEvent:) forControlEvents:UIControlEventTouchUpInside];
        button;
    }) : _topView;
}

- (UIView *)bottomView {
    return !_bottomView ? _bottomView = ({
        UIView *view         = [UIView new];
        view.backgroundColor = [UIColor purpleColor];
        view;
    }) : _bottomView;
}

- (NSArray<UIView *> *)views {
    
    return !_views ? _views = ({
        NSArray *array = [self randomViews];
        array;
    }) : _views;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

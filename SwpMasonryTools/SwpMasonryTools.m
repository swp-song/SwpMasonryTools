//
//  SwpMasonryTools.m
//  swp_song
//
//  Created by swp_song on 2017/1/17.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpMasonryTools.h"

/*! ---------------------- Tool       ---------------------- !*/
#import "Masonry.h"                     // Masonry 自动布局框架 
/*! ---------------------- Tool       ---------------------- !*/

@implementation SwpMasonryTools


/**!
 *  @ author swp_song
 *
 *  @ brief  swpMasonryToolsCreateEqualWidthViews:superView:setLRPadding:setViewPadding:setTopPadding:setBottomPadding:setEqualTopView:setEqualBottomView: ( 创建 等宽度 视图  )
 *
 *  @ param  views              需要添加view
 *
 *  @ param  superView          添加 到 superView
 *
 *  @ param  lrPadding          距 SuperView 的左右边距
 *
 *  @ param  viewPadding        每个 View 的左右边距
 *
 *  @ param  topPadding         equalTopView ? 距离 equalTopView 边距 : 距离 superView 边距
 *
 *  @ param  bottomPadding      equalBottomView ? 距离 equalBottomView 边距 : 距离 superView 边距
 *
 *  @ param  equalTopView       equalTopView ? equalTopView : superView
 *
 *  @ param  equalBottomView    equalBottomView ? equalBottomView : superView
 */
+(void)swpMasonryToolsCreateEqualWidthViews:(NSArray<UIView *> *)views superView:(UIView *)superView setLRPadding:(CGFloat)lrPadding setViewPadding:(CGFloat)viewPadding setTopPadding:(CGFloat)topPadding setBottomPadding:(CGFloat)bottomPadding setEqualTopView:(UIView *)equalTopView setEqualBottomView:(UIView *)equalBottomView {
    
    if (!views || !superView) return;
    
    __block UIView *lastView;
    
    [views enumerateObjectsUsingBlock:^(UIView * _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (![view isKindOfClass:[UIView class]]) {
            
            * stop = YES;
            return;
        }
        
        [superView addSubview:view];
        
        if (lastView) {
            
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(lastView.mas_right).offset(viewPadding);
                make.width.equalTo(lastView);
            }];
            
        } else {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(superView).offset(lrPadding);
            }];
        }
        
        [view mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(equalTopView ? equalTopView.mas_bottom : superView).offset(topPadding);
            make.bottom.equalTo(equalBottomView ? equalBottomView.mas_top : superView).offset(-bottomPadding);
        }];
        
        lastView = view;
    }];
    
    [lastView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(superView).offset(-lrPadding);
    }];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpMasonryToolsRemoveAllConstraintsAndView:    ( 移除 数组中 所有 Views 的约束 And Views )
 *
 *  @ param  views
 */
+ (void)swpMasonryToolsRemoveAllConstraintsAndView:(NSArray<UIView *> *)views {
    
    if (!views) return;
    
    [views enumerateObjectsUsingBlock:^(UIView * _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
        if (![view isKindOfClass:[UIView class]]) {
            * stop = YES;
            return;
        }
        
        [view mas_remakeConstraints:^(MASConstraintMaker *make) {
            
        }];
        [view removeFromSuperview];
    }];
    
    
}

@end

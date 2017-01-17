//
//  SwpMasonryTools.h
//  swp_song
//
//  Created by swp_song on 2017/1/17.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

@import UIKit;

NS_ASSUME_NONNULL_BEGIN
@interface SwpMasonryTools : NSObject


/**!
 *  @ author swp_song
 *
 *  @ brief  swpMasonryToolsCreateEqualWidthViews:superView:setLRPadding:setViewPadding:setTopPadding:setBottomPadding:setEqualTopView:setEqualBottomView: ( 创建 多个 等宽度 视图 )
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
+(void)swpMasonryToolsCreateEqualWidthViews:(NSArray<UIView *> *)views superView:(UIView *)superView setLRPadding:(CGFloat)lrPadding setViewPadding:(CGFloat)viewPadding setTopPadding:(CGFloat)topPadding setBottomPadding:(CGFloat)bottomPadding setEqualTopView:(nullable UIView *)equalTopView setEqualBottomView:(nullable UIView *)equalBottomView;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpMasonryToolsRemoveAllConstraintsAndView:    ( 移除 数组中 所有 views 的约束 And views )
 *
 *  @ param  views
 */
+ (void)swpMasonryToolsRemoveAllConstraintsAndView:(NSArray<UIView *> *)views;

@end
NS_ASSUME_NONNULL_END

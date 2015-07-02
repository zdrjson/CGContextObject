//
//  CGContextObject.h
//  DrawRect
//
//  Created by YouXianMing on 15/7/2.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "RGBColor.h"
@class CGContextObject;


typedef void(^CGContextObjectDrawBlock_t)(CGContextObject *contextObject);


@interface CGContextObject : NSObject

/**
 *  操作句柄
 */
@property (nonatomic)          CGContextRef   context;

/**
 *  线头样式
 */
@property (nonatomic)          CGLineCap      lineCap;

/**
 *  线条宽度
 */
@property (nonatomic)          CGFloat        lineWidth;

/**
 *  线条颜色
 */
@property (nonatomic, strong)  RGBColor      *strokeColor;

/**
 *  填充颜色
 */
@property (nonatomic, strong)  RGBColor      *fillColor;

/**
 *  由context进行初始化
 *
 *  @param context 绘制句柄
 *
 *  @return 绘制对象
 */
- (instancetype)initWithCGContext:(CGContextRef)context;

#pragma mark -
/**
 *  开始path
 */
- (void)beginPath;

/**
 *  关闭path
 */
- (void)closePath;

/**
 *  线条绘制
 */
- (void)strokePath;

/**
 *  填充绘制
 */
- (void)fillPath;

/**
 *  线条绘制 + 填充绘制
 */
- (void)strokeAndFillPath;

/**
 *  绘制线条用block (beginPath + closePath + 你绘制的代码 + strokePath)
 *
 *  @param block 绘制用block
 */
- (void)drawStrokeBlock:(CGContextObjectDrawBlock_t)block;

/**
 *  填充区域用block (beginPath + closePath + 你绘制的代码 + fillPath)
 *
 *  @param block 填充用block
 */
- (void)drawFillBlock:(CGContextObjectDrawBlock_t)block;

/**
 *  绘制加填充
 *
 *  @param block 绘制加填充用block
 */
- (void)drawStrokeAndFillBlock:(CGContextObjectDrawBlock_t)block;

#pragma mark - 

/**
 *  将当前设置存取到栈区中(入栈操作)
 */
- (void)saveStateToStack;

/**
 *  从栈区中取出之前保存的设置(出栈操作)
 */
- (void)restoreStateFromStack;

#pragma mark -
/**
 *  移动到起始点
 *
 *  @param point 起始点
 */
- (void)moveToStartPoint:(CGPoint)point;

/**
 *  添加一个点(与上一个点直线相连)
 *
 *  @param point 点
 */
- (void)addLineToPoint:(CGPoint)point;

#pragma mark - 
/**
 *  添加一个矩形
 *
 *  @param rect
 */
- (void)addRect:(CGRect)rect;

/**
 *  在给定的矩形中绘制椭圆
 *
 *  @param rect
 */
- (void)addEllipseInRect:(CGRect)rect;

/**
 *  将string绘制在指定的点上
 *
 *  @param string     字符串
 *  @param point      点
 *  @param attributes 富文本
 */
- (void)drawString:(NSString *)string atPoint:(CGPoint)point withAttributes:(NSDictionary *)attributes;

@end

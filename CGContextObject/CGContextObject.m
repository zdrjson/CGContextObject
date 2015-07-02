//
//  CGContextObject.m
//  DrawRect
//
//  Created by YouXianMing on 15/7/2.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "CGContextObject.h"

@interface CGContextObject ()

@end

@implementation CGContextObject

- (instancetype)initWithCGContext:(CGContextRef)context {
    
    self = [super init];
    if (self) {
        
        self.context = context;
    }
    
    return self;
}

- (void)moveToStartPoint:(CGPoint)point {
    
    if (_context) {
        CGContextMoveToPoint(_context, point.x, point.y);
    }
}

- (void)addLineToPoint:(CGPoint)point {
    
    if (_context) {
        CGContextAddLineToPoint(_context, point.x, point.y);
    }
}

- (void)addRect:(CGRect)rect {

    if (_context) {
        CGContextAddRect(_context, rect);
    }
}

- (void)addEllipseInRect:(CGRect)rect {
    
    if (_context) {
        CGContextAddEllipseInRect(_context, rect);
    }
}

- (void)drawString:(NSString *)string atPoint:(CGPoint)point withAttributes:(NSDictionary *)attributes {

    [string drawAtPoint:point withAttributes:attributes];
}

- (void)beginPath {
    
    if (_context) {
        CGContextBeginPath(_context);
    }
}

- (void)closePath {

    if (_context) {
        CGContextClosePath(_context);
    }
}

- (void)strokePath {

    if (_context) {
        CGContextStrokePath(_context);
    }
}

- (void)fillPath {

    if (_context) {
        CGContextFillPath(_context);
    }
}

- (void)strokeAndFillPath {

    if (_context) {
        CGContextDrawPath(_context, kCGPathFillStroke);
    }
}

- (void)drawStrokeBlock:(CGContextObjectDrawBlock_t)block {

    [self beginPath];
    
    __weak CGContextObject *weakSelf = self;
    
    block(weakSelf);
    
    [self closePath];
    
    [self strokePath];
}

- (void)drawFillBlock:(CGContextObjectDrawBlock_t)block {
    
    [self beginPath];
    
    __weak CGContextObject *weakSelf = self;
    
    block(weakSelf);
    
    [self closePath];
    
    [self fillPath];
}

- (void)drawStrokeAndFillBlock:(CGContextObjectDrawBlock_t)block {

    [self beginPath];
    
    __weak CGContextObject *weakSelf = self;
    
    block(weakSelf);
    
    [self closePath];
    
    [self strokeAndFillPath];
}

- (void)saveStateToStack {
    
    if (_context) {
        CGContextSaveGState(_context);
    }
}

- (void)restoreStateFromStack {
    
    if (_context) {
        CGContextRestoreGState(_context);
    }
}

#pragma mark - 重写setter,getter方法
@synthesize strokeColor = _strokeColor;
- (void)setStrokeColor:(RGBColor *)strokeColor {

    if (_context) {
        
        _strokeColor = strokeColor;
        CGContextSetRGBStrokeColor(_context, strokeColor.red, strokeColor.green, strokeColor.blue, strokeColor.alpha);
    }
}
- (RGBColor *)strokeColor {

    return _strokeColor;
}

@synthesize fillColor = _fillColor;
- (void)setFillColor:(RGBColor *)fillColor {
    
    if (_context) {
        
        _fillColor = fillColor;
        CGContextSetRGBFillColor(_context, fillColor.red, fillColor.green, fillColor.blue, fillColor.alpha);
    }
}
- (RGBColor *)fillColor {
    
    return _fillColor;
}

@synthesize lineWidth = _lineWidth;
- (void)setLineWidth:(CGFloat)lineWidth {
    
    if (_context) {
        
        _lineWidth = lineWidth;
        CGContextSetLineWidth(_context, lineWidth);
    }
}
- (CGFloat)lineWidth {
    
    return _lineWidth;
}

@synthesize lineCap = _lineCap;
- (void)setLineCap:(CGLineCap)lineCap {
    
    if (_context) {
    
        _lineCap = lineCap;
        CGContextSetLineCap(_context, lineCap);
    }
    
}
- (CGLineCap)lineCap {

    return _lineCap;
}

@end

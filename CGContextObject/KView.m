//
//  KView.m
//  CGContextObject
//
//  Created by YouXianMing on 15/7/2.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "KView.h"
#import "CGContextObject.h"

@interface KView ()

@property (nonatomic, strong) CGContextObject  *contextObject;

@end

@implementation KView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGFloat height = self.frame.size.height;

    // 获取操作句柄
    _contextObject = [[CGContextObject alloc] initWithCGContext:UIGraphicsGetCurrentContext()];

    
    // 开始绘图
    for (int count = 0; count < 7; count++) {
     
        CGFloat lineHeight = arc4random() % (int)(height - 20);
        
        // 绘制矩形
        [_contextObject drawFillBlock:^(CGContextObject *contextObject) {
            _contextObject.fillColor = [RGBColor randomColor];
            [contextObject addRect:CGRectMake(count * 30, height - lineHeight, 15, lineHeight)];
            
        }];
        
        // 绘制文字
        [_contextObject drawString:[NSString stringWithFormat:@"%.f", lineHeight / 10.f]
                           atPoint:CGPointMake(2 + count * 30, height - lineHeight - 20)
                    withAttributes:nil];
        
    }
}

@end

//
//  CZPointView.m
//  EraseImage
//
//  Created by wangwenjian on 2022/2/21.
//

#import "CZPointView.h"

@interface CZPointView ()
 
// 保存 “所有线”的点
@property (nonatomic, strong) NSMutableArray *pointOfAllLine;
 
// 保存线的颜色
@property (nonatomic, strong) NSMutableArray *colorOfLine;
 
@end

@implementation CZPointView

// 懒加载
- (NSMutableArray *)pointOfAllLine{
    if (!_pointOfAllLine) {
        _pointOfAllLine = [NSMutableArray array];
    }
    return _pointOfAllLine;
}
 
- (NSMutableArray *)colorOfLine{
    if (!_colorOfLine) {
        _colorOfLine = [NSMutableArray array];
    }
    return _colorOfLine;
}
 
- (void)drawRect:(CGRect)rect{
    
    // 创建一个图层上下文
    CGContextRef layerContext = UIGraphicsGetCurrentContext();
    
    // 设置线宽
    CGContextSetLineWidth(layerContext, 2);
    // 设置线首尾样式与连接点的样式
    CGContextSetLineCap(layerContext, kCGLineCapRound);
    CGContextSetLineJoin(layerContext, kCGLineJoinRound);
    
//    NSArray *pointsOfALine = self.pointOfAllLine.lastObject;
//    UIColor *lineColor = self.colorOfLine.lastObject;
//    [lineColor set];;
//    NSInteger pointsCount = pointsOfALine.count;
//    for (NSInteger j = 0; j < pointsCount; j++) {
//        CGPoint point = [pointsOfALine[j] CGPointValue];
//        if (j == 0) {
//            CGContextMoveToPoint(layerContext, point.x, point.y);
//        }else{
//            CGContextAddLineToPoint(layerContext, point.x, point.y);
//        }
//    }
//    CGContextStrokePath(layerContext);

    // 遍历每条线
    NSInteger lineCount = self.pointOfAllLine.count;
    for (NSInteger i = 0; i < lineCount; i++) {
        // 取出当前第一条线的数组
        NSArray *pointsOfALine = self.pointOfAllLine[i];
        
        // 设置线的颜色
        UIColor *lineColor = self.colorOfLine[i];
        [lineColor set];
        
        // 取出线的点进行绘制
        NSInteger pointsCount = pointsOfALine.count;
        for (NSInteger j = 0; j < pointsCount; j++) {
            CGPoint point = [pointsOfALine[j] CGPointValue];
            if (j == 0) {
                CGContextMoveToPoint(layerContext, point.x, point.y);
            }else{
                CGContextAddLineToPoint(layerContext, point.x, point.y);
            }
        }
        // 渲染
        CGContextStrokePath(layerContext);
    }
   
}
 
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    // 创建一个数组用来存放一条线的点
    NSMutableArray *pointOfALine = [NSMutableArray array];
    
    // 将这条线添加到所有线的数组中
    [self.pointOfAllLine addObject:pointOfALine];
    
    // 保存当前 “一条线”的颜色
    if (!self.currentColor) { // 如果为空就给个默认颜色：黑色
        [self.colorOfLine addObject:[UIColor blackColor]];
    }else{
        [self.colorOfLine addObject:self.currentColor];
    }
    
}
 
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    // 获取当前的UITouch对象
    UITouch *touch = [touches anyObject];
    
    // 获取当前手势的位置
    CGPoint touchPoint = [touch locationInView:touch.view];
    
    // 将获取的位置添加到 “一条线” 数组中
    // 获取当前线的数组
    NSMutableArray *pointsOfLine = [self.pointOfAllLine lastObject];
    [pointsOfLine addObject:[NSValue valueWithCGPoint:touchPoint]];
    
    // 根据触摸的点进行绘制
    [self setNeedsDisplay];
}
 
 
// 清空
- (void)clear{
    // 删除所有的线与颜色
    [self.pointOfAllLine removeAllObjects];
    [self.colorOfLine removeAllObjects];
    // 重新绘制
    [self setNeedsDisplay];
   
}
 
// 返回上一步
- (void)back{
    // 删除最后一条线
    [self.pointOfAllLine removeLastObject];
    
    // 重新绘制
    [self setNeedsDisplay];
}
 
// 保存
- (void)save{
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(self.bounds.size);
    
    // 把当前view画在位图上下文
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // 获取图片
    UIImage *captureImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 结束编辑
    UIGraphicsEndImageContext();
    
    // 保存图片到沙盒中
    // 获取document目录
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    // 拼接完整路径
    NSString *path = [document stringByAppendingPathComponent:@"capture.png"];
    
    // 将图片保存为NSData类型
    NSData *imageData = UIImagePNGRepresentation(captureImage);
    // 写入路径
    [imageData writeToFile:path atomically:YES];
    
}

@end

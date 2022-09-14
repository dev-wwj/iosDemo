//
//  CZPointView.h
//  EraseImage
//
//  Created by wangwenjian on 2022/2/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CZPointView : UIView


@property (nonatomic, strong) UIColor *currentColor;
 
// 返回一步
- (void)back;
// 清屏
- (void)clear;
// 保存
- (void)save;

@end

NS_ASSUME_NONNULL_END

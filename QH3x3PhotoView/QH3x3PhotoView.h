//
//  QH3x3PhotoView.h
//  QH3x3PhotoView
//
//  Created by Chie Li on 15/12/9.
//  Copyright © 2015年 ChieLi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QH3x3PhotoViewDelegate <NSObject>

- (void)didSelectItemWithIndex:(NSInteger)index;

@end

@interface QH3x3PhotoView : UIView

@property (nonatomic, assign) id<QH3x3PhotoViewDelegate>delegate;

- (void)bindImageArray:(NSArray *)imageArray;

- (CGFloat)heightForView;

@end

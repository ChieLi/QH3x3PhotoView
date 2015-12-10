//
//  QH3x3PhotoView.m
//  QH3x3PhotoView
//
//  Created by Chie Li on 15/12/9.
//  Copyright © 2015年 ChieLi. All rights reserved.
//

#import "QH3x3PhotoView.h"


#define kSingleItemHeight 150
#define kMultyItemHeight 100
#define kMultyItemWidth 100
#define kSpacing 5

#define kBaiscTag 1646

@interface QH3x3PhotoView ()

@property (nonatomic, assign) NSInteger imageCount;
@property (nonatomic, strong) NSArray *imageArray;

@property (nonatomic, assign) NSInteger rowCount;
@property (nonatomic, assign) NSInteger ColumnCount;


@end

@implementation QH3x3PhotoView

- (NSInteger)imageCount
{
    if (self.imageArray) {
        
        return self.imageArray.count;
    } else {
    
        return 0;
    }
}

- (NSInteger)rowCount
{
    NSInteger row = self.imageCount / self.ColumnCount;
    NSInteger mod = self.imageCount % self.ColumnCount;
    
    return mod == 0 ? row : row+1;
}

- (NSInteger)ColumnCount
{
    if (self.imageCount == 1) {
        return 1;
    } else if (self.imageCount == 2 || self.imageCount == 4) {
        return 2;
    } else {
        return 3;
    }
}

- (void)bindImageArray:(NSArray *)imageArray
{
    self.imageArray = imageArray;
    

    
    if (self.imageCount == 1) {
        UIImage *image = self.imageArray[0];
        
        CGFloat imageWidth = kSingleItemHeight * image.size.width / image.size.height;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imageWidth, kSingleItemHeight)];
        imageView.tag = kBaiscTag;
        imageView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickedAction:)];
        
        [imageView addGestureRecognizer:tap];
        imageView.image = self.imageArray[0];
        
        [self addSubview:imageView];
        
        self.frame = CGRectMake(kSpacing, kSpacing, imageView.frame.size.width, imageView.frame.size.height);

    } else {
        
        for (int i = 0; i < self.imageCount; i++) {
            
            NSInteger mod = (i + 1) % self.ColumnCount;
            
            
            NSInteger row = (i + 1) / self.ColumnCount;
            row = mod == 0 ? row : row + 1;
            
            NSInteger column = mod == 0? self.ColumnCount : mod;
            
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((column - 1) * (kMultyItemWidth + kSpacing), (row - 1)*(kMultyItemHeight + kSpacing), kMultyItemWidth, kMultyItemHeight)];
            
            imageView.tag = kBaiscTag + i;
            imageView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickedAction:)];
            [imageView addGestureRecognizer:tap];
            
            
            imageView.image = [self getSubImage:self.imageArray[i]];
            
            [self addSubview:imageView];
            
        }
        
        CGFloat width = self.ColumnCount * kMultyItemWidth + (self.ColumnCount - 1) * kSpacing;
        CGFloat height = self.rowCount *kMultyItemHeight + (self.ColumnCount - 1) * kSpacing;
        self.frame = CGRectMake(0, 0, width, height);

    }
    
}

- (CGFloat)heightForView
{
    if (self.imageCount == 1) {
        
        return kSingleItemHeight;
    } else {
        
        return self.rowCount * kMultyItemHeight + (self.rowCount - 1) * kSpacing;
    }

}

- (void)clickedAction:(UITapGestureRecognizer *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectItemWithIndex:)]) {

        NSInteger index = sender.view.tag - kBaiscTag;
        
        [self.delegate didSelectItemWithIndex:index];
    }
}

#pragma mark - private

// 获取方形缩略图
- (UIImage *)getSubImage:(UIImage *)image
{
    CGFloat originalWidth = image.size.width;
    CGFloat originalHeight = image.size.height;
    
    CGFloat subImageSize = originalWidth < originalHeight ? originalWidth : originalHeight;
    
    CGFloat x = (originalWidth - subImageSize) / 2.0f;
    CGFloat y = (originalHeight - subImageSize) / 2.0f;
    
    CGRect subRect = CGRectMake(x, y, subImageSize, subImageSize);
    
    CGImageRef subImageRef = CGImageCreateWithImageInRect(image.CGImage, subRect);
    
    CGRect subBounds = CGRectMake(0, 0, kMultyItemWidth, kMultyItemHeight);
    
    UIGraphicsBeginImageContext(subBounds.size);
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextDrawImage(contextRef, subBounds, subImageRef);
    
    UIImage *subImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
    return subImage;
    
}



@end

//
//  GifView.h
//  GifDemo
//
//  Created by chuanglong03 on 16/6/16.
//  Copyright © 2016年 chuanglong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>

@interface GifView : UIView

{
    CGImageSourceRef gif;            // 保存 gif 动画
    NSDictionary     *gifProperties; // 保存 gif 动画属性
    size_t           index;          // gif 动画播放开始的帧序号
    size_t           count;          // gif 动画的总帧数
    NSTimer          *timer;         // 播放 gif 动画所使用的 timer
}

- (id)initWithFrame:(CGRect)frame filePath:(NSString *)filePath;
- (id)initWithFrame:(CGRect)frame data:(NSData *)data;
- (void)stopGif;

@end

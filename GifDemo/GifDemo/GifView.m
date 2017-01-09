//
//  GifView.m
//  GifDemo
//
//  Created by chuanglong03 on 16/6/16.
//  Copyright © 2016年 chuanglong. All rights reserved.
//

#import "GifView.h"

@implementation GifView

- (id)initWithFrame:(CGRect)frame filePath:(NSString *)filePath {
    self = [super initWithFrame:frame];
    if (self) {
        NSDictionary *dic = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:(NSString *)kCGImagePropertyGIFLoopCount];
        gifProperties = [NSDictionary dictionaryWithObject:dic forKey:(NSString *)kCGImagePropertyGIFDictionary];
        gif = CGImageSourceCreateWithURL((CFURLRef)[NSURL fileURLWithPath:filePath], (CFDictionaryRef)gifProperties);
        count = CGImageSourceGetCount(gif);
        timer = [NSTimer scheduledTimerWithTimeInterval:0.12 target:self selector:@selector(play) userInfo:nil repeats:YES];
        [timer fire];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame data:(NSData *)data {
    self = [super initWithFrame:frame];
    if (self) {
        NSDictionary *dic = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:(NSString *)kCGImagePropertyGIFLoopCount];
        gifProperties = [NSDictionary dictionaryWithObject:dic forKey:(NSString *)kCGImagePropertyGIFDictionary];
        gif = CGImageSourceCreateWithData((CFDataRef)data, (CFDictionaryRef)gifProperties);
        count = CGImageSourceGetCount(gif);
        timer = [NSTimer scheduledTimerWithTimeInterval:0.12 target:self selector:@selector(play) userInfo:nil repeats:YES];
        [timer fire];
    }
    return self;
}

//- (instancetype)initGifProperties {
//    NSDictionary *dic = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:(NSString *)kCGImagePropertyGIFLoopCount];
//    return [NSDictionary dictionaryWithObject:dic forKey:(NSString *)kCGImagePropertyGIFDictionary];
//}

- (void)play {
    index++;
    index = index % count;
    CGImageRef ref = CGImageSourceCreateImageAtIndex(gif, index, (CFDictionaryRef)gifProperties);
    self.layer.contents = (__bridge id)ref;
}

- (void)removeFromSuperview {
    [timer invalidate];
    timer = nil;
    [super removeFromSuperview];
}

- (void)stopGif {
    [timer invalidate];
    timer = nil;
}

@end

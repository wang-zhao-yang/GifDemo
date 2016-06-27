//
//  ViewController.m
//  GifDemo
//
//  Created by chuanglong03 on 16/6/16.
//  Copyright © 2016年 chuanglong. All rights reserved.
//

#define kX [UIScreen mainScreen].bounds.size.width/2.0-100

#import "ViewController.h"
#import "GifView.h"
#import "UIImage+GIF.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // GifView
    GifView *dataView = [[GifView alloc] initWithFrame:CGRectMake(kX, 20, 200, 150) data:[self loadDataForIndex:1]];
    [self.view addSubview:dataView];
    
    // WebView
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(kX, 190, 200, 150)];
    webView.backgroundColor = [UIColor whiteColor];
    webView.scalesPageToFit = YES;
    [webView loadData:[self loadDataForIndex:1] MIMEType:@"image/gif" textEncodingName:@"" baseURL:[NSURL URLWithString:@""]];
    [self.view addSubview:webView];
    
    // SDWebImage
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kX, 360, 200, 150)];
    imageView.image = [UIImage sd_animatedGIFWithData:[self loadDataForIndex:1]];
    [self.view addSubview:imageView];
    
    // 帧动画
    [self runGifForImage];
}

- (void)runGifForImage {
    UIImageView *gifImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kX, 530, 200, 150)];
    NSMutableArray *gifArray = [NSMutableArray array];
    for (NSInteger i = 1; i < 17; i++) {
        [gifArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"run－%ld", i]]];
    }
    gifImageView.animationImages = gifArray; // 动画图片数组
    gifImageView.animationDuration = 1.5; // 执行一次完整动画所需的时长
    gifImageView.animationRepeatCount = 0; // 动画重复次数，0表示无限重复
    [gifImageView startAnimating];
    [self.view addSubview:gifImageView];
}

- (NSData *)loadDataForIndex:(NSInteger)index {
    NSData *data = nil;
    if (index == 0) {
        // 网络
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://s14.sinaimg.cn/mw690/005APVsyzy6MFOsVFfv5d&690"]];
    } else {
        // 本地
        data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"run" ofType:@"gif"]];
    }
    return data;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

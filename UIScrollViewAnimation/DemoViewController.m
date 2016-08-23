//
//  DemoViewController.m
//  UIScrollViewAnimation
//
//  Created by 邵天奇 on 16/8/23.
//  Copyright © 2016年 ShaoTQ. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()<UIScrollViewDelegate>{
    
    CGFloat headerImageHeight;
    CGFloat scale;

}

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    headerImageHeight = (headerImageHeight == 0  ? self.view.frame.size.height * 0.5 : headerImageHeight);

    _scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _scrollView.delegate = self;
    _scrollView.alwaysBounceVertical = YES;
    _scrollView.backgroundColor = [UIColor clearColor];
    
    
    _image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,headerImageHeight)];
    _image.image = [UIImage imageNamed:@"WechatIMG1.jpeg"];
    _image.contentMode = UIViewContentModeScaleAspectFill;

    
    
    scale = _image.frame.size.width / _image.frame.size.height;
    
    _otherView = [[UIView alloc] initWithFrame:CGRectMake(0, headerImageHeight-[UIScreen mainScreen].bounds.size.height * 0.1, self.view.frame.size.width, self.view.frame.size.height)];
    _otherView.backgroundColor = [UIColor colorWithRed:204/255.0f green:204/255.0f blue:204/255.0f alpha:1];

    [_scrollView addSubview:_otherView];
    [self.view addSubview:_image];
    [self.view addSubview:_scrollView];


    // Do any additional setup after loading the view from its nib.
}
#pragma mark ---- UIScrollViewDelegate ----
- (void)scrollViewDidScroll:(UIScrollView *)scrollView1 {
    
    
    
    //图片上下偏移量
    CGFloat imageOffsetY = _scrollView.contentOffset.y;
    
    //上滑
    if (imageOffsetY < 0) {
        // 高度宽度同时拉伸 从中心放大
        CGFloat imgH = headerImageHeight - scrollView1.contentOffset.y * 2;
        CGFloat imgW = imgH * scale;
        _image.frame = CGRectMake(scrollView1.contentOffset.y * scale,0, imgW,imgH);
        
        
    } else {
        //只拉伸高度
        _image.frame = CGRectMake(0,0, _image.frame.size.width,(self.view.frame.size.height * 0.554)-imageOffsetY);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

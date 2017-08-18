//
//  ViewController.m
//  SLPhotoBrowser
//
//  Created by 苏磊 on 2017/8/18.
//  Copyright © 2017年 苏磊. All rights reserved.
//

#import "ViewController.h"
#import "SLBrowser.h"

@interface ViewController ()<SLBrowserDelegate>
@property(nonatomic, strong) UIView *contentView;
@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _contentView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_contentView];
    
    for (NSInteger i = 0; i < 9; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10 + 110  * (i % 3), 100 + 110 * (i /3), 100, 100)];
        imageView.userInteractionEnabled = YES;
        imageView.tag = i;
        NSString *imageName = [NSString stringWithFormat:@"pic%ld.jpg", (long)i];
        imageView.image = [UIImage imageNamed:imageName];
        [_contentView addSubview:imageView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [imageView addGestureRecognizer:tap];
    }
    
    for (id view in self.view.subviews) {
        NSLog(@"subview = %@", view);
    }
    
}

- (void)tapAction:(UIGestureRecognizer *)gesture{
    UIImageView *imageView = (UIImageView *)gesture.view;
    NSLog(@"image view = %@", imageView);
    SLBrowser *photoBrowser = [[SLBrowser alloc] init];
    photoBrowser.delegate = self;
    photoBrowser.sourceImagesContainerView = _contentView;
    photoBrowser.imageCount = 9;
    photoBrowser.currentImageIndex = imageView.tag;
    [photoBrowser show];
    NSLog(@"tap action   tag = %ld", (long)imageView.tag);
}

- (UIImage *)photoBrowser:(SLBrowser *)photoBrowser placeholderImageForIndex:(NSInteger)index{
    NSLog(@"photobrowser index = %ld", (long)index);
    UIImageView *imageView = _contentView.subviews[index];
    return imageView.image;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

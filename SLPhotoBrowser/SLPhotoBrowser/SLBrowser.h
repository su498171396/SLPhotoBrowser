//
//  SLBrowser.h
//  SLPhotoBrowser
//
//  Created by 苏磊 on 2017/8/18.
//  Copyright © 2017年 苏磊. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SLPhotoBrowser;

@protocol SLBrowserDelegate <NSObject>
- (UIImage *)photoBrowser:(SLPhotoBrowser *)photoBrowser placeholderImageForIndex:(NSInteger)index;
@end

@interface SLBrowser : UIView <UIScrollViewDelegate>

@property(nonatomic, strong) UIView *sourceImagesContainerView;
@property(nonatomic, assign) NSInteger currentImageIndex;
@property(nonatomic, assign) NSInteger imageCount;
@property(nonatomic, weak) id<SLBrowserDelegate> delegate;
- (void)show;


@end

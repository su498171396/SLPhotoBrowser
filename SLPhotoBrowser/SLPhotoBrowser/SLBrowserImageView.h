//
//  SLBrowserImageView.h
//  SLPhotoBrowser
//
//  Created by 苏磊 on 2017/8/18.
//  Copyright © 2017年 苏磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLBrowserImageView : UIImageView

@property(nonatomic, assign) BOOL isScaled;

- (void)setImageWithUrl:(NSURL *)url placeholderImage:(UIImage *)placeholder;
- (void)doubleTapToZoomWithScale:(CGFloat)scale;

@end

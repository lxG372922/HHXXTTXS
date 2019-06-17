//
//  UIImageExt.m
//  Saham
//
//  Created by apple on 2019/3/29.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UIImageExt.h"

@implementation UIImageExt

+ (UIImage *)setAvatarForNewSize:(UIImage *)image {
    CGSize origImageSize = image.size;
    
    // new image size needed, which is picked by the image picker
    CGFloat newWidth = SCREEN_Width;
    CGFloat newHeight = (newWidth * origImageSize.height) / origImageSize.width;
    CGRect newRect = CGRectMake(0, 0, newWidth, newHeight);
    
    // make sure that zoom ratio stays original value
    float ratio = MAX(newRect.size.width / origImageSize.width, newRect.size.height / origImageSize.height);
    
    // create a lucency bitmap context via current screen scaling factor
    UIGraphicsBeginImageContextWithOptions(newRect.size, NO, 0.0);
    
    // make the new image be in the center in the draw zoom
    CGRect projectRect;
    projectRect.size.width = ratio * origImageSize.width;
    projectRect.size.height = ratio * origImageSize.height;
    projectRect.origin.x = (newRect.size.width - projectRect.size.width) * 0.5;
    projectRect.origin.y = (newRect.size.height - projectRect.size.height) * 0.5;
    
    // draw the new picture in the new rect
    [image drawInRect:projectRect];
    
    // get the image we need
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // clean up image context
    UIGraphicsEndImageContext();
    
    return smallImage;
}

@end

//
//  IdentityView.h
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageExt.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
NS_ASSUME_NONNULL_BEGIN

@interface IdentityView : LXBaseView<UIImagePickerControllerDelegate, UINavigationControllerDelegate>{
    UIImagePickerController *_imagePickerController;
    
    BOOL isPN;
    
    UIImage *positiveImage,*negativeImage;
    
}


@property(nonatomic,strong)UIButton *beforeImage,*nextIamge;

@property(nonatomic,strong)UIButton *nextView;

@property(nonatomic,assign)BOOL selectR,selectE;

@end

NS_ASSUME_NONNULL_END

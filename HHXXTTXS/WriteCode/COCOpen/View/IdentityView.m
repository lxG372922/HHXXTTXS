//
//  IdentityView.m
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//



#import "IdentityView.h"

#import "OpenString.h"

@implementation IdentityView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _imagePickerController = [[UIImagePickerController alloc] init];
        _imagePickerController.delegate = self;
        //跳转动画效果
        _imagePickerController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        _imagePickerController.allowsEditing = YES;
        
        [self addSubview:self.beforeImage];
        [self addSubview:self.nextIamge];
        [self addSubview:self.nextView];
    }
    return self;
}

#pragma mark - UI布局

- (UIButton *)beforeImage{
    if (!_beforeImage) {
        
        UILabel *titleL = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_Width*0.05, Nav_topH, SCREEN_Width*0.9, SCREEN_Width*0.1)];
        titleL.textColor = RGBColor(60, 60, 60);
        titleL.font = NameFont(15);
        titleL.text = AAA;
        [self addSubview:titleL];
        
        _beforeImage = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_Width*0.15, CGRectGetMaxY(titleL.frame), SCREEN_Width*0.7, SCREEN_Width*0.4375)];
        _beforeImage.tag = 1000;
        [_beforeImage setBackgroundImage:LXGetImage(@"placeholder") forState:UIControlStateNormal];
        [_beforeImage addTarget:self action:@selector(changeHeaderImage:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *alertL = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_beforeImage.frame), SCREEN_Width, SCREEN_Width*0.1)];
        alertL.textColor = RGBColor(60, 60, 60);
        alertL.textAlignment = NSTextAlignmentCenter;
        alertL.font = NameFont(15);
        alertL.text = BBB;
        [self addSubview:alertL];
        
    }
    return _beforeImage;
}

- (UIButton *)nextIamge{
    if (!_nextIamge) {
        _nextIamge = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_Width*0.15, CGRectGetMaxY(_beforeImage.frame)+SCREEN_Width*0.1, SCREEN_Width*0.7, SCREEN_Width*0.4375)];
        _nextIamge.tag = 2000;
        [_nextIamge setBackgroundImage:LXGetImage(@"placeholder") forState:UIControlStateNormal];
        [_nextIamge addTarget:self action:@selector(changeHeaderImage:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *alertL = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_nextIamge.frame), SCREEN_Width, SCREEN_Width*0.1)];
        alertL.textColor = RGBColor(60, 60, 60);
        alertL.textAlignment = NSTextAlignmentCenter;
        alertL.font = NameFont(15);
        alertL.text = CCC;
        [self addSubview:alertL];
    }
    return _nextIamge;
}

#pragma mark - 相机相册调用

-(void)changeHeaderImage:(UIButton *)sendB{
    
    switch (sendB.tag) {
            
            case 1000: isPN = YES;//正面
            break;
            
            case 2000: isPN = NO;//反面
            break;
            
        default:
            break;
    }
    
    UIAlertController *alertCtl =[[UIAlertController alloc]init];
    
    UIAlertAction *cancel =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *xiangji =[UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self openCamera];
    }];
    UIAlertAction *xiangce =[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self openPhotoLibrary];
    }];
    
    [alertCtl addAction:cancel];
    [alertCtl addAction:xiangji];
    [alertCtl addAction:xiangce];
    
    [[super viewController] presentViewController:alertCtl animated:YES completion:nil];
}

/**
 *  调用照相机
 */
- (void)openCamera
{
    
    //判断是否可以打开照相机
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        //摄像头
        _imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        [[super viewController] presentViewController:_imagePickerController animated:YES completion:nil];
    }
    else{
        NSLog(@"没有摄像头");
    }
}



/**
 *  打开相册
 */
-(void)openPhotoLibrary{
    
    // 进入相册
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [[super viewController] presentViewController:_imagePickerController animated:YES completion:^{
            NSLog(@"打开相册");
        }];
    }else{
        NSLog(@"不能打开相册");
    }
}


#pragma mark - UIImagePickerControllerDelegate
// 拍照完成回调
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0){
    
    if(picker.sourceType == UIImagePickerControllerSourceTypeCamera){
        //图片存入相册
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    
    if(isPN){
        
        positiveImage = image;
        
    }else{
        
        negativeImage = image;
        
    }
    
    [self RedrawPicture];
    
    [[super viewController] dismissViewControllerAnimated:YES completion:nil];
}

//进入拍摄页面点击取消按钮
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [[super viewController] dismissViewControllerAnimated:YES completion:nil];
}


//选择照片的回调
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *ima = info[UIImagePickerControllerEditedImage];
    
    //用的是UIImageExt 这个工具类
    ima = [UIImageExt setAvatarForNewSize:ima];
    
    
    
    [[super viewController] dismissViewControllerAnimated:YES completion:^{
        
        if(self->isPN){
            
            self->positiveImage = ima;
            
        }else{
            
            self->negativeImage = ima;
            
        }
        
        WS(weakSelf);
        
        [weakSelf RedrawPicture];
        
        NSLog(@"选择完成");
    }];
    
}

#pragma mark - 图片选择重绘
-(void)RedrawPicture{
    
    if (positiveImage != nil) {
        [self.beforeImage setBackgroundImage:positiveImage forState:UIControlStateNormal];
        _selectR = YES;
    }
    
    if (negativeImage != nil) {
        [self.nextIamge setBackgroundImage:negativeImage forState:UIControlStateNormal];
        _selectE = YES;
    }
    
}

#pragma mark - 下一步选择
- (UIButton *)nextView{
    if (!_nextView) {
        _nextView = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_Width*0.08, CGRectGetMaxY(_nextIamge.frame)+SCREEN_Width*0.2, SCREEN_Width*0.84, SCREEN_Width*0.1)];
        LXViewRadius(_nextView, 5);
        _nextView.backgroundColor = RGBColor(50, 50, 50);
        [_nextView setTitle:@"下一步" forState:UIControlStateNormal];
    }
    return _nextView;
}

@end


//
//  COCOpenHeader.h
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#ifndef COCOpenHeader_h
#define COCOpenHeader_h

//文字尺寸设置
#define FONT_SIZE(f) [UIFont systemFontOfSize:(f)]//不加粗
#define FONT_B_SIZE(f) [UIFont boldSystemFontOfSize:(f)]//加粗
#define NameFont(x) [UIFont fontWithName:@"PingFangSC-Light" size:x]//苹方细体
#define NameBFont(x) [UIFont fontWithName:@"PingFangSC-Regular" size:x]//苹方体
#define NumFont(x) [UIFont fontWithName:@"Helvetica Neue" size:x]//数字字体
#define Customize(name,x) [UIFont fontWithName:name size:x]//自定义字体

//判断数据是否为空
#define LXStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
#define LXArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
#define LXDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)

//加载图片
#define LXGetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

// View 圆角
#define LXViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

// View 边框
#define LXViewBord(View, Color, Width)\
\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:(Color).CGColor]

// View 阴影
#define LXViewShadow(view,color,size,alpha,radius)\
\
view.layer.shadowColor = color.CGColor;\
view.layer.shadowOffset = size;\
view.layer.shadowOpacity = alpha;\
view.layer.shadowRadius = radius


//弱引用self（用于block块中）
#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;

//推迟执行
CG_INLINE void PETime(CGFloat time ,dispatch_block_t block) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), block);
}

#define userSave(vunle,key) [[NSUserDefaults standardUserDefaults]setObject:vunle forKey:key]
#define userGet(key) [[NSUserDefaults standardUserDefaults]objectForKey:key]

#endif /* COCOpenHeader_h */

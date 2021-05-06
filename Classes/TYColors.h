//
//  TYColors.h
//
//
//  Created by taoye on 31/03/2017.
//  Copyright © 2017 bilibili. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TYBackgroundColor HEXCOLOR(0xffffff)

#undef HEXCOLOR
#undef HEXACOLOR
#undef RGBCOLOR
#undef RGBACOLOR

#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define HEXACOLOR(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

#define RGBCOLOR(r, g, b)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]



#if defined(__cplusplus)
#define TYCOLOR_EXTERN extern "C"
#else
#define TYCOLOR_EXTERN extern
#endif
/**
 将十六进制字符串转成UIColor

 @param hexStr 十六进制字符串，eg:0xFFFFFF
 @return 返回UIColor对象
 */
TYCOLOR_EXTERN UIColor *colorWithHexString(NSString *hexStr);


/**
 将UIColor对象转成十六进制字符串

 @param color UIColor实例对象
 @return 返回十六进制字符串
 */
TYCOLOR_EXTERN NSString *hexStringFromColor(UIColor *color);

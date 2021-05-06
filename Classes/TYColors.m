//
//  BFCColors.m
//  BFCRuler
//
//  Created by Mars Ding on 2017/12/1.
//  Copyright © 2017年 bilibili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TYColors.h"

static inline NSUInteger hexStrToInt(NSString *str) {
    uint32_t result = 0;
    sscanf([str UTF8String], "%X", &result);
    return result;
}

static BOOL hexStrToRGBA(NSString *str, CGFloat *r, CGFloat *g, CGFloat *b, CGFloat *a) {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    str = [[str stringByTrimmingCharactersInSet:set] uppercaseString];
    
    if ([str hasPrefix:@"#"]) {
        str = [str substringFromIndex:1];
    } else if ([str hasPrefix:@"0X"]) {
        str = [str substringFromIndex:2];
    }
    
    NSUInteger length = [str length];
    //         RGB            RGBA          RRGGBB        RRGGBBAA
    if (length != 3 && length != 4 && length != 6 && length != 8) {
        return NO;
    }
    
    //RGB,RGBA,RRGGBB,RRGGBBAA
    if (length < 5) {
        *r = hexStrToInt([str substringWithRange:NSMakeRange(0, 1)]) / 255.0f;
        *g = hexStrToInt([str substringWithRange:NSMakeRange(1, 1)]) / 255.0f;
        *b = hexStrToInt([str substringWithRange:NSMakeRange(2, 1)]) / 255.0f;
        if (length == 4)  *a = hexStrToInt([str substringWithRange:NSMakeRange(3, 1)]) / 255.0f;
        else *a = 1;
    } else {
        *r = hexStrToInt([str substringWithRange:NSMakeRange(0, 2)]) / 255.0f;
        *g = hexStrToInt([str substringWithRange:NSMakeRange(2, 2)]) / 255.0f;
        *b = hexStrToInt([str substringWithRange:NSMakeRange(4, 2)]) / 255.0f;
        if (length == 8) *a = hexStrToInt([str substringWithRange:NSMakeRange(6, 2)]) / 255.0f;
        else *a = 1;
    }
    return YES;
}

UIColor *colorWithHexString(NSString *hexStr)
{
    CGFloat r, g, b, a;
    if (hexStrToRGBA(hexStr, &r, &g, &b, &a)) {
        return [UIColor colorWithRed:r green:g blue:b alpha:a];
    }
    return nil;
}

NSString *hexStringFromColor(UIColor *color)
{
    if (!color) return @"";
    
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    
    CGFloat r = 0, g = 0, b = 0;
    size_t len = CGColorGetNumberOfComponents(color.CGColor);
    if (len > 0) {
        r = components[0];
    }
    if (len > 1) {
        g = components[1];
    }
    if (len > 2) {
        b = components[2];
    }
    
    NSString *temp = [NSString stringWithFormat:@"#%02lX%02lX%02lX",
                      lroundf(r * 255.f),
                      lroundf(g * 255.f),
                      lroundf(b * 255.f)];
    return temp;
}

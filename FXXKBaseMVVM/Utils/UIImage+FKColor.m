//
//  UIImage+FKColor.m
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/10.
//  Copyright © 2017年 madao. All rights reserved.
//

#import "UIImage+FKColor.h"

@implementation UIImage (FKColor)

+ (UIImage*) imageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end

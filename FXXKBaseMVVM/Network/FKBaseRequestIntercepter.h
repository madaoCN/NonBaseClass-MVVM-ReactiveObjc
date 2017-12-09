//
//  FKBaseRequestIntercepter.h
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/9.
//  Copyright © 2017年 madao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FKBaseRequest.h"

@interface FKBaseRequestIntercepter : NSObject

- (void)hookRequestArgumentWithInstance:(FKBaseRequest *)request FKDeprecated("Do not use any more");

@end

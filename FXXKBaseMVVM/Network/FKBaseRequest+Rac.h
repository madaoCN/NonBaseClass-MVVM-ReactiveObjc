//
//  FKBaseRequest+Rac.h
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/9.
//  Copyright © 2017年 madao. All rights reserved.
//

#import "FKBaseRequest.h"

@interface FKBaseRequest (Rac)

- (RACSignal *)rac_requestSignal;

@end

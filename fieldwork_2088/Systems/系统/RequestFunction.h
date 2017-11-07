//
//  RequestFunction.h
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/5/26.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface RequestFunction : NSObject

+ (void)requestPostWithUrl:(NSString *)url target:(id)aTarget selector:(SEL)selector parameter:(NSDictionary *)parameter; // POST

+ (void)requestGetWithUrl:(NSString *)url target:(id)aTarget selector:(SEL)aSelector;  // GET


@end

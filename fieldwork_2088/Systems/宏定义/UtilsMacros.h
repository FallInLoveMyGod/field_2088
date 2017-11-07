//
//  UtilsMacros.h
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/5/26.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#ifndef UtilsMacros_h
#define UtilsMacros_h


#endif /* UtilsMacros_h */

#ifdef DEBUG
#define ALog(...) NSLog(__VA_ARGS__)
#else
#define ALog(...) NSLog(...)
#endif

typedef void (^BtnBlock)();
typedef void (^TagBtnBlock)(NSInteger tag);


#pragma mark ------------------ 颜色 -------------------

#define HexColor(ColorString,Alpha) [UIColor colorWithHexString:ColorString alpha:Alpha]
#define RGB(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

#define Color_Random RGB([ConfigFunction getRandomNumber:100 to:255],[ConfigFunction getRandomNumber:100 to:255],[ConfigFunction getRandomNumber:100 to:255],1.0) // 获取随机色

#define Color_UI_Background HexColor(@"#F7F8F7",1.0)    // UI背景颜色（灰色）
#define Color_Border_Gray HexColor(@"#999999",1.0)          // 边框颜色
#define Color_Button_Background HexColor(@"#5EB640",1.0)    // 按钮底色
#define Color_Shadow  RGB(236,236,236,0.5)               // card 阴影
#define Color_Line HexColor(@"#EEEEEE",1.0)              //  line 颜色
#define Color_Alart_Background HexColor(@"#000000",0.34)  // 弹窗底色

#define Color_Text_Green  HexColor(@"#69B248",1.0)          // 绿色字体
#define Color_Text_Gray HexColor(@"#CCCCCC",1.0)            // 灰色字体
#define Color_Text_Gray6 HexColor(@"#666666",1.0)
#define Color_Text_Gray9 HexColor(@"#999999",1.0)
#define Color_Text_Black HexColor(@"#333333",1.0)           // 黑色字体
#define Color_Text_Time HexColor(@"#3C4D5E",1.0)

#pragma mark ------------------ Font --------------------

#define Font_24 [UIFont systemFontOfSize:24]
#define Font_20 [UIFont systemFontOfSize:20]
#define Font_18 [UIFont systemFontOfSize:18]
#define Font_16 [UIFont systemFontOfSize:16]
#define Font_14 [UIFont systemFontOfSize:14]
#define Font_12 [UIFont systemFontOfSize:12]
#define Font_10 [UIFont systemFontOfSize:10]

#define Font_Medium_24 [UIFont fontWithName:@".PingFangSC-Medium" size:24]
#define Font_Medium_20 [UIFont fontWithName:@".PingFangSC-Medium" size:20]
#define Font_Medium_18 [UIFont fontWithName:@".PingFangSC-Medium" size:18]
#define Font_Medium_16 [UIFont fontWithName:@".PingFangSC-Medium" size:16]
#define Font_Medium_14 [UIFont fontWithName:@".PingFangSC-Medium" size:14]
#define Font_Medium_12 [UIFont fontWithName:@".PingFangSC-Medium" size:12]
#define Font_Medium_10 [UIFont fontWithName:@".PingFangSC-Medium" size:10]

#define Font_Avenir_24 [UIFont fontWithName:@"Avenir-Book" size:24]
#define Font_SFNSText_18 [UIFont fontWithName:@".SFNSText" size:18]
#define Font_SFNSText_16 [UIFont fontWithName:@".SFNSText" size:16]
#define Font_SFNSText_14 [UIFont fontWithName:@".SFNSText" size:14]




//
//  MessageCell.h
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/15.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageCell : UITableViewCell

@property (nonatomic,strong)UILabel *titleLab;

@property (nonatomic,strong)UILabel *contentLab;

@property (nonatomic,strong)UILabel *timeLab;  //  系统消息加

@end

//
//  HistoryCell.h
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/6/2.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryCell : UITableViewCell

@property (nonatomic,strong)UILabel *workInTimeLab;

@property (nonatomic,strong)UILabel *workOutTimeLab;

@property (nonatomic,strong)UILabel *dateLab;

@property (nonatomic,copy)BtnBlock block;

@end

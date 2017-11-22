//
//  TDGAVirtualCurrencyTableViewCell.m
//  TalkingDataSDKDemo
//
//  Created by liweiqiang on 2017/5/22.
//  Copyright © 2017年 TendCloud. All rights reserved.
//

#import "TDGAVirtualCurrencyTableViewCell.h"
#import "TalkingDataGA.h"

@interface TDGAVirtualCurrencyTableViewCell ()

@property (weak, nonatomic) IBOutlet UITextField *orderIDField;
@property (weak, nonatomic) IBOutlet UITextField *iapIDField;
@property (weak, nonatomic) IBOutlet UITextField *currencyAmountField;
@property (weak, nonatomic) IBOutlet UITextField *currencyTypeField;
@property (weak, nonatomic) IBOutlet UITextField *virtualCurrencyAmountField;
@property (weak, nonatomic) IBOutlet UITextField *paymentTypeField;
@property (weak, nonatomic) IBOutlet UITextField *rewardVirtualCurrencyAmountField;
@property (weak, nonatomic) IBOutlet UITextField *rewardReasonField;

@end

@implementation TDGAVirtualCurrencyTableViewCell

- (IBAction)chargeRequst {
    [TDGAVirtualCurrency onChargeRequst:self.orderIDField.text
                                  iapId:self.iapIDField.text
                         currencyAmount:[self.currencyAmountField.text doubleValue]
                           currencyType:self.currencyTypeField.text
                  virtualCurrencyAmount:[self.virtualCurrencyAmountField.text doubleValue]
                            paymentType:self.paymentTypeField.text];
}

- (IBAction)chargeSuccess {
    [TDGAVirtualCurrency onChargeSuccess:self.orderIDField.text];
}

- (IBAction)rewardVirtualCurrency {
    [TDGAVirtualCurrency onReward:[self.rewardVirtualCurrencyAmountField.text doubleValue]
                           reason:self.rewardReasonField.text];
}

@end

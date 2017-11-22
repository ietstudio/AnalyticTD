//
//  TDGAItemTableViewCell.m
//  TalkingDataSDKDemo
//
//  Created by liweiqiang on 2017/5/22.
//  Copyright © 2017年 TendCloud. All rights reserved.
//

#import "TDGAItemTableViewCell.h"
#import "TalkingDataGA.h"

@interface TDGAItemTableViewCell ()

@property (weak, nonatomic) IBOutlet UITextField *itemIDField;
@property (weak, nonatomic) IBOutlet UITextField *itemNumberField;
@property (weak, nonatomic) IBOutlet UITextField *itemPriceField;

@end

@implementation TDGAItemTableViewCell

- (IBAction)purchaseItem {
    [TDGAItem onPurchase:self.itemIDField.text
              itemNumber:[self.itemNumberField.text intValue]
  priceInVirtualCurrency:[self.itemPriceField.text doubleValue]];
}

- (IBAction)useItem {
    [TDGAItem onUse:self.itemIDField.text
         itemNumber:[self.itemNumberField.text intValue]];
}

@end

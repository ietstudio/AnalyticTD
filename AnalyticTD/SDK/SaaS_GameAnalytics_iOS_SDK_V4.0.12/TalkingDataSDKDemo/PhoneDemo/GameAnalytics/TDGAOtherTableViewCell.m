//
//  TDGAOtherTableViewCell.m
//  TalkingDataSDKDemo
//
//  Created by liweiqiang on 2017/5/22.
//  Copyright © 2017年 TendCloud. All rights reserved.
//

#import "TDGAOtherTableViewCell.h"
#import "TalkingDataGA.h"

@interface TDGAOtherTableViewCell ()

@property (weak, nonatomic) IBOutlet UITextField *latitudeField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeField;

@end

@implementation TDGAOtherTableViewCell

- (IBAction)setLocation {
    [TalkingDataGA setLatitude:[self.latitudeField.text doubleValue]
                     longitude:[self.longitudeField.text doubleValue]];
}

@end

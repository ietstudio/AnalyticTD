//
//  TDGAMissionTableViewCell.m
//  TalkingDataSDKDemo
//
//  Created by liweiqiang on 2017/5/22.
//  Copyright © 2017年 TendCloud. All rights reserved.
//

#import "TDGAMissionTableViewCell.h"
#import "TalkingDataGA.h"

@interface TDGAMissionTableViewCell ()

@property (weak, nonatomic) IBOutlet UITextField *missionIDField;
@property (weak, nonatomic) IBOutlet UITextField *failedCauseField;

@end

@implementation TDGAMissionTableViewCell

- (IBAction)missionBegin {
    [TDGAMission onBegin:self.missionIDField.text];
}

- (IBAction)missionCompleted {
    [TDGAMission onCompleted:self.missionIDField.text];
}

- (IBAction)missionFailed {
    [TDGAMission onFailed:self.missionIDField.text
              failedCause:self.failedCauseField.text];
}

@end

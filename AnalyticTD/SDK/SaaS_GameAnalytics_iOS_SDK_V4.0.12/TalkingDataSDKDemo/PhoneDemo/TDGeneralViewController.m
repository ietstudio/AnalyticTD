//
//  TDGeneralViewController.m
//  TalkingDataSDKDemo
//
//  Created by liweiqiang on 2017/5/22.
//  Copyright © 2017年 TendCloud. All rights reserved.
//

#import "TDGeneralViewController.h"

@interface TDGeneralViewController ()

@property (weak, nonatomic) IBOutlet UILabel *subject;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UITextView *detail;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UIButton *customize;

@end

@implementation TDGeneralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.subject.text = [NSString stringWithFormat:@"　%@", _info[@"title"]];
    self.icon.image = [UIImage imageNamed:_info[@"name"]];
    self.detail.text = _info[@"detail"];
    BOOL selected = [_info[@"selected"] boolValue];
    if (selected) {
        self.status.text = @"当前SDK已选择此功能";
        self.status.textColor = [UIColor greenColor];
    } else {
        self.status.text = @"当前SDK未选择此功能";
        self.status.textColor = [UIColor redColor];
    }
    self.customize.hidden = selected;
}
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(nullable id)sender{
    CGFloat sysVersion = [UIDevice currentDevice].systemVersion.floatValue;
    UIStoryboard * mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    if ([identifier isEqualToString:@"segueAppAnalytics"] && sysVersion<=8.0) {
        UIViewController * appVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"aavc"];
        [self.navigationController pushViewController:appVC animated:YES];
        return NO;
    }else if([identifier isEqualToString:@"segueAppNewPage1"] && sysVersion<=8.0) {
        UIViewController * AAnewPage1 = [mainStoryBoard instantiateViewControllerWithIdentifier:@"AANewPage1"];
        [self.navigationController pushViewController:AAnewPage1 animated:YES];
        return NO;
    }else if([identifier isEqualToString:@"segueAppNewPage2"] && sysVersion<=8.0) {
        UIViewController * AAnewPage2 = [mainStoryBoard instantiateViewControllerWithIdentifier:@"AANewPage2"];
        [self.navigationController pushViewController:AAnewPage2 animated:YES];
        return NO;
    }else if([identifier isEqualToString:@"segueGameAnalytics"] && sysVersion<=8.0) {
        UIViewController * GAVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"gavc"];
        [self.navigationController pushViewController:GAVC animated:YES];
        return NO;
    }else if([identifier isEqualToString:@"segueAdTracking"] && sysVersion<=8.0) {
        UIViewController * ADTVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"adtvc"];
        [self.navigationController pushViewController:ADTVC animated:YES];
        return NO;
    }else if([identifier isEqualToString:@"segueBrandGrowShow"] && sysVersion<=8.0) {
        UIViewController * bgsvc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"bgsvc"];
        [self.navigationController pushViewController:bgsvc animated:YES];
        return NO;
    }else if([identifier isEqualToString:@"segueBrandGrowClick"] && sysVersion<=8.0) {
        UIViewController * bgcvc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"bgcvc"];
        [self.navigationController pushViewController:bgcvc animated:YES];
        return NO;
    }else if([identifier isEqualToString:@"segueBrandGrowClickAD"] && sysVersion<=8.0) {
        UIViewController * bgdisplayvc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"bgdisplayvc"];
        [self.navigationController pushViewController:bgdisplayvc animated:YES];
        return NO;
    }



    
    return YES;
}
- (IBAction)reapply:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://doc.talkingdata.com"]];
}

@end

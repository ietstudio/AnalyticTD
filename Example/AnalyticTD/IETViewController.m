//
//  IETViewController.m
//  AnalyticTD
//
//  Created by gaoyang on 08/26/2015.
//  Copyright (c) 2015 gaoyang. All rights reserved.
//

#import "IETViewController.h"
#import "TDAnalyticHelper.h"

@interface IETViewController ()

@end

@implementation IETViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setAccountInfo:(id)sender {
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setObject:@"0000001" forKey:@"userId"];
    [dict setObject:@"male" forKey:@"gender"];
    [dict setObject:@"15" forKey:@"age"];
    [[TDAnalyticHelper getInstance] setAccoutInfo:dict];
}
- (IBAction)onEvent1:(id)sender {
    [[TDAnalyticHelper getInstance] onEvent:@"dead"];
}
- (IBAction)onEvent2:(id)sender {
    [[TDAnalyticHelper getInstance] onEvent:@"dead" Label:@"10"];
}
- (IBAction)setLevel:(id)sender {
    [[TDAnalyticHelper getInstance] setLevel:10];
}
- (IBAction)charge:(id)sender {
    [[TDAnalyticHelper getInstance] charge:@"coin1" :10 :100 :1000];
}
- (IBAction)reward:(id)sender {
    [[TDAnalyticHelper getInstance] reward:100 :1000];
}
- (IBAction)purchase:(id)sender {
    [[TDAnalyticHelper getInstance] purchase:@"helmet" :1 :10];
}
- (IBAction)use:(id)sender {
    [[TDAnalyticHelper getInstance] use:@"helmet" :1 :10];
}

@end

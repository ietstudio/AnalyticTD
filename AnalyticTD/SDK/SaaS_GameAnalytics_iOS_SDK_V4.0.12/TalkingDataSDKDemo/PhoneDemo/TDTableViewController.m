//
//  TDTableViewController.m
//  TalkingDataSDKDemo
//
//  Created by liweiqiang on 2017/8/1.
//  Copyright © 2017年 TendCloud. All rights reserved.
//

#import "TDTableViewController.h"

@interface TDTableViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *items;
@property (nonatomic) NSInteger showIndex;

@end

@implementation TDTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self.navigationItem.title hasPrefix:@"Game Analytics"]) {
        self.items = @[
            @{@"id":@"Account",@"height":@274,@"title":@"账户接口"},
            @{@"id":@"Mission",@"height":@84,@"title":@"任务接口"},
            @{@"id":@"VirtualCurrency",@"height":@388,@"title":@"充值接口"},
            @{@"id":@"Item",@"height":@160,@"title":@"虚拟币消耗"},
            @{@"id":@"Other",@"height":@46,@"title":@"设置经纬度"},
        ];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.items.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_showIndex == section) {
        return 1;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = [NSString stringWithFormat:@"%@Cell", [[self.items objectAtIndex:indexPath.section] objectForKey:@"id"]];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[[self.items objectAtIndex:indexPath.section] objectForKey:@"height"] floatValue];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    button.tag = section;
    [button addTarget:self action:@selector(changeSection:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor colorWithWhite:242.0/255.0 alpha:1.0]];
    [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 16, 0, 0)];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    NSString *title = [[self.items objectAtIndex:section] objectForKey:@"title"];
    [button setTitle:title forState:UIControlStateNormal];
    
    return button;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if ([UIDevice currentDevice].systemVersion.floatValue<8.0f) {
        return nil;
    }
    return [[UIView alloc] init];
}

#pragma mark - Button event

- (void)changeSection:(UIButton *)sender {
    if (_showIndex == -1) {
        _showIndex = sender.tag;
        if ([UIDevice currentDevice].systemVersion.floatValue<8.0f) {
            [self.tableView reloadData];
            return;
        }
        NSIndexSet *set = [NSIndexSet indexSetWithIndex:_showIndex];
        [self.tableView reloadSections:set withRowAnimation:UITableViewRowAnimationFade];
    } else if (_showIndex == sender.tag) {
        _showIndex = -1;
        if ([UIDevice currentDevice].systemVersion.floatValue<8.0f) {
            [self.tableView reloadData];
            return;
        }
        NSIndexSet *set = [NSIndexSet indexSetWithIndex:sender.tag];
        [self.tableView reloadSections:set withRowAnimation:UITableViewRowAnimationFade];
    } else {
        if ([UIDevice currentDevice].systemVersion.floatValue<8.0f) {
            _showIndex = sender.tag;
            [self.tableView reloadData];
            return;
        }
        NSIndexSet *set1 = [NSIndexSet indexSetWithIndex:_showIndex];
        _showIndex = -1;
        [self.tableView reloadSections:set1 withRowAnimation:UITableViewRowAnimationFade];
        _showIndex = sender.tag;
        NSIndexSet *set2 = [NSIndexSet indexSetWithIndex:_showIndex];
        [self.tableView reloadSections:set2 withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end

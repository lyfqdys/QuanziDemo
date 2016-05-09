//
//  QuanziCreatGroupViewController.m
//  quanzi
//
//  Created by 舒婷 on 16/5/9.
//  Copyright © 2016年 舒婷. All rights reserved.
//

#import "QuanziCreatGroupViewController.h"
#import "QuanziCreatGroupTableViewCell.h"
#import "QuanziGroupDetailViewController.h"
static const CGFloat kCellHeight = 55;
@interface QuanziCreatGroupViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSMutableArray *datasource;

@end

@implementation QuanziCreatGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datasource = [[NSMutableArray alloc]initWithObjects:@{@"title":@"shsh1",@"content":@"shgdgdhdg1"},
                                                             @{@"title":@"shsh2",@"content":@"shgdgdhdg2"},
                                                             @{@"title":@"shsh3",@"content":@"shgdgdhdg3"},
                                                             @{@"title":@"shsh4",@"content":@"shgdgdhdg4"},nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark datasource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return kCellHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor redColor];
    return view;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuanziCreatGroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuanziCreatGroupTableViewCell"];
    if (!cell) {
        cell = (QuanziCreatGroupTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"QuanziCreatGroupTableViewCell" owner:self options:nil] lastObject];
    }
    NSDictionary *dic = self.datasource[indexPath.row];
    cell.titleLabel.text = dic[@"title"];
    cell.contentLabel.text = dic[@"content"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    QuanziGroupDetailViewController *vc = [[QuanziGroupDetailViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end

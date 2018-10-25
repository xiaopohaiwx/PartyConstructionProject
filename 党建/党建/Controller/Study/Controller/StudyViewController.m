//
//  StudyViewController.m
//  党建
//
//  Created by apple on 2018/10/25.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "StudyViewController.h"
#import "StudyTableViewCell.h"

@interface StudyViewController ()

@property(nonatomic , strong) UITableView * tabView;

@end

@implementation StudyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
}

- (UITableView *)tabView
{
    if(!_tabView)
    {
        _tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStylePlain];
        _tabView.dataSource = self;
        _tabView.delegate = self;
        [_tabView registerClass:[StudyTableViewCell class] forCellReuseIdentifier:@"studyCell"];
        [self.view addSubview:_tabView];
    }
    return _tabView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

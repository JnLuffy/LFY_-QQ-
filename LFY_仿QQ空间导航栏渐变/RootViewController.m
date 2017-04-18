//
//  RootViewController.m
//  LFY_仿QQ空间导航栏渐变
//
//  Created by apple on 17/4/17.
//  Copyright © 2017年 com.cooper.dtag. All rights reserved.
//

#import "RootViewController.h"
#import "PushViewController.h"

#define KscreenH [[UIScreen mainScreen] bounds].size.height
#define KscreenW [[UIScreen mainScreen] bounds].size.width

@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(strong,nonatomic)UIImageView* barImageView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -64, KscreenW, KscreenH) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier2"];
    self.tableView.rowHeight = 50;
    [self.view addSubview:_tableView];
    self.title = @"是是是";
    
    self.barImageView = self.navigationController.navigationBar.subviews.firstObject;
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tableView.delegate = self;
    _barImageView.alpha = 0 ;
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tableView.delegate = nil;//为了防止页面push时，导航栏的背景还发生改变
    _barImageView.alpha = 1 ;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier2" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"title%lu",indexPath.section];
    if(indexPath.row <= 2){
        cell.textLabel.backgroundColor = [UIColor greenColor];
        cell.textLabel.text = @"渐变导航栏";
        
    }else{
        cell.textLabel.backgroundColor = [UIColor whiteColor];
    }
    
    return cell;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"y = %f",scrollView.contentOffset.y);
    
    CGFloat offsetY = scrollView.contentOffset.y;
    if(offsetY <= 85){
        CGFloat alpha = MIN(1,(offsetY)/150 ); 
        _barImageView.alpha = alpha;
    }else{
        _barImageView.alpha = 1;
    }
    
    NSLog(@"alpha = %f",_barImageView.alpha);
    
    
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"scrollViewDidEndDragging = %f",scrollView.contentOffset.y);
    
    CGFloat offsetY = scrollView.contentOffset.y;
    if(offsetY <= 85){
        [UIView animateWithDuration:0.5 animations:^{
            _barImageView.alpha = 0;
            
        }];
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            _barImageView.alpha = 1;
            
        }];
        
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidEndDecelerating = %f",scrollView.contentOffset.y);
    CGFloat offsetY = scrollView.contentOffset.y;
    if(offsetY <= 85){
        [UIView animateWithDuration:0.5 animations:^{
            _barImageView.alpha = 0;
        }];
        
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            _barImageView.alpha = 1;
            
        }];
    }
    
    
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[PushViewController new] animated:YES];
}



@end

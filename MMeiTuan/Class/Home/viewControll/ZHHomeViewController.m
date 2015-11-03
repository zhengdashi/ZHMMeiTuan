//
//  ZHHomeViewController.m
//  MMeiTuan
//
//  Created by Zheng on 15/10/30.
//  Copyright © 2015年 zhr. All rights reserved.
//

#import "ZHHomeViewController.h"
#import "TitHomeTableViewCell.h"
#import "ZHBrandCell.h"
#import "OneSnapUpCell.h"
#import "FourSqualCell.h"
#import "GuessLikeCell.h"
#import "ZHScanViewController.h"

@interface ZHHomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *homeTableView;

@end

@implementation ZHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - table delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return 180;
    }else if (indexPath.row==1){
        return 128;
    }else if (indexPath.row==2){
        return 60;
    }else if (indexPath.row==3){
        return 120;
    }else if (indexPath.row==4){
        return 30;
    }else{
        return 100;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        TitHomeTableViewCell  * homeCell = [tableView dequeueReusableCellWithIdentifier:@"homeCell"];
        if (!homeCell) {
            homeCell = [[TitHomeTableViewCell  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"homeCell"];
            homeCell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return homeCell;
    }else if (indexPath.row ==1){
        ZHBrandCell   * brandCell = [tableView dequeueReusableCellWithIdentifier:@"ZHBrandCell"];
        if (!brandCell) {
            brandCell = [[ZHBrandCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ZHBrandCell"];
        }
        brandCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return brandCell;
    }else if (indexPath.row==2){
        OneSnapUpCell  * snapCell = [tableView dequeueReusableCellWithIdentifier:@"OneSnapUpCell"];
        if (!snapCell) {
            snapCell = [[OneSnapUpCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"OneSnapUpCell"];
        }
        return snapCell;
    }else if (indexPath.row ==3){
        FourSqualCell  * fourCell = [tableView dequeueReusableCellWithIdentifier:@"FourSqualCell"];
        if (!fourCell) {
            fourCell = [[FourSqualCell  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FourSqualCell"];
        }
        return fourCell;
    }else if (indexPath.row==4){
        UITableViewCell  * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.textLabel.text = @"猜你喜欢";
        return cell;
    }else{
        GuessLikeCell  * guessCell = [tableView dequeueReusableCellWithIdentifier:@"GuessLikeCell"];
        if (!guessCell) {
            guessCell = [[GuessLikeCell  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"GuessLikeCell"];
        }
        return guessCell;
    }
}
- (IBAction)scanButClick:(id)sender {
    ZHScanViewController  * scanView = [[ZHScanViewController alloc]init];
    [self presentViewController:scanView animated:YES completion:nil];
}

@end























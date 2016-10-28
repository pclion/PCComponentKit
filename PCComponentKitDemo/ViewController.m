//
//  ViewController.m
//  PCComponentKitDemo
//
//  Created by peichuang on 16/9/30.
//  Copyright © 2016年 peichuang. All rights reserved.
//

#import "ViewController.h"
#import "PCTableViewLayout.h"
#import "PCCategoryCell.h"
#import "NSArray+CellInfoTransfer.h"

#import "PCCategoryViewController.h"
#import "PCCollectionViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) PCTableViewLayout *layout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    __weak ViewController *wSelf = self;
    
    self.layout = [[PCTableViewLayout alloc] initWithTableView:self.tableView];
    //[self.layout registerCellClassName:NSStringFromClass([LSTCategoryCell class])];
    
    NSArray *itemArray = @[@"tableview",@"collectionview",@"customview",@"component",@"segementview",@"animation",@"datasource",@"navigationcontroller",@"basecontroller"];
    NSArray *dataArray = [@[itemArray] enumerateObjectsToSectionInfoUsingBlock:^(NSArray *obj, NSInteger idx, PCSectionInfo *sectionInfo) {
        NSArray *cellInfoArray = [obj enumerateObjectsToCellInfoUsingBlock:^(NSString *obj, NSInteger idx, PCCellInfo *cellInfo) {
            cellInfo.json = @{@"title": obj, @"testarr": @[@{@"a": @"12"}, @{@"b": @"5"}, @{@"c": @"78"}], @"testdict": @{@"innerdict": @{@"abc": @"dgdgg", @"ccc": @"ggfgdd"}}};
            cellInfo.cellClassName = NSStringFromClass([PCCategoryCell class]);
            cellInfo.itemSize = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds), 60);
        }];
        sectionInfo.cellInfoArray = cellInfoArray;
    }];
    self.layout.dataArray = dataArray;
    self.layout.cellConfigure = ^(UIView *cell, NSIndexPath *indexpath, PCCellInfo *cellInfo) {
        if ([cell isKindOfClass:[PCCategoryCell class]]) {
            PCCategoryCell * categoryCell = (PCCategoryCell *)cell;
            categoryCell.titleLabel.text = cellInfo.json[@"title"];
            [cellInfo setValue:@"aaa" forKey:@"testarr->0"];
            NSLog(@"%@", [cellInfo valueForKey:@"testarr->0"]);
        }
    };
    self.layout.didSelected = ^(NSIndexPath *indexpath, PCCellInfo *cellInfo) {
        [wSelf.layout.tableView deselectRowAtIndexPath:indexpath animated:YES];
        if ([cellInfo.json[@"title"] isEqualToString:@"tableview"]) {
            UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UIViewController *controller = [board instantiateViewControllerWithIdentifier:NSStringFromClass([PCCategoryViewController class])];
            [wSelf.navigationController pushViewController:controller animated:YES];
        } else if ([cellInfo.json[@"title"] isEqualToString:@"collectionview"]) {
            UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UIViewController *controller = [board instantiateViewControllerWithIdentifier:NSStringFromClass([PCCollectionViewController class])];
            [wSelf.navigationController pushViewController:controller animated:YES];
        }
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

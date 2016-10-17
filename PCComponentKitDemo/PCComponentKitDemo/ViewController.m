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

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) PCTableViewLayout *layout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    __weak ViewController *wSelf = self;
    
    self.layout = [[PCTableViewLayout alloc] initWithTableView:self.tableView];
    //[self.layout registerCellClassName:NSStringFromClass([LSTCategoryCell class])];
    
    NSArray *itemArray = @[@"tableview",@"collectionview",@"customview",@"component",@"segementview",@"animation",@"datasource",@"navigationcontroller",@"basecontroller"];
    NSArray *dataArray = [@[itemArray] enumerateObjectsToSectionInfoUsingBlock:^(NSArray *obj, NSInteger idx, PCSectionInfo *sectionInfo) {
        NSArray *cellInfoArray = [obj enumerateObjectsToCellInfoUsingBlock:^(NSString *obj, NSInteger idx, PCCellInfo *cellInfo) {
            cellInfo.dataDict = @{@"title": obj};
            cellInfo.cellClassName = NSStringFromClass([PCCategoryCell class]);
            cellInfo.itemSize = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds), 44);
        }];
        sectionInfo.cellInfoArray = cellInfoArray;
    }];
    self.layout.dataArray = dataArray;
    self.layout.cellConfigure = ^(UITableViewCell *cell, NSIndexPath *indexpath, PCCellInfo *cellInfo) {
        if ([cell isKindOfClass:[PCCategoryCell class]]) {
            PCCategoryCell * categoryCell = (PCCategoryCell *)cell;
            categoryCell.titleLabel.text = cellInfo.dataDict[@"title"];
        }
    };
    self.layout.didSelected = ^(PCTableViewLayout *layout, NSIndexPath *indexpath, PCCellInfo *cellInfo) {
        [wSelf.layout.tableView deselectRowAtIndexPath:indexpath animated:YES];
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

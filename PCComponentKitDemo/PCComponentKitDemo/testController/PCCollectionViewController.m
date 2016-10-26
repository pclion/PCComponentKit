//
//  PCCollectionViewController.m
//  PCComponentKitDemo
//
//  Created by peichuang on 16/10/26.
//  Copyright © 2016年 peichuang. All rights reserved.
//

#import "PCCollectionViewController.h"
#import "PCTestItemCell.h"
#import "PCCollectionViewLayout.h"
#import "NSArray+CellInfoTransfer.h"

@interface PCCollectionViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) PCCollectionViewLayout *layout;

@end

@implementation PCCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"collectionView";
    
    __weak PCCollectionViewController *wSelf = self;
    
    self.layout = [[PCCollectionViewLayout alloc] initWithCollectionView:self.collectionView];
    self.layout.insetsForSection = UIEdgeInsetsMake(5, 5, 5, 5);
    
    NSArray *itemArray = @[[UIColor redColor],[UIColor grayColor],[UIColor greenColor],[UIColor brownColor],[UIColor blueColor],[UIColor blackColor],[UIColor purpleColor]];
    NSArray *dataArray = [@[itemArray] enumerateObjectsToSectionInfoUsingBlock:^(NSArray *obj, NSInteger idx, PCSectionInfo *sectionInfo) {
        NSArray *cellInfoArray = [obj enumerateObjectsToCellInfoUsingBlock:^(NSString *obj, NSInteger idx, PCCellInfo *cellInfo) {
            cellInfo.json = @{@"color": obj};
            cellInfo.cellClassName = NSStringFromClass([PCTestItemCell class]);
            cellInfo.itemSize = CGSizeMake(60, 60);
        }];
        sectionInfo.cellInfoArray = cellInfoArray;
        sectionInfo.minimumInteritemSpacing = 10;
        sectionInfo.minimumLineSpacing = 30;
    }];
    self.layout.dataArray = dataArray;
    
    self.layout.cellConfigure = ^(UIView *cell, NSIndexPath *indexpath, PCCellInfo *cellInfo) {
        if ([cell isKindOfClass:[PCTestItemCell class]]) {
            PCTestItemCell * testItemCell = (PCTestItemCell *)cell;
            testItemCell.contentView.backgroundColor = [cellInfo valueForKey:@"color"];
        }
    };
    self.layout.didSelected = ^(NSIndexPath *indexpath, PCCellInfo *cellInfo) {
        [wSelf.layout.collectionView deselectItemAtIndexPath:indexpath animated:YES];
    };
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

@end

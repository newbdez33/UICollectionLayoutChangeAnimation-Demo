//
//  ViewController.m
//  UICollectionViewHandMake
//
//  Created by Jacky <newbdez33@gmail.com> on 20/03/2014.
//  Copyright (c) 2014 Salmonapps. All rights reserved.
//

#import "ViewController.h"
#import "BlockCell.h"

@interface ViewController ()

@property (nonatomic, strong) VWCollectionViewLargeLayout *largeLayout;
@property (nonatomic, strong) VWCollectionViewSingleColumnLayout *singleColumnLayout;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //collection view layout
    self.singleColumnLayout = [[VWCollectionViewSingleColumnLayout alloc] init];
    self.largeLayout = [[VWCollectionViewLargeLayout alloc] init];
    
    _collectionView.collectionViewLayout = self.largeLayout;
    
	self.data = @[@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView 
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BlockCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BLOCK_CELL" forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"%d", indexPath.row];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_collectionView.collectionViewLayout == self.singleColumnLayout)
    {
        [self.largeLayout invalidateLayout];
        [_collectionView setCollectionViewLayout:self.largeLayout animated:YES];
        [UIView animateWithDuration:0.5 animations:^{
            //TODO 这里要根据contentSize的height算出offetset，再得到正确位置，交给你的小邵。
            self.detailViewController.view.frame = [collectionView cellForItemAtIndexPath:indexPath].frame;
        } completion:^(BOOL finished) {
            [self.detailViewController.view removeFromSuperview];
        }];
        
    }
    else
    {
        [self.singleColumnLayout invalidateLayout];
        [_collectionView setCollectionViewLayout:self.singleColumnLayout animated:YES];
        
        
        [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.detailViewController = [[VWInfoDetailViewController alloc] init];
            //TODO 这里的初始位置不对，应该用找到它对应的那个cell的位置（我临时弄成用户点的cell的位置了）
            self.detailViewController.view.frame = [collectionView cellForItemAtIndexPath:indexPath].frame;
            [self.view addSubview:self.detailViewController.view];
            self.detailViewController.view.frame = CGRectMake(200, 10, 800, 748);
        } completion:^(BOOL finished) {
            //
        }];
    }
}

@end

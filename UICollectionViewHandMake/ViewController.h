//
//  ViewController.h
//  UICollectionViewHandMake
//
//  Created by Jacky <newbdez33@gmail.com> on 20/03/2014.
//  Copyright (c) 2014 Salmonapps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VWCollectionViewLargeLayout.h"
#import "VWCollectionViewSingleColumnLayout.h"
#import "VWInfoDetailViewController.h"

@interface ViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate> {
    IBOutlet UICollectionView *_collectionView;

}

@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) VWInfoDetailViewController *detailViewController;

@end

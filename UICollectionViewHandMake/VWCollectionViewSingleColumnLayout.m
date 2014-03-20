//
//  VWCollectionViewSingleColumnLayout.m
//  UICollectionViewHandMake
//
//  Created by Jacky <newbdez33@gmail.com> on 20/03/2014.
//  Copyright (c) 2014 Salmonapps. All rights reserved.
//

#import "VWCollectionViewSingleColumnLayout.h"

@implementation VWCollectionViewSingleColumnLayout

-(id)init
{
    if (!(self = [super init])) return nil;
    
    self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 850);  //关键是这里的850，是根据column的with算出来的。这里小邵可以写死
    self.itemSize = CGSizeMake(150, 150);
    self.minimumInteritemSpacing = 10.0f;
    self.minimumLineSpacing = 10.0f;
    
    return self;
}

@end

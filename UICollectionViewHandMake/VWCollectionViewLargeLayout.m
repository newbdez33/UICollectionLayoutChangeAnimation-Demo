//
//  VWCollectionViewLargeLayout.m
//  UICollectionViewHandMake
//
//  Created by Jacky <newbdez33@gmail.com> on 20/03/2014.
//  Copyright (c) 2014 Salmonapps. All rights reserved.
//

#import "VWCollectionViewLargeLayout.h"

@implementation VWCollectionViewLargeLayout

-(id)init
{
    if (!(self = [super init])) return nil;
    
    self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.itemSize = CGSizeMake(150, 150);
    self.minimumInteritemSpacing = 10.0f;
    self.minimumLineSpacing = 10.0f;
    
    return self;
}

@end

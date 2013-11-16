//
//  SPDynamicTableViewViewController.h
//  StackOverflowClient
//
//  Created by Rex St. John on 11/15/13.
//  Copyright (c) 2013 Rex St. John. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPDynamicTableViewViewController : UITableViewController

-(CGSize)frameForText:(NSString*)text sizeWithFont:(UIFont*)font constrainedToSize:(CGSize)size;

@property(nonatomic,strong) NSArray *bodyTextArray;
@property(nonatomic,strong) NSArray *titleArray;
@end

//
//  TodoViewController.h
//  iostodo
//
//  Created by subha on 1/24/14.
//  Copyright (c) 2014 subha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodoViewController : UITableViewController

- (void)saveText:(NSString*) text ForCell:(int)row;

@end

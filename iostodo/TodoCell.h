//
//  TodoCell.h
//  iostodo
//
//  Created by subha on 1/24/14.
//  Copyright (c) 2014 subha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoViewController.h"

@interface TodoCell : UITableViewCell <UITextViewDelegate>
@property (weak, nonatomic) TodoViewController* todoController;
@property (weak, nonatomic) UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

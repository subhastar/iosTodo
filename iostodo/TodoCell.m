//
//  TodoCell.m
//  iostodo
//
//  Created by subha on 1/24/14.
//  Copyright (c) 2014 subha. All rights reserved.
//

#import "TodoCell.h"

@interface TodoCell ()
- (IBAction)editingEnd:(id)sender;

@end

@implementation TodoCell

@synthesize todoController;
@synthesize tableView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)editingEnd:(id)sender {
    NSLog(@"editing end.");
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];
    [todoController saveText:self.textField.text ForCell:indexPath.row];
}
@end

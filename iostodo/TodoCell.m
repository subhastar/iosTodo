//
//  TodoCell.m
//  iostodo
//
//  Created by subha on 1/24/14.
//  Copyright (c) 2014 subha. All rights reserved.
//

#import "TodoCell.h"

@interface TodoCell ()

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

- (void) textViewDidEndEditing:(UITextView *)textView
{
    NSLog(@"inside text view did end editing.");
    [todoController saveText:textView.text ForCell:textView.tag];
}
@end

//
//  TodoViewController.m
//  iostodo
//
//  Created by subha on 1/24/14.
//  Copyright (c) 2014 subha. All rights reserved.
//

#import "TodoViewController.h"
#import "TodoCell.h"

@interface TodoViewController ()

@property(nonatomic, strong) NSMutableArray *todoItems;
@property(nonatomic, strong) UIBarButtonItem *addButton;

- (void) saveFile;

@end

@implementation TodoViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.todoItems = [[NSMutableArray alloc] init];
    
    [self.todoItems addObjectsFromArray:[NSArray arrayWithContentsOfFile:@"file"]];
    
    self.addButton = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self
                                  action:@selector(addItem:)];
    self.navigationItem.rightBarButtonItem = self.addButton;
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.todoItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TodoCell";
    TodoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textView.text = self.todoItems[indexPath.row];
    cell.textView.tag = indexPath.row;
    cell.showsReorderControl = YES;
    cell.todoController = self;
    cell.tableView = tableView;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath
                                                               *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    NSString *temp = self.todoItems[destinationIndexPath.row];
    self.todoItems[destinationIndexPath.row] = self.todoItems[sourceIndexPath.row];
    self.todoItems[sourceIndexPath.row] = temp;
    [self saveFile];
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float TEXT_VIEW_WIDTH = 207.0f;
    float CELL_CONTENT_MARGIN = 8.0f; //top and bottom constraint width.
    float FONT_SIZE = 14.0f;
    
    NSString *text = self.todoItems[indexPath.row];
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:FONT_SIZE]};

    CGSize boundingSize = CGSizeMake(TEXT_VIEW_WIDTH, 20000.0f);
    
    CGRect boundingRect = [text boundingRectWithSize:boundingSize options:NSStringDrawingUsesLineFragmentOrigin  attributes:attributes context:nil];
    NSLog(@"bounding rect %f", boundingRect.size.height);
    
    float neededHeight = boundingRect.size.height + CELL_CONTENT_MARGIN * 2 + 10;
    
    float height = MAX(neededHeight, 44.0f);
    
    NSLog(@"final height is : %f", height);
    return height;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.todoItems removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [self saveFile];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

/*- (IBAction)plusAction:(id)sender {
    [self.todoItems addObject:@""];
    [self.tableView reloadData];
}*/

- (void)addItem:sender {
    [self.todoItems addObject:@""];
    [self.tableView reloadData];
}

- (void)saveText:(NSString*) text ForCell:(int)row {
    self.todoItems[row] = text;
    [self.tableView reloadData];
    [self saveFile];
}

- (void) saveFile {
    [self.todoItems writeToFile:@"file" atomically:YES];
}

@end

//
//  SYFIndexViewController.m
//  Demo
//
//  Created by floyd on 13-5-15.
//  Copyright (c) 2013年 floyd. All rights reserved.
//

#import "SYFIndexViewController.h"
#import "SYFDefaultCell.h"

@interface SYFIndexViewController ()<UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *_objects;
}

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UITextField *textField;
@property(nonatomic, strong) UIButton *button;

@end

@implementation SYFIndexViewController


-(void)dealloc
{
    [super dealloc];
    [self.tableView release];
}

- (id)init
{
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Index", @"Index Comment");
        if (!_objects) {
            _objects = [[NSMutableArray alloc] init];
        }
        [_objects insertObject:[NSDate date] atIndex:0];
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
//    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Index", @"Index Comment");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIBarButtonItem *addButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)] autorelease];
    self.navigationItem.rightBarButtonItem = addButton;
    
    // textField
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 5, 350, 45)];
    self.textField.backgroundColor = [UIColor greenColor];
    self.textField.font = [UIFont boldSystemFontOfSize:38];
    
    // button
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(380, 5, 100, 45);
    self.button.backgroundColor = [UIColor blueColor];
    self.button.titleLabel.textColor = [UIColor blackColor];
    self.button.titleLabel.font = [UIFont systemFontOfSize:25];
    [self.button setTitle:@"Search" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    
    // tableView
    self.tableView = [[[UITableView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height)] autorelease];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    [self.view addSubview:self.button];
    [self.view addSubview:self.textField];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)search:(id)sender
{
    
    
    
}

- (void)insertNewObject:(id)sender
{
    NSLog(@"****************insertNewObject");
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"****************numberOfSectionsInTableView");
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"****************numberOfRowsInSection");
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"****************cellForRowAtIndexPath");
    static NSString *CellIdentifier = @"Cell";
    
    SYFDefaultCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[SYFDefaultCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
//    cell.textLabel.text = [_objects[indexPath.row] description];
    NSDictionary *dict = @{@"title": [_objects[indexPath.row] description]};
    [cell setCellInfo:dict];
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"****************canEditRowAtIndexPath");
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"****************commitEditingStyle");
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSLog(@"****************moveRowAtIndexPath");
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"****************canMoveRowAtIndexPath");
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"****************didSelectRowAtIndexPath");
}

@end

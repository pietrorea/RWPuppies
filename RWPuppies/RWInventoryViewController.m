//
//  RWInventoryViewController.m
//  RWPuppies
//
//  Created by Pietro Rea on 12/18/12.
//  Copyright (c) 2012 Pietro Rea. All rights reserved.
//

#import "RWInventoryViewController.h"
#import "RWPuppyViewController.h"
#import "AFNetworking.h"
#import "RWInventoryCell.h"
#import "RWPuppy.h"
#import "RWPuppies.h"

@interface RWInventoryViewController () <UITableViewDataSource, UITableViewDelegate>

@property (assign, nonatomic) NSInteger selectedIndex;
@property (strong, nonatomic) IBOutlet UITableView* tableView;

@end

@implementation RWInventoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [RWPuppies sharedInstance].allPuppies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RWPuppy* puppy = [RWPuppies sharedInstance].allPuppies[indexPath.row];
  
    RWInventoryCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"InventoryCell"];
    [cell.puppyImageView setImageWithURL:[NSURL URLWithString:puppy.photoURL]];
    cell.puppyName.text =  puppy.name;
    cell.puppyBreed.text = puppy.breedName;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedIndex = indexPath.row;
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self performSegueWithIdentifier:@"toPuppyViewController" sender:nil];
}

#pragma mark - UIStoryboard methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    RWPuppyViewController* viewController = (RWPuppyViewController*) segue.destinationViewController;
    viewController.puppy = [RWPuppies sharedInstance].allPuppies[self.selectedIndex];
}


@end

//
//  RWCheckoutViewController.m
//  RWPuppies
//
//  Created by Pietro Rea on 12/18/12.
//  Copyright (c) 2012 Pietro Rea. All rights reserved.
//

#import "RWCheckoutViewController.h"
#import "RWCheckoutPuppyCell.h"
#import "RWSubtotalCell.h"
#import "RWCheckoutCart.h"

@interface RWCheckoutViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *continueButtonView;
@property (strong, nonatomic) IBOutlet UIButton *continueButton;

@property (strong, nonatomic) RWCheckoutCart* checkoutCart;

@end

@implementation RWCheckoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.checkoutCart = [RWCheckoutCart sharedInstance];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource methods

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return (section == 0) ? @"Puppies " : @"";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (section == 0) ? self.checkoutCart.puppiesInCart.count : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        RWPuppy* puppy = self.checkoutCart.puppiesInCart[indexPath.row];
        RWCheckoutPuppyCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"CheckoutCell"];
        cell.puppyNameLabel.text =  puppy.name;
        cell.puppyBreedLabel.text = puppy.breedName;
        cell.priceLabel.text = [NSString stringWithFormat:@"$%@", puppy.price];
        return cell;
    }
    else {
        RWSubtotalCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"TotalCell"];
        cell.totalLabel.text = [NSString stringWithFormat:@"$%@", [self.checkoutCart total]];
        return cell;
    }
    
    return nil;
}

#pragma mark - UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}


@end

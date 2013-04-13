//
//  RWPuppyViewController.m
//  RWPuppies
//
//  Created by Pietro Rea on 12/25/12.
//  Copyright (c) 2012 Pietro Rea. All rights reserved.
//

#import "RWPuppyViewController.h"
#import "RWCheckoutCart.h"
#import "AFNetworking.h"

@interface RWPuppyViewController ()

@property (strong, nonatomic) IBOutlet UILabel *puppyNameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *puppyImageView;
@property (strong, nonatomic) IBOutlet UILabel *puppyBreedLabel;
@property (strong, nonatomic) IBOutlet UILabel *maxWeightLabel;
@property (strong, nonatomic) IBOutlet UILabel *maxHeightLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UIButton *addToCartButton;

- (IBAction)addToCartButtonTapped:(id)sender;

@end

@implementation RWPuppyViewController

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
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
  RWCheckoutCart* checkoutCart = [RWCheckoutCart sharedInstance];
  self.addToCartButton.selected = [checkoutCart containsPuppy:self.puppy] ? YES : NO;
}

- (void)loadData {
    
    self.puppyNameLabel.text = self.puppy.name;
    NSURL* imageURL = [NSURL URLWithString:self.puppy.photoURL];
    [self.puppyImageView setImageWithURL:imageURL placeholderImage:nil];
    self.puppyBreedLabel.text = [NSString stringWithFormat:@"Breed: %@", self.puppy.breedName];
    self.maxWeightLabel.text = [NSString stringWithFormat:@"Max Weight: %@ lbs", self.puppy.maxWeight];
    self.maxHeightLabel.text = [NSString stringWithFormat:@"Max Height: %@ in", self.puppy.maxHeight];
    self.priceLabel.text = [NSString stringWithFormat:@"Price: $%@", self.puppy.price];
}

- (IBAction)addToCartButtonTapped:(id)sender {
    RWCheckoutCart* checkoutCart = [RWCheckoutCart sharedInstance];
    
    if (!self.addToCartButton.selected) {
        [checkoutCart addPuppy:self.puppy];
        self.addToCartButton.selected = YES;
    }
    else {
        [checkoutCart removePuppy:self.puppy];
        self.addToCartButton.selected = NO;
    }
}

@end

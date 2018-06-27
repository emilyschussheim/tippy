//
//  ViewController.m
//  Tippy
//
//  Created by Emily Schussheim on 6/26/18.
//  Copyright © 2018 Emily Schussheim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

@property (weak, nonatomic) IBOutlet UITextField *billField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[self.billField endEditing:NO];
    [self.billField becomeFirstResponder];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger index = [defaults integerForKey:@"tipControl"];
    self.tipControl.selectedSegmentIndex = index;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}
- (IBAction)onEdit:(id)sender {
    
    NSArray *percentages = @[@(.15), @(.2), @(.22)];
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    double bill = [self.billField.text doubleValue];
    double tip = tipPercentage * bill;
    double total = bill + tip;
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    
}
- (IBAction)onEditingDidEnd:(id)sender {


    [UIView animateWithDuration:.2 animations:^{
        self.tipLabel.alpha = 1;
    }];
    [UIView animateWithDuration:.2 animations:^{
        self.totalLabel.alpha = 1;
    }];
    

}
- (IBAction)onEditingDidBegin:(id)sender {
    
    [UIView animateWithDuration:.2 animations:^{
        self.tipLabel.alpha = 0;
    }];
    [UIView animateWithDuration:.2 animations:^{
        self.totalLabel.alpha = 0;
    }];
    
}


@end

//
//  ViewController.m
//  Multiply
//
//  Created by Rajiv Ramaiah on 9/28/15.
//  Copyright © 2015 Rajiv Ramaiah Applications. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *multiplierLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UISlider *sliderValue;
@property (weak, nonatomic) IBOutlet UISegmentedControl *operatorSegementedControl;
@property (weak, nonatomic) IBOutlet UILabel *input;
@property (weak, nonatomic) IBOutlet UILabel *operatorLabel;
@property bool isCalcPressed;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.input.text = @"0";
    self.isCalcPressed = NO;
    self.operatorLabel.text = @"Times";

}


- (IBAction)onCalculateButtonPressed:(UIButton *)sender {

    int number = [self.input.text intValue];
    int multiplier = [self.multiplierLabel.text intValue];
    double result = 0;


    if (self.operatorSegementedControl.selectedSegmentIndex == 0)
    {
        result = number * multiplier;
    }
    else if (self.operatorSegementedControl.selectedSegmentIndex == 1)
    {

        result = (double)number / multiplier;

    }
    else if (self.operatorSegementedControl.selectedSegmentIndex == 2){

        result = number + multiplier;
    }
    else{
        result = number - multiplier;
    }

    NSLog(@"%f",fmod(result,5));
    if (fmod(result,5.0) == 0.000000 && fmod(result,3.0) ==0.000000){
        self.answerLabel.text = @"Fizzbuzz";

    }

    else if (fmod(result,5.0) == 0.000000){
        self.answerLabel.text = @"Buzz";
    }

    else if(fmod(result,3.0) == 0.000000){
        self.answerLabel.text = @"Fizz";
    }
    else{
    self.answerLabel.text = [NSString stringWithFormat:@"%.2f", result];
    }
    if (result >= 20){
        self.view.backgroundColor = [UIColor colorWithRed:7.0f/255.0f
                                                    green:40.0f/255.0f
                                                     blue:107.0f/255.0f
                                                    alpha:0.75f];
    }
    else {
        self.view.backgroundColor = [UIColor colorWithRed:7.0f/255.0f
                                                    green:40.0f/255.0f
                                                     blue:107.0f/255.0f
                                                    alpha:0.50f];
    }



    [self.view endEditing:YES];
    self.isCalcPressed = YES;

}



- (IBAction)sliderValueChanged:(UISlider *)sender {
    self.multiplierLabel.text = [NSString stringWithFormat:@"%i",(int)self.sliderValue.value];

    self.view.backgroundColor = [UIColor colorWithRed:7.0f*self.sliderValue.value/255.0f
                                                green:40.0f*self.sliderValue.value/255.0f
                                                 blue:107.0f/255.0f
                                                alpha:0.50f];

}
- (IBAction)numberButtonPressed:(UIButton *)sender {

    if ([sender.titleLabel.text isEqualToString:@"Clr"])
    {
        self.input.text = @"0";
        self.answerLabel.text = @"0";
    }
    else{
        if ([self.input.text isEqualToString:@"0"])
        {
            self.input.text = @"";

        }

        self.input.text = [self.input.text stringByAppendingString:sender.titleLabel.text];
    }

}

- (IBAction)onOperatorButtonPressed:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0)
    {
        self.operatorLabel.text = @"Times";
    }
    else if (sender.selectedSegmentIndex == 1)
    {
        self.operatorLabel.text = @"Divided By";


    }
    else if (sender.selectedSegmentIndex == 2){
        self.operatorLabel.text = @"Plus";

    }
    else{
        self.operatorLabel.text = @"Subtracted By";
    }
}









@end

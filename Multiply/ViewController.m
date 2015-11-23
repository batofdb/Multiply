//
//  ViewController.m
//  Multiply
//
//  Created by Rajiv Ramaiah on 9/28/15.
//  Copyright © 2015 Rajiv Ramaiah Applications. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorManager.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@property bool isCalcPressed;
@property NSString *operationStr;

@property CalculatorManager *calculatorManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.calculatorManager = [CalculatorManager new];
    self.answerLabel.text = @"0";
}


- (NSString *)formatAnswer {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.maximumFractionDigits = 20;
    return [NSString stringWithFormat:@"%@", [formatter stringFromNumber:[NSNumber numberWithDouble:self.calculatorManager.answer]]];
}

- (IBAction)onCalculateButtonPressed:(UIButton *)sender {

    if (self.calculatorManager.operandOne == 0) {
        self.calculatorManager.operandOne = [self.answerLabel.text doubleValue];
    } else {
        if (self.calculatorManager.operandTwo == 0) {
        self.calculatorManager.operandTwo = [self.answerLabel.text doubleValue];
        } else {
            self.calculatorManager.operandOne = [self.answerLabel.text doubleValue];
        }
    }
    
    [self.calculatorManager calculateAnswerWithOperation:self.operationStr];

    self.answerLabel.text = [self formatAnswer];

}

- (IBAction)onOperationButtonPressed:(UIButton *)sender {

    if (self.calculatorManager.operandOne == 0) {
        self.calculatorManager.operandOne = [self.answerLabel.text doubleValue];
        self.answerLabel.text = @"0";
    } else {
        if (self.calculatorManager.operandTwo == 0) {
            self.calculatorManager.operandTwo = [self.answerLabel.text doubleValue];
        } else {
            self.calculatorManager.operandOne = [self.answerLabel.text doubleValue];
        }

        [self.calculatorManager calculateAnswerWithOperation:[sender.titleLabel text]];
        self.answerLabel.text = [self formatAnswer];
    }
    self.operationStr = sender.titleLabel.text;
    NSLog(@"operandOne: %f operandTwo: %f",self.calculatorManager.operandOne, self.calculatorManager.operandTwo);
}



- (IBAction)numberButtonPressed:(UIButton *)sender {

    if ([sender.titleLabel.text isEqualToString:@"Clr"])
    {
        self.calculatorManager.operandOne = 0.0f;
        self.calculatorManager.operandTwo = 0.0f;
        self.answerLabel.text = @"0";
    } else {
        if ([self.answerLabel.text isEqualToString:@"0"]) {
            self.answerLabel.text = @"";
         }
        self.answerLabel.text = [self.answerLabel.text stringByAppendingString:[sender.titleLabel text]];
        NSLog(@"%@",[sender.titleLabel text]);
    }

}











@end

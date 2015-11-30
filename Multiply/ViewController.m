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

@property bool isOperationPressed;
@property NSString *operationStr;
@property (weak, nonatomic) IBOutlet UILabel *spelledOutAnswerLabel;

@property CalculatorManager *calculatorManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    self.isOperationPressed = NO;
    [super viewDidLoad];
    self.calculatorManager = [CalculatorManager new];
    self.answerLabel.text = @"0";
    self.answerLabel.adjustsFontSizeToFitWidth = YES;
    self.spelledOutAnswerLabel.adjustsFontSizeToFitWidth = YES;
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

    self.isOperationPressed = YES;
}



- (IBAction)numberButtonPressed:(UIButton *)sender {
    
    if (self.isOperationPressed)
        self.answerLabel.text = @"";

    if ([sender.titleLabel.text isEqualToString:@"Clr"])
    {
        self.calculatorManager.operandOne = 0.0f;
        self.calculatorManager.operandTwo = 0.0f;
        self.answerLabel.text = @"0";
        self.spelledOutAnswerLabel.text = @"";
    } else if ([sender.titleLabel.text isEqualToString:@"+ / -"]) {

        if ([self.answerLabel.text containsString:@"-"]) {
            self.answerLabel.text = [self.answerLabel.text stringByReplacingOccurrencesOfString:@"-" withString:@""];
        } else {
            self.answerLabel.text = [@"-" stringByAppendingString:self.answerLabel.text];
        }

        self.calculatorManager.operandOne = 0;
        self.calculatorManager.operandTwo = 0;

    } else if ([sender.titleLabel.text isEqualToString:@"<"]) {

        if (self.answerLabel.text.length > 0) {
            NSString *str = [self.answerLabel.text substringToIndex:[self.answerLabel.text length] -1];
            self.answerLabel.text = str;
        }

        if (self.answerLabel.text.length == 0) {
            self.answerLabel.text = @"0";
        }

        [self updatedTextLabelWithButton:sender];
        
    } else {
        if (self.answerLabel.text.length < 14) {
            if ([self.answerLabel.text isEqualToString:@"0"]) {
                self.answerLabel.text = @"";
             }

            //Add animation layer
            CATransition *animation = [CATransition animation];
            animation.duration = 0.1;
            animation.type = kCATransitionFade;
            animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            [self.answerLabel.layer addAnimation:animation forKey:@"changeTextTransition"];

            self.answerLabel.text = [self.answerLabel.text stringByAppendingString:[sender.titleLabel text]];
            
            [self updatedTextLabelWithButton:sender];
        }

    }

    self.isOperationPressed = NO;
}


- (void) updatedTextLabelWithButton: (UIButton *)sender {
    //Change text
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *num = [f numberFromString:self.answerLabel.text];

    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterSpellOutStyle];
    self.spelledOutAnswerLabel.text = [numberFormatter stringFromNumber:num];

    NSLog(@"%@",[sender.titleLabel text]);
}









@end

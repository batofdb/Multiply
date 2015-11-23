//
//  CalculatorManager.m
//  Multiply
//
//  Created by Francis Bato on 11/21/15.
//  Copyright © 2015 Rajiv Ramaiah Applications. All rights reserved.
//

#import "CalculatorManager.h"

@implementation CalculatorManager

- (instancetype)init {
    self = [super init];
    if (self) {
        self.operandTwo = 0.0f;
        self.operandTwo = 0.0f;
        self.answer = 0.0f;
    }

    return self;
}

- (double)calculateAnswerWithOperation:(NSString *)operation {
    
    if ([operation isEqualToString:@"+"]) {
        self.answer = self.operandOne + self.operandTwo;
    } else if ([operation isEqualToString:@"-"]) {
        self.answer = self.operandOne - self.operandTwo;
    } else if ([operation isEqualToString:@"/"]) {
        self.answer = self.operandOne / self.operandTwo;
    } else if ([operation isEqualToString:@"x"]) {
        self.answer = self.operandOne * self.operandTwo;
    }

    return self.answer;
}

@end

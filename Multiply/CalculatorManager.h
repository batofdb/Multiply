//
//  CalculatorManager.h
//  Multiply
//
//  Created by Francis Bato on 11/21/15.
//  Copyright © 2015 Rajiv Ramaiah Applications. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorManager : NSObject

@property (nonatomic) double operandOne;
@property (nonatomic) double operandTwo;
@property (nonatomic) double answer;
@property (nonatomic, strong) NSString *calcOperation;

- (double)calculateAnswerWithOperation:(NSString *)operation;

@end

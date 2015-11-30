//
//  CustomButton.m
//  Multiply
//
//  Created by Francis Bato on 11/23/15.
//  Copyright © 2015 Rajiv Ramaiah Applications. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.startColor     = [UIColor redColor];
        self.midColor       = [UIColor greenColor];
        self.endColor       = [UIColor blueColor];
        self.borderWidth    = 2;
        self.cornerRadius  = 10;
        self.isHorizontal   = NO;
        [self customInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self customInit];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    [self customInit];
}

- (void)setNeedsLayout {
    [super setNeedsLayout];
    [self setNeedsDisplay];
}


- (void)prepareForInterfaceBuilder {

    [self customInit];
}

- (void)customInit {


    self.layer.cornerRadius = self.cornerRadius;
    self.layer.borderWidth = self.borderWidth;

    if (self.cornerRadius > 0) {
        self.layer.masksToBounds = YES;
    }


    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;

    gradient.colors = [NSArray arrayWithObjects:(id)[self.startColor CGColor],(id)[self.midColor CGColor], (id)[self.endColor CGColor], nil];
    gradient.endPoint = (self.isHorizontal) ? CGPointMake(1, 0) : CGPointMake(0, 1);
    [self.layer insertSublayer:gradient atIndex:0];
    
}


@end

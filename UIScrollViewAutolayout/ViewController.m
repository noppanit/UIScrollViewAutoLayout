//
//  ViewController.m
//  UIScrollViewAutolayout
//
//  Created by Noppanit Charassinvichai on 3/22/15.
//  Copyright (c) 2015 Noppanit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setupNewsView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) viewDidLayoutSubviews
{
    UIView *newsView = [[UIView alloc] initWithFrame:CGRectZero];
    newsView.backgroundColor = [UIColor redColor];
    
    UIView *anotherNewsView = [[UIView alloc] initWithFrame:CGRectZero];
    anotherNewsView.backgroundColor = [UIColor blueColor];
    
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    newsView.translatesAutoresizingMaskIntoConstraints = NO;
    anotherNewsView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.scrollView.pagingEnabled = YES;

    [self.scrollView addSubview:newsView];
    [self.scrollView addSubview:anotherNewsView];
    
    NSLog(@"%f", self.scrollView.frame.size.width);
    NSLog(@"%f", self.scrollView.frame.size.height);
    NSArray *heightConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view(height)]" options:0 metrics:@{ @"height":@(CGRectGetHeight(self.scrollView.frame)) } views:@{ @"view":newsView }];
    
    [self.scrollView addConstraints: heightConstraints];
    
    [self.scrollView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"H:[newsView(width)]" options:0 metrics:@{ @"width":@(CGRectGetWidth(self.scrollView.frame)) } views:@{ @"newsView":newsView}]];
    
    [self.scrollView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"H:[anotherNewsView(width)]" options:0 metrics:@{ @"width":@(CGRectGetWidth(self.scrollView.frame)) } views:@{ @"anotherNewsView":anotherNewsView }]];

    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:newsView
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.scrollView
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1.0f
                                                                     constant:0.0f]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:newsView
                                                                attribute:NSLayoutAttributeBottom
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1.0f
                                                                 constant:0.0f]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:newsView
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1.0f
                                                                 constant:0.0f]];

    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:newsView
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:anotherNewsView
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1.0f
                                                                 constant:0.0f]];
 
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:anotherNewsView
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1.0f
                                                                 constant:0.0f]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:anotherNewsView
                                                                attribute:NSLayoutAttributeBottom
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1.0f
                                                                 constant:0.0f]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:anotherNewsView
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1.0f
                                                                 constant:0.0f]];
  
}


@end

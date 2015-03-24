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
    [self setupNewsView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) setupNewsView
{
    UIView *newsView = [[NewsSection alloc] initWithFrame:CGRectZero];
    newsView.backgroundColor = [UIColor redColor];
    
    UIView *anotherNewsView = [[NewsSection alloc] initWithFrame:CGRectZero];
    anotherNewsView.backgroundColor = [UIColor blueColor];
    
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    newsView.translatesAutoresizingMaskIntoConstraints = NO;
    anotherNewsView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.scrollView.pagingEnabled = YES;

    [self.scrollView addSubview:newsView];
    [self.scrollView addSubview:anotherNewsView];
    
    NSDictionary *viewsDict = @{ @"newsView": newsView, @"anotherNewsView": anotherNewsView };
    
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[newsView]|"
                                                                            options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom
                                                                            metrics:nil
                                                                              views:viewsDict]];
    
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[newsView]|"
                                                                            options:0
                                                                            metrics:nil
                                                                              views:viewsDict]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:newsView
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeWidth
                                                               multiplier:1.0f
                                                                 constant:0.0f]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:newsView
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeHeight
                                                               multiplier:1.0f
                                                                 constant:0.0f]];
    
    
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[anotherNewsView(200)]|" options:0 metrics:nil views:viewsDict]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[anotherNewsView(100)]|" options:0 metrics:nil views:viewsDict]];

    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width * 2, self.scrollView.frame.size.height)];

}
//
//- (void)viewDidLayoutSubviews {
//    [super viewDidLayoutSubviews];
//    
//    for (int i = 0; i < 2; i++)
//    {
//        CGRect frame;
//        frame.origin.x = self.scrollView.frame.size.width * i;
//        frame.size = self.scrollView.frame.size;
//        self.scrollView.pagingEnabled = YES;
//        
//        NewsSection *sectionView = [[NewsSection alloc] initWithFrame:frame];
//        sectionView.translatesAutoresizingMaskIntoConstraints = NO;
//        
//        [self.scrollView addSubview:sectionView];
//
//    }
//    
//    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width * 2, self.scrollView.frame.size.height)];
//    
//    
//}



@end

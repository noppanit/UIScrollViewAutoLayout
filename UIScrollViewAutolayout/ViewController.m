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

//    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width * 2, self.scrollView.frame.size.height)];
    
//    NSDictionary *viewsDict = @{ @"newsView": newsView, @"anotherNewsView": anotherNewsView };
//    
//        [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[newsView]|"
//                                                                                options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom
//                                                                                metrics:nil
//                                                                                  views:viewsDict]];
//    
//        [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[newsView]|"
//                                                                                options:0
//                                                                                metrics:nil
//                                                                                  views:viewsDict]];
    
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
//
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:newsView
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:anotherNewsView
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1.0f
                                                                 constant:0.0f]];
//    
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
    
//    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:newsView
//                                                                attribute:NSLayoutAttributeWidth
//                                                                relatedBy:NSLayoutRelationEqual
//                                                                   toItem:anotherNewsView
//                                                                attribute:NSLayoutAttributeWidth
//                                                               multiplier:0.99f
//                                                                 constant:0.0f]];
    
    //
//    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:anotherNewsView
//                                                                attribute:NSLayoutAttributeTrailing
//                                                                relatedBy:NSLayoutRelationEqual
//                                                                   toItem:self.scrollView
//                                                                attribute:NSLayoutAttributeTrailing
//                                                               multiplier:1.0f
//                                                                 constant:0.0f]];
    
    
//    var constraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-[card]|", options: nil, metrics: nil, views: ["card": card])
//    constraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-[card2]|", options: nil, metrics: nil, views: ["card2": card2])
//    //Add horizontal constraints that tie the cards together, and to the super view
//    constraints += NSLayoutConstraint.constraintsWithVisualFormat("H:|-[card]-(16)-[card2]-|", options: nil, metrics: nil, views: ["card": card, "card2": card2])
//    //Add horizontal constraint that disambiguates individual card width
//    constraints += NSLayoutConstraint.constraintsWithVisualFormat("H:[card(==card2)]", options: nil, metrics: nil, views: ["card": card, "card2": card2])
//    cell.scrollContentView.addConstraints(constraints)
    
    
//    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[newsView]|"
//                                                                            options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom
//                                                                            metrics:nil
//                                                                              views:viewsDict]];
//    
//    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[newsView]|"
//                                                                            options:0
//                                                                            metrics:nil
//                                                                              views:viewsDict]];
//    
//    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:newsView
//                                                                attribute:NSLayoutAttributeWidth
//                                                                relatedBy:NSLayoutRelationEqual
//                                                                   toItem:self.scrollView
//                                                                attribute:NSLayoutAttributeWidth
//                                                               multiplier:1.0f
//                                                                 constant:0.0f]];
//    
//    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:newsView
//                                                                attribute:NSLayoutAttributeHeight
//                                                                relatedBy:NSLayoutRelationEqual
//                                                                   toItem:self.scrollView
//                                                                attribute:NSLayoutAttributeHeight
//                                                               multiplier:1.0f
//                                                                 constant:0.0f]];
  
//    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[anotherNewsView]|"
//                                                                            options:0
//                                                                            metrics:nil
//                                                                              views:viewsDict]];
//
//    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:anotherNewsView
//                                                                attribute:NSLayoutAttributeWidth
//                                                                relatedBy:NSLayoutRelationEqual
//                                                                   toItem:self.scrollView
//                                                                attribute:NSLayoutAttributeWidth
//                                                               multiplier:1.0f
//                                                                 constant:0.0f]];
//    
//    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:anotherNewsView
//                                                                attribute:NSLayoutAttributeHeight
//                                                                relatedBy:NSLayoutRelationEqual
//                                                                   toItem:self.scrollView
//                                                                attribute:NSLayoutAttributeHeight
//                                                               multiplier:1.0f
//                                                                 constant:0.0f]];
    
//    
//    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[anotherNewsView(200)]|" options:0 metrics:nil views:viewsDict]];
//    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[anotherNewsView(100)]|" options:0 metrics:nil views:viewsDict]];

//    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[newsView(500)]-(0)-[anotherNewsView]-|" options:0 metrics:nil views:viewsDict]];
//    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[newsView]-(10)-[anotherNewsView]-|" options:0 metrics:nil views:viewsDict]];
//    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[anotherNewsView(500)]" options:0 metrics:nil views:viewsDict]];
    
//    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[newsView(500)]" options:0 metrics:nil views:viewsDict]];
//    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[newsView(1200)]-[anotherNewsView(100)]" options:0 metrics:nil views:viewsDict]];
//    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[anotherNewsView(200)]" options:0 metrics:nil views:viewsDict]];


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

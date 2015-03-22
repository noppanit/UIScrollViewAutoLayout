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
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    for (int i = 0; i < 2; i++)
    {
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width * i;
        frame.size = self.scrollView.frame.size;
        self.scrollView.pagingEnabled = YES;
        
        NewsSection *sectionView = [[NewsSection alloc] initWithFrame:frame];
        sectionView.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.scrollView addSubview:sectionView];
        NSDictionary *viewsDictionary = @{@"sectionView":sectionView};
        [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[sectionView]|"
                                                                                options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom
                                                                                metrics:nil
                                                                                  views:viewsDictionary]];

                [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:sectionView
                                                                            attribute:NSLayoutAttributeWidth
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self.scrollView
                                                                            attribute:NSLayoutAttributeWidth
                                                                           multiplier:1.0f
                                                                             constant:0.0f]];
        
                [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:sectionView
                                                                            attribute:NSLayoutAttributeHeight
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self.scrollView
                                                                            attribute:NSLayoutAttributeHeight
                                                                           multiplier:1.0f
                                                                             constant:0.0f]];
        
    }
    
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width * 2, self.scrollView.frame.size.height)];
    
    
}



@end

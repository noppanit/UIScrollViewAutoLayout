//
//  NewsSection.m
//  UIScrollViewAutolayout
//
//  Created by Noppanit Charassinvichai on 3/22/15.
//  Copyright (c) 2015 Noppanit. All rights reserved.
//

#import "NewsSection.h"

@implementation NewsSection

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"NewsSection" owner:self options:nil][0];
    }
    return self;
}
@end

//
//  songbaizhangLoginView.m
//  TrainingCat
//
//  Created by crespo on 2020/3/4.
//  Copyright © 2020 crespo. All rights reserved.
//

#import "songbaizhangLoginView.h"

@implementation songbaizhangLoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)drawRect:(CGRect)rect{

        CGContextRef context=UIGraphicsGetCurrentContext();

        CGContextSetLineWidth(context,0.2);

        CGContextBeginPath(context);

        CGContextMoveToPoint(context,5,50);

        CGContextAddLineToPoint(context,self.frame.size.width-5,50);

        CGContextClosePath(context);

        [[UIColor grayColor]setStroke];

        CGContextStrokePath(context);

}

@end

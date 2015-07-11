//
//  MorePickTagList.h
//  yan
//
//  Created by tianqi on 14/11/13.
//  Copyright (c) 2014年 html-js. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "MorePicDelegate.h"
@interface MorePickTagList : UIView

{
    UIView *view;
    NSArray *textArray;
    CGSize sizeFit;
    UIColor *lblBackgroundColor;
    
}

@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) NSArray *textArray;
@property NSString *color;
- (void)setLabelBackgroundColor:(UIColor *)color;
- (void)setTags:(NSArray *)array;
- (void)display;
@property  BOOL isSelf;
- (CGSize)fittedSize;
@property id<MorePicDelegate> symbolDelegate;
@end

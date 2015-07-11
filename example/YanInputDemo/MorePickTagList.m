//
//  SymbolTagList.m
//  yan
//
//  Created by tianqi on 14/11/10.
//  Copyright (c) 2014年 html-js. All rights reserved.
//

#import "MorePickTagList.h"
#import "MorePickButton.h"
#import <QuartzCore/QuartzCore.h>
#define CORNER_RADIUS 0.0f
#define LABEL_MARGIN 0.0f
#define BOTTOM_MARGIN 0.0f
#define FONT_SIZE 18.0f
#define HORIZONTAL_PADDING 15.0f
#define VERTICAL_PADDING 10.0f
#define BACKGROUND_COLOR [SYUtil colorWithHex:@"ffffff"]
#define TEXT_COLOR [SYUtil colorWithHex:@"333333"]
#define TEXT_SHADOW_COLOR [UIColor whiteColor]
#define TEXT_SHADOW_OFFSET CGSizeMake(0.0f, 1.0f)
#define BORDER_COLOR [UIColor clearColor].CGColor
#define BORDER_WIDTH 0f
@implementation MorePickTagList
@synthesize view, textArray;
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
        [self addSubview:view];
    }
    return self;
}

- (void)setTags:(NSArray *)array
{
    textArray = [[NSArray alloc] initWithArray:array];
    sizeFit = CGSizeZero;
    [self display];
}

- (void)setLabelBackgroundColor:(UIColor *)color
{
    lblBackgroundColor = color;
    [self display];
}

- (void)display
{
    for (UILabel *subview in [self subviews]) {
        [subview removeFromSuperview];
    }
    float totalHeight = 0;
    CGRect previousFrame = CGRectZero;
    BOOL gotPreviousFrame = NO;

    for (NSMutableDictionary *dic in textArray) {
        NSError *error;
        
        NSString *newtext;
        newtext = [dic objectForKey:@"word"];
        NSString *code = [dic objectForKey:@"code"];

        CGSize textSize = [newtext sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:CGSizeMake(self.frame.size.width, 1500) lineBreakMode:UILineBreakModeWordWrap];
        textSize.width += HORIZONTAL_PADDING*2;
        textSize.height += VERTICAL_PADDING*2;
        MorePickButton *label = nil;
        if (!gotPreviousFrame) {
            label = [MorePickButton buttonWithType:UIButtonTypeCustom];
            label.frame = CGRectMake(0, 0, textSize.width, textSize.height);
            totalHeight = textSize.height;
        } else {
            CGRect newRect = CGRectZero;
            if (previousFrame.origin.x + previousFrame.size.width + textSize.width + LABEL_MARGIN > self.frame.size.width) {
                newRect.origin = CGPointMake(0, previousFrame.origin.y + previousFrame.size.height + BOTTOM_MARGIN);
                totalHeight += textSize.height + BOTTOM_MARGIN;
            } else {
                newRect.origin = CGPointMake(previousFrame.origin.x + previousFrame.size.width + LABEL_MARGIN, previousFrame.origin.y);
            }
            newRect.size = textSize;
            label = [MorePickButton buttonWithType:UIButtonTypeCustom];
            label.frame = newRect;
            
        }
        label.text = newtext;
        label.code = code;
        //        CGSize imageSize =label.frame.size;
        
        //        UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
        //        [[SYUtil colorWithHex:@"aaaaaa"] set];
        //        UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
        //        UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
        //        UIGraphicsEndImageContext();
        //        [label setBackgroundImage:pressedColorImg forState:UIControlStateHighlighted];
        //        //        label.tintColor=[UIColor blackColor];
        //        [label setLineBreakMode:UILineBreakModeWordWrap];
        
        gotPreviousFrame = YES;
        //        label.layer.borderColor = [SYUtil colorWithHex:@"eeeeee"].CGColor;
        //        label.layer.borderWidth  = 1;
        [label setFont:[UIFont systemFontOfSize:FONT_SIZE]];
        
        [label setBackgroundColor:[UIColor whiteColor]];
        
        //        [label.layer setCornerRadius:4];
        CALayer *newLayer = [[CALayer alloc] init];
        CGRect frame = label.layer.frame;
        frame.origin.x = frame.size.width-1;
        frame.origin.y =0;
        frame.size.width = 1;
        newLayer.frame = frame;
        //        label.layer.backgroundColor=[SYUtil colorWithHex:@"dddddd"].CGColor;
        newLayer.backgroundColor = [SYUtil colorWithHex:@"eeeeee"].CGColor;
        [label.layer addSublayer:newLayer];
        
        CALayer *topLayer = [[CALayer alloc] init];
        CGRect frame1 = label.layer.frame;
        frame1.origin.x = 0;
        frame1.origin.y =0;
        frame1.size.height = 1;
        topLayer.frame = frame1;
        //        label.layer.backgroundColor=[SYUtil colorWithHex:@"dddddd"].CGColor;
        topLayer.backgroundColor = [SYUtil colorWithHex:@"eeeeee"].CGColor;
        [label.layer addSublayer:topLayer];
        
        [label setTitle:newtext forState:UIControlStateNormal];
        [label setTitleColor:TEXT_COLOR forState:UIControlStateNormal];
        
        previousFrame = label.frame;
        
        
        UITapGestureRecognizer *tapRcognizer = [[UITapGestureRecognizer alloc] init];
        [tapRcognizer addTarget:self action:@selector(copy:)];
        
        label.userInteractionEnabled=YES;
        [label addGestureRecognizer:tapRcognizer];
        
        [self addSubview:label];
    }
    sizeFit = CGSizeMake(self.frame.size.width, totalHeight + 1.0f);
}
- (BOOL)canBecomeFirstResponder{
    return YES;
}

-(void)copy:(UITapGestureRecognizer *)gr
{
    MorePickButton *button = gr.view;
    [_symbolDelegate pickword:button.text code:button.code];
    [_symbolDelegate dismiss];
}
- (CGSize)fittedSize
{
    return sizeFit;
}

@end

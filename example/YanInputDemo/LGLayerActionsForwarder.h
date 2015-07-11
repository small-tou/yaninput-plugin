#import <Foundation/Foundation.h>

@interface LGLayerActionsForwarder : UIView

- (instancetype) initWithView: (UIView *) view;

@property (nonatomic, readonly) UIView *view;

@end
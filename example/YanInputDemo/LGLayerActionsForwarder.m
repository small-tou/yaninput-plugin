#import "LGLayerActionsForwarder.h"

@implementation LGLayerActionsForwarder
{
    __weak UIView *_view;
}

- (instancetype) initWithView: (UIView *) view
{
    self = [super init];
    if (!self) return nil;
    
    _view = view;
    
    return self;
}

- (id <CAAction>) actionForLayer: (CALayer *) layer forKey: (NSString *) event
{
    return [_view actionForLayer: layer forKey: event];
}

@end
//
//  BRSForceTouchRecognizer.m
//  Alamofire
//
//  Created by Edward Addley on 23/02/2018.
//

#import <UIKit/UIGestureRecognizerSubclass.h>
#import "BRSForceTouchRecognizer.h"

@interface BRSForceTouchRecognizer () {
    CGFloat _force;
    CGFloat _maxForce;
    Boolean _forceTouchAchieved;
}
@end

@implementation BRSForceTouchRecognizer

-(id)initWithTarget:(id)target action:(SEL)action
{
    if ((self = [super initWithTarget:target action:action]))
    {
        [self setCancelsTouchesInView:NO];
        _force = 0.0f;
        _maxForce = 4.0f;
        _forceTouchAchieved = NO;
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];

    [self updateState: UIGestureRecognizerStateBegan withTouches:touches];

}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    [self updateState: UIGestureRecognizerStateChanged withTouches:touches];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];

    [self updateState: UIGestureRecognizerStateEnded withTouches:touches];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];

    [self updateState: UIGestureRecognizerStateCancelled withTouches:touches];
}

- (void)updateState: (UIGestureRecognizerState) state withTouches: (NSSet<UITouch*> *) touches {
    if (touches != nil && touches.count == 0) {
        return;
    }

    UITouch* touch = touches.allObjects[0];

    if (@available(iOS 9.0, *)) {
        _maxForce = MIN(touch.maximumPossibleForce, _maxForce);
        _force = touch.force / _maxForce;

        NSLog(@"Force - %f / %f", _force, _maxForce);
        if (_force > 1.0f) {
            _forceTouchAchieved = YES;
        }
    }

    [self setState: state];
}

- (void)reset {
    [super reset];

    _force = 0.0f;
    _forceTouchAchieved = NO;
}


@end

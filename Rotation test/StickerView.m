//
//  StickerView.m
//  Rotation test
//
//  Created by Emanuel Carnevale on 28/01/14.
//  Copyright (c) 2014 Mikamai. All rights reserved.
//

#import "StickerView.h"

@implementation StickerView
{
  CGFloat _lastRotation;
  CGPoint _anchorPoint;
}

- (id)initWithImage:(UIImage *)image
{
  self = [super initWithImage:image];
  if (self) {
    [self setupRecognizers];
  }
  return self;
}

-(void)setupRecognizers {
  self.userInteractionEnabled = YES;
  UIRotationGestureRecognizer *rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotate:)];
  [self addGestureRecognizer:rotationRecognizer];
}

-(void)rotate:(id)sender {
  
  if([(UIRotationGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
    if ([(UIRotationGestureRecognizer*)sender numberOfTouches] > 1){
      CGPoint firstTouch  = [(UIRotationGestureRecognizer*)sender locationOfTouch:0 inView:self];
      CGPoint secondTouch = [(UIRotationGestureRecognizer*)sender locationOfTouch:1 inView:self];

      self.layer.anchorPoint = CGPointMake(((firstTouch.x + secondTouch.x)/2)/self.bounds.size.width, ((firstTouch.y + secondTouch.y)/2)/self.bounds.size.height);
    }
  }
  
  if([(UIRotationGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
    _anchorPoint  = CGPointMake(0.5f, 0.5f);
    _lastRotation = 0.0;
    return;
  }
  
  CGFloat rotation = 0.0 - (_lastRotation - [(UIRotationGestureRecognizer*)sender rotation]);
  
  CGAffineTransform currentTransform = self.transform;
  CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, rotation);
  
  [self setTransform:newTransform];
  
  _lastRotation = [(UIRotationGestureRecognizer*)sender rotation];
}


@end

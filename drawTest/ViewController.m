//
//  ViewController.m
//  drawTest
//
//  Created by April on 2017/3/28.
//  Copyright © 2017年 April. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *drawView;

@property (strong, nonatomic)CAShapeLayer *bezierLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setDrawViewSkin];
    
    [self drawCircle];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - initail

- (void)setDrawViewSkin {
    _drawView.layer.borderColor = [UIColor grayColor].CGColor;
    _drawView.layer.borderWidth = 1.0;
}


#pragma mark - draw

- (void)drawCircle {
    
    [_bezierLayer removeFromSuperlayer];
    
    _bezierLayer = [CAShapeLayer layer];
    [_bezierLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 50, 100, 100)] CGPath]];
    [_bezierLayer setStrokeColor:[[UIColor redColor] CGColor]];
    [_bezierLayer setLineWidth:5.0];
    [_bezierLayer setFillColor:[[UIColor clearColor] CGColor]];
    [_bezierLayer setLineWidth:2.0];
    
    [_drawView.layer addSublayer:_bezierLayer];
}

- (void)drawLine {
    
    [_bezierLayer removeFromSuperlayer];
    
    CGPoint startPoint = CGPointMake(30, 125);
    CGPoint endPoint = CGPointMake(250, 125);
    CGPoint controlPoint = CGPointMake(140, 50);
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:startPoint];
    [path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    
    _bezierLayer = [CAShapeLayer layer];
    _bezierLayer.path = [path CGPath];
    _bezierLayer.fillColor = [UIColor clearColor].CGColor;
    _bezierLayer.strokeColor = [UIColor blueColor].CGColor;
    _bezierLayer.lineWidth = 2.0;
    
    [_drawView.layer addSublayer:_bezierLayer];
}

#pragma mark - IBAction
- (IBAction)drawLineButtonPressed:(id)sender {
    [self drawLine];
}

- (IBAction)drawCircleButtonPressed:(id)sender {
    [self drawCircle];
}

- (IBAction)animationOneButtonPressed:(id)sender {
    [self animationOne];
}

- (IBAction)animatonTwoButtonPressed:(id)sender {
    [self animationTwo];
}

- (IBAction)animationThreeButtonPressed:(id)sender {
    [self animationThree];
}

- (IBAction)clearAllButtonPressed:(id)sender {
    [_bezierLayer removeAllAnimations];
    [self drawCircle];
}

#pragma mark - animation

- (void)animationOne {
    
    _bezierLayer.lineWidth = 2.0;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = [NSNumber numberWithFloat:0.0];
    animation.toValue = [NSNumber numberWithFloat:1.0];
    animation.duration = 3;

    [_bezierLayer addAnimation:animation forKey:@""];
}

- (void)animationTwo {
    
    _bezierLayer.lineWidth = 2.0;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation.fromValue = [NSNumber numberWithFloat:0.5];
    animation.toValue = [NSNumber numberWithFloat:0];
    animation.duration = 2;
    
    CABasicAnimation *animationT = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animationT.fromValue = [NSNumber numberWithFloat:0.5];
    animationT.toValue = [NSNumber numberWithFloat:1];
    animationT.duration = 2;
    
    [_bezierLayer addAnimation:animation forKey:@""];
    [_bezierLayer addAnimation:animationT forKey:@""];
}

- (void)animationThree {
    
    _bezierLayer.lineWidth = 12.0;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
    animation.fromValue = [NSNumber numberWithFloat:1];
    animation.toValue = [NSNumber numberWithFloat:12];
    animation.duration = 2;
    
    [_bezierLayer addAnimation:animation forKey:@""];
}

@end

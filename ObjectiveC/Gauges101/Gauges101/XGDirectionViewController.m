//
//  XGDirectionViewController.m
//  Gauges101
//
//  Copyright © 2016 GrapeCity. All rights reserved.
//

#import <XuniGaugeKit/XuniGaugeKit.h>
#import "XGDirectionViewController.h"

@interface XGDirectionViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *modeSel;
@property (weak, nonatomic) IBOutlet XuniLinearGauge    *linearGauge;
@property (weak, nonatomic) IBOutlet XuniBulletGraph    *bulletGraph;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *linearWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *linearHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bulletWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bulletHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *gaugesInterspacing;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *linearGaugeTrailing;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bulletGraphLeading;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *linearGaugeBottom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bulletGraphBottom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bulletGraphTop;

@end

@implementation XGDirectionViewController
- (IBAction)modeSelector:(id)sender {
    switch (_modeSel.selectedSegmentIndex) {
    case 0: case 1:
        [self.view removeConstraint:_bulletGraphTop];

        [_linearGauge removeConstraint:_linearWidth];

        [self.view removeConstraint:_linearGaugeBottom];

        [_bulletGraph removeConstraint:_bulletWidth];
        [self.view removeConstraint:_bulletGraphBottom];


        [_linearGauge addConstraint:_linearHeight];

        [self.view addConstraint:_linearGaugeTrailing];

        [self.view addConstraint:_gaugesInterspacing];

        [_bulletGraph addConstraint:_bulletHeight];

        [self.view addConstraint:_bulletGraphLeading];

        break;
    case 2: case 3:
        [_linearGauge removeConstraint:_linearHeight];

        [self.view removeConstraint:_linearGaugeTrailing];
        [self.linearGauge removeConstraint:_linearGaugeTrailing];

        [self.view removeConstraint:_gaugesInterspacing];

        [_bulletGraph removeConstraint:_bulletHeight];

        [self.view removeConstraint:_bulletGraphLeading];
        [self.view addConstraint:_bulletGraphTop];

        [_linearGauge addConstraint:_linearWidth];

        [self.view addConstraint:_linearGaugeBottom];

        [_bulletGraph addConstraint:_bulletWidth];
        [self.view addConstraint:_bulletGraphBottom];

        break;
    }
    switch (_modeSel.selectedSegmentIndex) {
    case 0:
        _linearGauge.direction = _bulletGraph.direction = XuniGaugeDirectionRight;
        break;
    case 1:
        _linearGauge.direction = _bulletGraph.direction = XuniGaugeDirectionLeft;
        break;
    case 2:
        _linearGauge.direction = _bulletGraph.direction = XuniGaugeDirectionDown;
        break;
    case 3:
        _linearGauge.direction = _bulletGraph.direction = XuniGaugeDirectionUp;
        break;
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self modeSelector:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _linearGauge.isReadOnly = _bulletGraph.isReadOnly = false;
    
      _linearGauge.backgroundColor = _bulletGraph.backgroundColor = [UIColor clearColor];
    
    _linearGauge.showText = _bulletGraph.showText = XuniShowTextAll;
    
    _bulletGraph.backgroundColor = _linearGauge.backgroundColor = [UIColor clearColor];
    _bulletGraph.pointerColor = _linearGauge.pointerColor =  [UIColor whiteColor];
    _bulletGraph.faceBorderWidth = _linearGauge.faceBorderWidth =  1;
    _bulletGraph.faceBorderColor = _linearGauge.faceBorderColor = [UIColor whiteColor];
    _linearGauge.faceColor = [UIColor clearColor];
    _bulletGraph.faceColor = [UIColor whiteColor];
    _bulletGraph.valueFontColor = _linearGauge.valueFontColor = [UIColor blueColor];
    _bulletGraph.minFontColor = _linearGauge.minFontColor = [UIColor whiteColor];
    _bulletGraph.maxFontColor = _linearGauge.maxFontColor = [UIColor whiteColor];
    _bulletGraph.valueFont = _linearGauge.valueFont = [UIFont fontWithName:@"Optima" size:19];
    
    _bulletGraph.thickness = 0.6;
    _bulletGraph.min = 0;
    _bulletGraph.max = 100;
    _bulletGraph.bad = 45;
    _bulletGraph.good = 80;
    _bulletGraph.target = 90;
    _bulletGraph.value = 80;
    _bulletGraph.pointer.thickness = 0.5;
    _bulletGraph.loadAnimation.duration = 2;
    _bulletGraph.updateAnimation.duration = 0.5;
    
    _linearGauge.thickness = 0.6;
    _linearGauge.min = 0;
    _linearGauge.max = 100;
    _linearGauge.value = 80;
    _linearGauge.loadAnimation.duration = 2;
    _linearGauge.updateAnimation.duration = 0.5;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
   #pragma mark - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   }
 */

@end

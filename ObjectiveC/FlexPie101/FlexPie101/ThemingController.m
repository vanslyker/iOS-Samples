//
//  ThemingController.m
//  FlexPie101
//
//  Copyright (c) 2015 GrapeCity. All rights reserved.
//

#import "ThemingController.h"
#import "FlexPieKit/FlexPieKit.h"
#import "PieChartData.h"

@interface ThemingController (){
    NSMutableArray *pickerData;
}
@end

@implementation ThemingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIPickerView *pickerView;
    pickerData =[[NSMutableArray alloc] initWithObjects:@"Standard", @"Cocoa", @"Coral", @"Dark", @"HighContrast", @"Light", @"Midnight", @"Minimal", @"Modern", @"Organic", @"Slate", @"Zen", @"Cyborg", @"Superhero", @"Flatly", @"Darkly", @"Cerulean", nil];

    
    pickerView = [[UIPickerView alloc] init];
    pickerView.delegate = self;
    pickerView.showsSelectionIndicator = YES;
    pickerView.hidden = false;
    
    
    FlexPie *pieChart = [[FlexPie alloc] init];
    NSMutableArray *pieData = [PieChartData demoData];
    
    pieChart.binding = @"value";
    pieChart.bindingName = @"name";
    pieChart.itemsSource = pieData;
    pieChart.tooltip.visible = true;

    pieChart.tag = 1;
    pickerView.tag = 2;
    
    [self.view addSubview:pieChart];
    [self.view addSubview:pickerView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    FlexPie *pieChart= (FlexPie*)[self.view viewWithTag:1];
    UIPickerView *pickerView = (UIPickerView*)[self.view viewWithTag:2];
    pieChart.frame = CGRectMake(0, 227, self.view.bounds.size.width, (self.view.bounds.size.height-227));
    pickerView.frame = CGRectMake(self.view.bounds.size.width/4, 65, self.view.bounds.size.width/2, 162);
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [pickerData count];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    FlexPie *chart = (FlexPie*)[self.view viewWithTag:1];
    switch (row) {
        case 0:
            chart.palette = [XuniPalettes standard];
            break;
        case 1:
            chart.palette = [XuniPalettes cocoa];
            break;
        case 2:
            chart.palette = [XuniPalettes coral];
            break;
        case 3:
            chart.palette = [XuniPalettes dark];
            break;
        case 4:
            chart.palette = [XuniPalettes highcontrast];
            break;
        case 5:
            chart.palette = [XuniPalettes light];
            break;
        case 6:
            chart.palette = [XuniPalettes midnight];
            break;
        case 7:
            chart.palette = [XuniPalettes minimal];
            break;
        case 8:
            chart.palette = [XuniPalettes modern];
            break;
        case 9:
            chart.palette = [XuniPalettes organic];
            break;
        case 10:
            chart.palette = [XuniPalettes slate];
            break;
        case 11:
            chart.palette = [XuniPalettes zen];
            break;
        case 12:
            chart.palette = [XuniPalettes cyborg];
            break;
        case 13:
            chart.palette = [XuniPalettes superhero];
            break;
        case 14:
            chart.palette = [XuniPalettes flatly];
            break;
        case 15:
            chart.palette = [XuniPalettes darkly];
            break;
        case 16:
            chart.palette = [XuniPalettes cerulean];
            break;
        default:
            break;
    }
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [pickerData objectAtIndex:row];
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
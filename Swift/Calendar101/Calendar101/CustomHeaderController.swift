//
//  CustomHeaderController.swift
//  Calendar101
//
//  Copyright (c) 2015 GrapeCity. All rights reserved.
//

import UIKit
import XuniCalendarKit

class CustomHeaderController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, XuniCalendarDelegate {

    let viewTypePickerData = [
        "Month View",
        "Year View"]
    
    var _calendar = XuniCalendar(frame: CGRectZero)
    var _dateFormatter = NSDateFormatter()
    var _viewTypePicker = UIPickerView()
    var _dateLabel = UILabel()
    var _todayBtn = UIButton(type: UIButtonType.System)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Custom Header"

        // Do any additional setup after loading the view.
        _viewTypePicker.delegate = self
        _viewTypePicker.showsSelectionIndicator = true
        _viewTypePicker.hidden = false
        
        _dateLabel.text = ""
        
        _todayBtn.setTitle("Today", forState: UIControlState.Normal)
        _todayBtn.addTarget(self, action: "todayBtnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        
        _calendar.delegate = self
        _calendar.showHeader = false
        
        self.view.addSubview(_viewTypePicker)
        self.view.addSubview(_dateLabel)
        self.view.addSubview(_todayBtn)
        self.view.addSubview(_calendar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let size = self.view.bounds.size
        let width = min(size.width, size.height)
        _viewTypePicker.frame = CGRectMake(0, 55, 150, 120)
        _dateLabel.frame = CGRectMake(170, 120, 130, 30)
        _todayBtn.frame = CGRectMake(300, 120, 60, 30)
        _calendar.frame = CGRectMake(0, 55 + 100, width, width - 55 - 120)
    }

    func todayBtnClick(sender: UIButton) {
        _calendar.selectedDate = NSDate(timeIntervalSinceNow: 0)
        _calendar.displayDate = NSDate(timeIntervalSinceNow: 0)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewTypePickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewTypePickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (row == 0) {
            _calendar.viewMode = XuniCalendarViewMode.Month
        }
        else if (row == 1) {
            _calendar.viewMode = XuniCalendarViewMode.Year
        }
    }
    
    func viewModeChanged(sender: XuniCalendar) {
        updateDateLabel()
    }
    
    func displayDateChanged(sender: XuniCalendar) {
        updateDateLabel()
    }
    
    func updateDateLabel() {
        _dateFormatter.dateFormat = (_calendar.viewMode == XuniCalendarViewMode.Month) ? "MMMM yyyy" : "yyyy"
        _dateLabel.text = _dateFormatter.stringFromDate(_calendar.displayDate)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

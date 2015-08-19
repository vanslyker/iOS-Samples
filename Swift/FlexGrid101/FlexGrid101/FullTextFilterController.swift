//
//  FullTextFilterController.swift
//  FlexGrid101
//
//  Copyright (c) 2015 GrapeCity. All rights reserved.
//

import UIKit
import FlexGridKit

class FullTextFilterController: UIViewController, UITextFieldDelegate {

    var _flex = FlexGrid()
    var _filterField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        _filterField.delegate = self
        _filterField.text = "Enter text to Filter"
        _filterField.returnKeyType = UIReturnKeyType.Done
        _filterField.keyboardType = UIKeyboardType.Default
        _filterField.backgroundColor = UIColor.lightGrayColor()

        _flex.isReadOnly = true
        _flex.itemsSource = CustomerData.getCustomerData(100)
        
        self.view.addSubview(_flex)
        self.view.addSubview(_filterField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        _filterField.frame = CGRectMake(0, 65, self.view.bounds.size.width, 50)
        _flex.frame = CGRectMake(0, 115, self.view.bounds.size.width, self.view.bounds.size.height-115)
        _flex.setNeedsDisplay()
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return true
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.selectAll(nil)
    }
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        return true
    }
    func textFieldDidEndEditing(textField: UITextField) {
        var dateFormat = NSDateFormatter()
        dateFormat.setLocalizedDateFormatFromTemplate("M/d/yy")
        _flex.collectionView.filter = {(item : NSObject?) -> Bool in
            var d = item as! CustomerData;
        
            if (String(format: "%.f", d.customerID) == textField.text) {
                return true
            }
            else if (String(format: "%.f", d.countryID) == textField.text) {
                return true
            }
            else if (String(format: "%.f", d.weight) == textField.text) {
                return true
            }
            else if (d.first == textField.text) {
                return true
            }
            else if (d.last == textField.text)
            {
                return true
            }
            else if (d.father == textField.text){
                return true
            }
            else if (d.brother == textField.text){
                return true
            }
            else if (d.cousin == textField.text){
                return true
            }
            else if (dateFormat.stringFromDate(d.hireDate) == textField.text) {
                return true
            }
            else {
                return false
            }
        } as IXuniPredicate;
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
//
//  FiltersViewController.swift
//  WWERapp
//
//  Created by Will Couture on 11/14/21.
//

struct FilterSettings{
    static var priceMin: Double = 0.0
    static var priceMax: Double = 0.0
    static var productType: String = "All"
    static var productTypeIndex: Int = 0
    static var brand: String = "all"
    static var brandIndex: Int = 0
}

import UIKit

class FiltersViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var priceMin: UITextField!
    @IBOutlet weak var priceMax: UITextField!
    
    @IBOutlet weak var brandControl: UISegmentedControl!
    @IBOutlet weak var typePicker: UIPickerView!

    
    var typeData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        FilterSettings.priceMin = defaults.double(forKey: "priceMin")
        FilterSettings.priceMax = defaults.double(forKey: "priceMax")
        FilterSettings.productType = defaults.string(forKey: "productType") ?? "All"
        FilterSettings.productTypeIndex = defaults.integer(forKey: "productTypeIndex")
        FilterSettings.brand = defaults.string(forKey: "brand") ?? "All"
        FilterSettings.brandIndex = defaults.integer(forKey: "brandIndex")

        typePicker.delegate = self
        typePicker.dataSource = self
        
        typeData = ["All", "Console", "Games", "Accessories"]
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        typePicker.selectRow(FilterSettings.productTypeIndex, inComponent: 0, animated: true)
        brandControl.selectedSegmentIndex = FilterSettings.brandIndex
        priceMin.text = String(format: "%.2f", FilterSettings.priceMin)
        priceMax.text = String(format: "%.2f", FilterSettings.priceMax)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        FilterSettings.priceMin = Double(priceMin.text!)!
        FilterSettings.priceMax = Double(priceMax.text!)!
        
        FilterSettings.productTypeIndex = typePicker.selectedRow(inComponent: 0)
        FilterSettings.productType = typeData[FilterSettings.productTypeIndex]
        
        FilterSettings.brandIndex = brandControl.selectedSegmentIndex
        FilterSettings.brand = brandControl.titleForSegment(at: FilterSettings.brandIndex)!
        
        let defaults = UserDefaults.standard
        defaults.set(FilterSettings.priceMin, forKey: "priceMin")
        defaults.set(FilterSettings.priceMax, forKey: "priceMax")
        defaults.set(FilterSettings.productType, forKey: "productType")
        defaults.set(FilterSettings.productTypeIndex, forKey: "productTypeIndex")
        defaults.set(FilterSettings.brand, forKey: "brand")
        defaults.set(FilterSettings.brandIndex, forKey: "brandIndex")
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return typeData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return typeData[row]
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

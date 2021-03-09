//
//  ViewController.swift
//  Test1
//
//  Created by user192101 on 3/8/21.
//

import UIKit

class ViewController: UIViewController {
    // Education level Radio buttons
    @IBOutlet weak var highSchoolRad: UIButton!
    @IBOutlet weak var diplomaRad: UIButton!
    @IBOutlet weak var bachelorRad: UIButton!
    @IBOutlet weak var educationAmountLbl: UILabel!
    //Status
    @IBOutlet weak var singleRad: UIButton!
    @IBOutlet weak var notSingleRad: UIButton!
    //Kids
    @IBOutlet weak var childSwi: UISwitch!
    @IBOutlet weak var childQtyStp: UIStepper!
    @IBOutlet weak var childQtyLbl: UILabel!
    @IBOutlet weak var kidsAmountLbl: UILabel!
    //Programming Knowledge
    @IBOutlet weak var swiftChk: UIButton!
    @IBOutlet weak var pythonChk: UIButton!
    @IBOutlet weak var rChk: UIButton!
    @IBOutlet weak var jsChk: UIButton!
    @IBOutlet weak var javaChk: UIButton!
    @IBOutlet weak var csChk: UIButton!
    @IBOutlet weak var phpChk: UIButton!
    @IBOutlet weak var programmingAmountLbl: UILabel!
    //Experience
    @IBOutlet weak var experienceYearsSld: UISlider!
    @IBOutlet weak var experienceAmountLbl: UILabel!
    @IBOutlet weak var experienceYearsLbl: UILabel!
    //Total
    @IBOutlet weak var totalSalaryLbl: UILabel!
    
    var educationAmount = 0.0
    var kidsAmount = 0.0
    var programmingAmount = 0.0
    var experienceAmount = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateEducationAmount()
        calculateChildrenAmount()
        calculateProgrammingAmount()
        calculateExperienceAmount()
        // Do any additional setup after loading the view.
    }


    func calculateEducationAmount(){
        if highSchoolRad.isSelected {
            educationAmount = 40000.0
        }else if diplomaRad.isSelected {
            educationAmount = 47000.0
        }else{
            educationAmount = 55000.0
        }
        educationAmountLbl.text = "+ $ " + String(format: "%.2f", educationAmount)
        calculateTotalSalary()

    }
    @IBAction func educationChange(_ sender: UIButton) {
        highSchoolRad.isSelected = false
        diplomaRad.isSelected = false
        bachelorRad.isSelected = false
        sender.isSelected = true
        calculateEducationAmount()
    }

    
    @IBAction func statusChange(_ sender: UIButton) {
        singleRad.isSelected = false
        notSingleRad.isSelected = false
        sender.isSelected = true
    }

    
    func calculateChildrenAmount(){
        kidsAmount =  Double(childQtyStp.value) * 7000
        kidsAmountLbl.text = "+ $ " + String(format: "%.2f", kidsAmount)
        calculateTotalSalary()
    }
    @IBAction func childrenSwitchChange(_ sender: UISwitch) {
        if sender.isOn {
            
            childQtyStp.minimumValue = 1
            childQtyStp.value = 1
            childQtyStp.isEnabled = true
            childQtyLbl.text = "1"
        }else{
            childQtyStp.minimumValue = 0
            childQtyStp.value = 0
            childQtyStp.isEnabled = false
            childQtyLbl.text = "0"
        }
        calculateChildrenAmount()
    }    
    @IBAction func childQtyStepChange(_ sender: UIStepper) {
        childQtyLbl.text = String(Int(sender.value))
        calculateChildrenAmount()
    }
    

    func calculateProgrammingAmount(){
        programmingAmount = 0.0
        if(swiftChk.isSelected || pythonChk.isSelected || rChk.isSelected){
            programmingAmount += 5000.0
        }
        if(jsChk.isSelected || javaChk.isSelected || csChk.isSelected){
            programmingAmount += 3000.0          
        }
        programmingAmountLbl.text = "+ $ " + String(format: "%.2f", programmingAmount)
        calculateTotalSalary()
    }
    @IBAction func programmingChkBoxChange(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        calculateProgrammingAmount()
    }
    	
    func calculateExperienceAmount(){
        experienceAmount = 0.0
        if(Int(experienceYearsSld.value) > 3){
            experienceAmount += 10000.0
        }
        experienceAmountLbl.text = "+ $ " + String(format: "%.2f", experienceAmount)
        calculateTotalSalary()
    }
    @IBAction func experienceSliderChange(_ sender: UISlider) {
        experienceYearsLbl.text = String(Int(sender.value)) + " year(s)"
        calculateExperienceAmount()
    }
    
    func calculateTotalSalary(){
        let totalSalary = educationAmount + kidsAmount + programmingAmount + experienceAmount
        totalSalaryLbl.text =  "$ " + String(format: "%.2f", totalSalary)
    }
    	

}


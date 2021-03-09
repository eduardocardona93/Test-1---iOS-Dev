//
//  ViewController.swift
//  Test1
//
//  Created by user192101 on 3/8/21.
//

import UIKit

class ViewController: UIViewController {
    //************************************************** OUTLETS DEFINITION *************************************/
    // ----------------------- Education level Outlets -------------------------------
    @IBOutlet weak var highSchoolRad: UIButton! // high school Radio Button
    @IBOutlet weak var diplomaRad: UIButton! // diploma Radio Button
    @IBOutlet weak var bachelorRad: UIButton! // high school Radio Button
    @IBOutlet weak var educationAmountLbl: UILabel! // education salary amount label
    // ----------------------- Status -------------------------------
    @IBOutlet weak var singleRad: UIButton! // single Radio Button
    @IBOutlet weak var notSingleRad: UIButton! // not single Radio Button
    // ----------------------- Kids -------------------------------
    @IBOutlet weak var childSwi: UISwitch! // child switch
    @IBOutlet weak var childQtyStp: UIStepper! // child quantity stepper
    @IBOutlet weak var childQtyLbl: UILabel! // child quantity labek
    @IBOutlet weak var kidsAmountLbl: UILabel! // kids salary amount label
    // ----------------------- Programming Knowledge -------------------------------
    @IBOutlet weak var swiftChk: UIButton! // swift language knowledge button
    @IBOutlet weak var pythonChk: UIButton! // python language knowledge button
    @IBOutlet weak var rChk: UIButton! // R language knowledge button
    @IBOutlet weak var jsChk: UIButton! // javascript language knowledge button
    @IBOutlet weak var javaChk: UIButton! // java language knowledge button
    @IBOutlet weak var csChk: UIButton! // c# language knowledge button
    @IBOutlet weak var phpChk: UIButton! // php language knowledge button
    @IBOutlet weak var programmingAmountLbl: UILabel! // Programming Knowledge salary amount label
    // ----------------------- Work Experience -------------------------------
    @IBOutlet weak var experienceYearsSld: UISlider! // Experience years slider
    @IBOutlet weak var experienceYearsLbl: UILabel! // Experience years label
    @IBOutlet weak var experienceAmountLbl: UILabel! // Work Experience salary amount label
    // ----------------------- Total -------------------------------
    @IBOutlet weak var totalSalaryLbl: UILabel! // total salary amount label
    
    //************************************************** VARIABLES DEFINITION *************************************/
    var educationAmount = 0.0 // education salary amount label
    var kidsAmount = 0.0 // kids salary amount label
    var programmingAmount = 0.0 // Programming Knowledge salary amount
    var experienceAmount = 0.0 // Work Experience salary amount
    

    //************************************************** INIT FUNCTION *************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        initialAppValues()
        // Do any additional setup after loading the view.
    }

    //************************************************** EDUCATION AMOUNT FUNCTIONS *************************************/
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
        //sender is the pressed button
        highSchoolRad.isSelected = false
        diplomaRad.isSelected = false
        bachelorRad.isSelected = false
        
        sender.isSelected = true
        calculateEducationAmount()
    }

    //************************************************** EDUCATION AMOUNT FUNCTIONS *************************************/
    @IBAction func statusChange(_ sender: UIButton) {
        singleRad.isSelected = false
        notSingleRad.isSelected = false
        sender.isSelected = true
    }

    //************************************************** EDUCATION AMOUNT FUNCTIONS *************************************/
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
    
    //************************************************** EDUCATION AMOUNT FUNCTIONS *************************************/
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
    //************************************************** EDUCATION AMOUNT FUNCTIONS *************************************/
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
    //************************************************** TOTAL SALARY AMOUNT FUNCTIONS *************************************/
    func calculateTotalSalary(){
        let totalSalary = educationAmount + kidsAmount + programmingAmount + experienceAmount
        totalSalaryLbl.text =  "$ " + String(format: "%.2f", totalSalary)
    }
    	
    func initialAppValues(){
        // default education level: High school
        highSchoolRad.isSelected = true
        diplomaRad.isSelected = false
        bachelorRad.isSelected = false
        // default status: status
        singleRad.isSelected = true
        notSingleRad.isSelected = false
        // default kids
        childSwi.isOn = false
        childQtyStp.minimumValue = 0
        childQtyStp.value = 0
        childQtyStp.isEnabled = false
        childQtyLbl.text = "0"
        // default programming
        swiftChk.isSelected = false
        pythonChk.isSelected = false
        rChk.isSelected = false
        jsChk.isSelected = false
        javaChk.isSelected = false
        csChk.isSelected = false
        phpChk.isSelected = false
        // default 
        experienceYearsSld.value = 0
        experienceYearsLbl.text = "0 year(s)"
        calculateEducationAmount()
        calculateChildrenAmount()
        calculateProgrammingAmount()
        calculateExperienceAmount()
    }

    @IBAction func resetApp(_ sender: Any) {
        initialAppValues()
    }
    
}


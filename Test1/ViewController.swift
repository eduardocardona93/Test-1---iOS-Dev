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
    // ----------------------- view did load -------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        initialAppValues() // call initial values function
        // Do any additional setup after loading the view.
    }

    //************************************************** EDUCATION LEVEL SECTION FUNCTIONS *************************************/
    // ------------------- Calculate Education Amount -------------------------
    func calculateEducationAmount(){
        if highSchoolRad.isSelected { // if high school selected
            educationAmount = 40000.0
        }else if diplomaRad.isSelected { // if diploma selected
            educationAmount = 47000.0
        }else{ // if bachelor selected
            educationAmount = 55000.0
        }
        // shows the formatted amount of education section
        educationAmountLbl.text = "+ $ " + String(format: "%.2f", educationAmount)
        
        // calculates the total salary
        calculateTotalSalary()
    }
    // ----------------------- education level change -------------------------------
    @IBAction func educationChange(_ sender: UIButton) {
        // NOTE: sender is the pressed button

        // Sets all the buttons as unselected
        highSchoolRad.isSelected = false 
        diplomaRad.isSelected = false
        bachelorRad.isSelected = false
        // Set the pressed button as Selected
        sender.isSelected = true
        // does the calculations for the education section
        calculateEducationAmount()
    }

    //************************************************** STATUS SECTION FUNCTIONS *************************************/
    // ----------------------- status change -------------------------------
    @IBAction func statusChange(_ sender: UIButton) {
        // NOTE: sender is the pressed button

        // Sets all the buttons as unselected
        singleRad.isSelected = false
        notSingleRad.isSelected = false
        // Set the pressed button as Selected
        sender.isSelected = true
    }

    //************************************************** EDUCATION SECTION FUNCTIONS *************************************/
    // -----------------------  Calculate Kids Amount -------------------------------
    func calculateChildrenAmount(){
        // sets 7k for each kid
        kidsAmount =  Double(childQtyStp.value) * 7000.0
        // shows the formatted amount of kids section
        kidsAmountLbl.text = "+ $ " + String(format: "%.2f", kidsAmount)
        // calculates the total salary
        calculateTotalSalary()
    }
    // ----------------------- children switch change -------------------------------
    @IBAction func childrenSwitchChange(_ sender: UISwitch) {
        // validates if the children switch is on
        if sender.isOn { 
            childQtyStp.minimumValue = 1 // sets the child quantity stepper minimum value as 1
            childQtyStp.value = 1 // sets the child quantity stepper value as 1
            childQtyStp.isEnabled = true // enables the child quantity stepper
            childQtyLbl.text = "1" // sets the child quantity label value as 1
        }else{
            childQtyStp.minimumValue = 0 // sets the child quantity stepper minimum value as 0
            childQtyStp.value = 0 // sets the child quantity stepper value as 0
            childQtyStp.isEnabled = false // disables the child quantity stepper
            childQtyLbl.text = "0" // sets the child quantity label value as 0
        }
        // does the calculations for the kids section
        calculateChildrenAmount()
    }    

    // ----------------------- children quantity stepper change -------------------------------
    @IBAction func childQtyStepChange(_ sender: UIStepper) {
        // NOTE: sender is the stepper

        // sets the child quantity label value from the stepper
        childQtyLbl.text = String(Int(sender.value))
        // does the calculations for the kids section
        calculateChildrenAmount()
    }
    
    //************************************************** PROGRAMMING SECTION FUNCTIONS *************************************/
    // ----------------------- Calculate programming amount -------------------------------
    func calculateProgrammingAmount(){
	    programmingAmount = 0.0 
        // if swift, python or R are selected
        if(swiftChk.isSelected || pythonChk.isSelected || rChk.isSelected){ 
            programmingAmount += 5000.0 // adds 5k to the amount
        }
        // if javascript, java or c# are selected
        if(jsChk.isSelected || javaChk.isSelected || csChk.isSelected){
            programmingAmount += 3000.0 // adds 3k to the amount         
        }
        // shows the formatted amount of programming section
        programmingAmountLbl.text = "+ $ " + String(format: "%.2f", programmingAmount)
        // calculates the total salary
        calculateTotalSalary()
    }
    // ----------------------- programming checkbox change -------------------------------
    @IBAction func programmingChkBoxChange(_ sender: UIButton) {
        // NOTE: sender is the pressed checkbox
        sender.isSelected = !sender.isSelected
        // does the calculations for the programming section
        calculateProgrammingAmount()
    }
    //************************************************** WORK EXPERIENCE SECTION FUNCTIONS *************************************/
    // ----------------------- Calculate experience amount -------------------------------
    func calculateExperienceAmount(){
        experienceAmount = 0.0
        // if the experience value is more than 3
        if(Int(experienceYearsSld.value) > 3){
            experienceAmount += 10000.0 // add 10 to the amount
        }
        // shows the formatted amount of work experience section
        experienceAmountLbl.text = "+ $ " + String(format: "%.2f", experienceAmount)
        // calculates the total salary
        calculateTotalSalary()
    }
    // ----------------------- experience slider change -------------------------------
    @IBAction func experienceSliderChange(_ sender: UISlider) {
        // NOTE: sender is the slider

        // sets the experience label value from the slider
        experienceYearsLbl.text = String(Int(sender.value)) + " year(s)"
        // does the calculations for the work experience section
        calculateExperienceAmount()
    }
    //************************************************** TOTAL SALARY AMOUNT FUNCTIONS *************************************/
    // ----------------------- calculate total salary -------------------------------
    func calculateTotalSalary(){
        // gets all the amounts from the sections
        let totalSalary = educationAmount + kidsAmount + programmingAmount + experienceAmount
        // shows the formatted total salary
        totalSalaryLbl.text =  "$ " + String(format: "%.2f", totalSalary)
    }
    //************************************************** CLEAR VALUES FUNCTIONS *************************************/ 
    // ----------------------- intial values app -------------------------------
    func initialAppValues(){
        // default education level: High school
        highSchoolRad.isSelected = true
        diplomaRad.isSelected = false
        bachelorRad.isSelected = false
        // default status: status
        singleRad.isSelected = true
        notSingleRad.isSelected = false
        // default kids: 0 childs
        childSwi.isOn = false
        childQtyStp.minimumValue = 0
        childQtyStp.value = 0
        childQtyStp.isEnabled = false
        childQtyLbl.text = "0"
        // default programming: none
        swiftChk.isSelected = false
        pythonChk.isSelected = false
        rChk.isSelected = false
        jsChk.isSelected = false
        javaChk.isSelected = false
        csChk.isSelected = false
        phpChk.isSelected = false
        // default Experience: 0 years
        experienceYearsSld.value = 0
        experienceYearsLbl.text = "0 year(s)"
        // does the calculations for all the sections
        calculateEducationAmount()
        calculateChildrenAmount()
        calculateProgrammingAmount()
        calculateExperienceAmount()
    }
    // ----------------------- reset app -------------------------------
    @IBAction func resetApp(_ sender: Any) {
        // call initial values function
        initialAppValues()
    }
    
}


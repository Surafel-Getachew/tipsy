
import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextFeild: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twenyPctButton: UIButton!
    
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var billSplitCalculator = BillSplitCalculator();
    
    var tip = 0.10;
    var splitNumber = 2;
    var totalBill = ""
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextFeild.endEditing(true);
        
        let buttonLabel = sender.currentTitle!
        
        zeroPctButton.isSelected = false;
        tenPctButton.isSelected = false;
        twenyPctButton.isSelected = false;
        
        let buttonTitleMinusPercentage = String(buttonLabel.dropLast())
        let buttionTitleAsNumber = Double(buttonTitleMinusPercentage);
        tip = buttionTitleAsNumber!/100;
        
        
        if (buttonLabel == "0%") {
            zeroPctButton.isSelected = true;
        } else if (buttonLabel == "10%") {
            tenPctButton.isSelected = true;
        } else if (buttonLabel == "20%"){
            twenyPctButton.isSelected = true;
        }
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
        splitNumber = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        totalBill = billTextFeild.text!;
        
        billSplitCalculator.calculateSplitBill(totalBill: totalBill, tip: Float(tip), numberOfPeople: splitNumber)
        
        performSegue(withIdentifier: "goToResult", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.eachPersonBill = billSplitCalculator.getTotalPerPerson();
            destinationVC.numberOfPeople = billSplitCalculator.getTotalNumberOfPeople();
            destinationVC.tipAmount = billSplitCalculator.getTip()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


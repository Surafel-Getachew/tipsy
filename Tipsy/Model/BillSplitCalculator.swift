
import Foundation

struct BillSplitCalculator {
    var billSplit:BillSplit?
    
    mutating func calculateSplitBill (totalBill:String,tip:Float,numberOfPeople:Int) {
        
        let tipAmount =  (Float(totalBill) ?? 0.0) * Float(tip);
        
        let eachPersonBill = ((Float(totalBill) ?? 0.0) + Float(tipAmount))/Float(numberOfPeople)
        
        billSplit = BillSplit(tip:tip,numberOfPeople: numberOfPeople,totalPerPerson: eachPersonBill);
        
    }
    
    func getTip() -> String {
        return String(billSplit!.tip * 100)
    }
    
    func getTotalNumberOfPeople () -> String {
        return  String(billSplit!.numberOfPeople);
    }
    
    func getTotalPerPerson () -> String {
        return String(billSplit!.totalPerPerson)
    }
    
}

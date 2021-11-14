
import UIKit

class ViewController: UIViewController {

 
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func findDay(_ sender: UIButton) {
        
        guard let day = Int(dateTF.text ?? ""),
              let month = Int(monthTF.text ?? ""),
              let year = Int(yearTF.text ?? "")
        else { return  print("Inter number") }
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        
        let dateFormatter = DateFormatter()
        //dateFormatter.locale = Locale(identifier: "ru_Ru")
        dateFormatter.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dateComponents) else {
            return  print("Inter number")
        }

        let weekDay = dateFormatter.string(from: date)
        let capitalizedWeekday = weekDay.capitalized
        
        if day > 31 || month > 12 {
            resultLabel.text = "Incorrect data entered"
        } else {
            resultLabel.text = capitalizedWeekday
        }
            
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}


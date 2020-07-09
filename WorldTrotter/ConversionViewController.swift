

import UIKit

class ConversionViewController: UIViewController{
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func fahrenheitFieldEditingChanged(_ sender: Any) {
        if let text = textField.text, let value = Double(text){
            fahrenheitValue = value
        }else{
            fahrenheitValue = nil
        }
    }
    
    var fahrenheitValue: Double?{
        didSet{
            updateCelsiusLabel()
        }
    }

    var celsiusValue: Double?{
        if let value = fahrenheitValue{
            return (value - 32) * (5/9)
        }else{
            return nil
        }
    }

    func updateCelsiusLabel(){
        if let value = celsiusValue{
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: value))
        }else{
            celsiusLabel.text = "???"
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
}


import UIKit

class AddVectorScreen: UIViewController {
    
    private var addButton = UIButton()
    var coordinatesArray: [CGFloat] = [50, 50, 150, 150]
    @IBOutlet weak var firstPointX: UITextField!
    @IBOutlet weak var firstPointY: UITextField!
    @IBOutlet weak var secondPointX: UITextField!
    @IBOutlet weak var secondPointY: UITextField!
    @IBOutlet weak var addVectorButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.tintColor = .systemPink
        title = "ADD VECTOR"
        
        setupTextFields(field: firstPointX)
        setupTextFields(field: firstPointY)
        setupTextFields(field: secondPointX)
        setupTextFields(field: secondPointY)
    }
    
    @IBAction func onAddVectorButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        VectorManager.shared.addPointArray(addingArray: coordinatesArray)
    }
    
    private func setupTextFields(field: UITextField) {
        field.returnKeyType = .done
        field.autocorrectionType = .no
        field.delegate = self
    }
}

extension AddVectorScreen: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        let point = CGFloat(Int(textField.text!)!)
        
        if textField == firstPointX {
            coordinatesArray[0] = (view.bounds.width / 2) + point
        } else if textField == firstPointY {
            coordinatesArray[1] = (view.bounds.height / 2) + point
        } else if textField == secondPointX {
            coordinatesArray[2] = (view.bounds.width / 2) + point
        } else {
            coordinatesArray[3] = (view.bounds.height / 2) + point
        }
        
        return true
    }
}

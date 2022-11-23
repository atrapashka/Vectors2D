
import UIKit

class AddVectorScreen: UIViewController {
    
    private var addButton = UIButton()
    var coordinatesArray: [CGFloat] = [0, 0, 0, 0]
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
        
    }
    
    private func setupTextFields(field: UITextField) {
        field.returnKeyType = .done
        field.autocorrectionType = .no
//        field.becomeFirstResponder()
        
        field.delegate = self
    }
}

extension AddVectorScreen: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        let point = Int(textField.text!)!
        
        if textField == firstPointX {
            VectorManager.shared.addPointX(point: point)
        } else if textField == firstPointY {
            VectorManager.shared.addPointY(point: point)
        } else if textField == secondPointX {
            VectorManager.shared.addSecondPointX(point: point)
        } else {
            VectorManager.shared.addSecondPointY(point: point)
        }
        
        return true
    }
}

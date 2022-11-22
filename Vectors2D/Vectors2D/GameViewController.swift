
import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
//    let path = UIBezierPath()
    private var addVectorButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: view.frame.size)
            let skView = view as! SKView
            skView.presentScene(scene)
        
        scene.size = CGSize(width: view.bounds.width * 2,
                            height: view.bounds.height * 2)
//        scene.backgroundColor = .systemYellow
        
        setupUI()
        drawVectors()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemGray4
        
        var addVectorButtonWidth: CGFloat = view.bounds.width / 3
        var addVectorButtonHeight = addVectorButtonWidth / 3
        
        addVectorButton.frame = CGRect(x: view.bounds.midX - addVectorButtonWidth / 2,
                                       y: view.bounds.maxY - addVectorButtonHeight * 2,
                                       width: addVectorButtonWidth,
                                       height: addVectorButtonHeight)
        addVectorButton.backgroundColor = .systemPink
        addVectorButton.layer.cornerRadius = addVectorButtonHeight / 2
        addVectorButton.alpha = 0.8
        
        addVectorButton.setTitle("+", for: .normal)
        addVectorButton.titleLabel?.textAlignment = .center
        addVectorButton.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        
        addVectorButton.addTarget(self, action: #selector(onAddVectorButton), for: .touchUpInside)
        
        
        view.addSubview(addVectorButton)
    }
    
    private func drawVectors() {
//        path.move(to: CGPoint(x: -200, y: 0))
//        path.addCurve(to: CGPoint(x: 0, y: 0), controlPoint1: CGPoint(x: 0, y: 0), controlPoint2: CGPoint(x: -200, y: 0))
//        path.addCurve(to: CGPoint(x: 140, y: 0), controlPoint1: CGPoint(x: 60, y: 180), controlPoint2: CGPoint(x: 140, y: 10))
//        path.addCurve(to: CGPoint(x: 280, y: 0), controlPoint1: CGPoint(x: 220, y: -180), controlPoint2: CGPoint(x: 280, y: 0))
//        path.addCurve(to: CGPoint(x: 440, y: 0), controlPoint1: CGPoint(x: 400, y: -300), controlPoint2: CGPoint(x: 440, y: 0))

    }
    
    @objc func onAddVectorButton() {
        
    }
}

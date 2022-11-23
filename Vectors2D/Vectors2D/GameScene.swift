
import SpriteKit

class GameScene: SKScene {
    
    let label = SKLabelNode(text: "BEBRA")
    
    let panRec = UIPanGestureRecognizer()
    var previousPan: CGPoint = CGPoint.zero
    let cameraNode = SKCameraNode()
    
//    add some geometric figure as main scene and do all work with it, like dragging with PanGestures
//    start and end point of vector - it's a start/end of UIBezierPath line points and on this points we should create a Buttons or Figures that can be avaliable for interaction
//    so with PanGesture location we can change start/end points and reDraw a lines of BezierPath
//    transiting between screen will do in UIKiut i think
    
    override func didMove(to view: SKView) {
        
        label.position = CGPoint(x: view.frame.width / 2,
                                 y: view.frame.height / 2)
        label.fontSize = 45
        label.fontColor = SKColor.yellow
        label.fontName = "Avenir"
        addChild(label)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: view.bounds.width, y: view.bounds.height))
//        path.addLine(to: CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2))
        path.addLine(to: CGPoint(x: 100, y: 100))

        let shapeNode = SKShapeNode(path: path.cgPath)
        shapeNode.strokeColor = UIColor.white
        shapeNode.lineWidth = CGFloat(10)
        addChild(shapeNode)
        
        panRec.addTarget(self, action: #selector(onPanGesture))
        panRec.minimumNumberOfTouches = 1
        view.addGestureRecognizer(panRec)
        
        
        
        cameraNode.position = CGPoint(x: scene!.size.width,
                                      y: scene!.size.height)
            
        scene!.addChild(cameraNode)
        scene!.camera = cameraNode
    }
                         
    @objc func onPanGesture(gesture: UIPanGestureRecognizer) {
        var touchLocation: CGPoint = gesture.location(in: self.view)

        if (gesture.state == .changed) {
            if (previousPan != CGPoint.zero) {
                var panXDiff = touchLocation.x - previousPan.x
                var panYDiff = touchLocation.y - previousPan.y
                cameraNode.position = CGPoint( x: cameraNode.position.x - panXDiff,
                                               y: cameraNode.position.y + panYDiff)
            }
            previousPan = touchLocation
        } else  if (gesture.state == .ended ) {
            previousPan = CGPoint.zero
        }
    }
}


import SpriteKit

class GameScene: SKScene {
    
    let label = SKLabelNode(text: "BEBRA")
    let panGesture = UIPanGestureRecognizer()
    var previousPan: CGPoint = CGPoint.zero
    let cameraNode = SKCameraNode()
    
    override func didMove(to view: SKView) {
        
        label.position = CGPoint(x: view.frame.width / 2,
                                 y: view.frame.height / 2)
        label.fontSize = 45
        label.fontColor = SKColor.yellow
        label.fontName = "Avenir"
        addChild(label)
        
        panGesture.addTarget(self, action: #selector(onPanGesture))
        panGesture.minimumNumberOfTouches = 1
        view.addGestureRecognizer(panGesture)
        
        
        
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

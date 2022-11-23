
import Foundation
import UIKit

class VectorManager {
    static let shared = VectorManager()
    
    var pointsArray: [Int] = [0, 0, 0, 0]
    
    func addPointX(point: Int) {
        pointsArray[0] = point
    }
    
    func addPointY(point: Int) {
        pointsArray[1] = point
    }
    
    func addSecondPointX(point: Int) {
        pointsArray[2] = point
    }
    
    func addSecondPointY(point: Int) {
        pointsArray[3] = point
    }
}

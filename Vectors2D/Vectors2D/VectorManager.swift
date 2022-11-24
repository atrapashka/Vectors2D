
import Foundation
import UIKit

class VectorManager {
    static let shared = VectorManager()
    
    var pointsArray: [[CGFloat]] = [[0, 0, 0, 0]]
    
    func addPointArray(addingArray: [CGFloat]) {
        pointsArray.remove(at: 0)
        pointsArray.append(addingArray)
    }
}

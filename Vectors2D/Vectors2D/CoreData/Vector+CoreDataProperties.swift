
import Foundation
import CoreData


extension Vector {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vector> {
        return NSFetchRequest<Vector>(entityName: "Vector")
    }

    @NSManaged public var x1: Int64
    @NSManaged public var y1: Int64
    @NSManaged public var x2: Int64
    @NSManaged public var y2: Int64

}

extension Vector : Identifiable {

}

import Foundation

class Name: CustomStringConvertible, Comparable {
    
    let name: String
    var date: Date
    var description: String { return name }
    
    init(name: String, date: Date = Date()) {
        self.name = name
        self.date = date
    }
    
    static func ==(lhs: Name, rhs: Name) -> Bool {
        return lhs.name == rhs.name
    }
    
    static func <(lhs: Name, rhs: Name) -> Bool {
        return lhs.name < rhs.name
    }
    
}

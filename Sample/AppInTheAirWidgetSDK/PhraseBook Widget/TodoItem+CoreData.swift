import Foundation
import CoreData

extension TodoItem {
    
    class func cd_allItems() -> [TodoItem] {
        let request = NSFetchRequest(entityName: "TodoItem")
        
        var items = [TodoItem]()
        do {
            if let results = try CoreDataHelper.instance.mainContext.executeFetchRequest(request) as? [TodoItem] {
                items = results
            }
        } catch let error as NSError {
            print("fetch error \(error)")
        }
        
        return items
    }
    
}

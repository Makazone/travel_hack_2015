import Foundation
import CoreData

class TodoItem: NSManagedObject {
    
    @NSManaged var text: String!
    @NSManaged var checked: Bool
    
    class var entity: NSEntityDescription {
        return NSEntityDescription.entityForName("TodoItem", inManagedObjectContext: CoreDataHelper.instance.mainContext)!
    }
    
    convenience init(text: String) {
        self.init(entity: TodoItem.entity, insertIntoManagedObjectContext: CoreDataHelper.instance.mainContext)
        
        self.text = text
    }

    class func sampleItems() -> [TodoItem] {
        return [
            NSLocalizedString("Order foreign currency", comment: "Todo item"),
            NSLocalizedString("Book travel insurance", comment: "Todo item"),
            NSLocalizedString("Check visa", comment: "Todo item"),
            NSLocalizedString("Book airport transfer service", comment: "Todo item"),
            NSLocalizedString("Get visa well in advance", comment: "Todo item"),
            NSLocalizedString("Check expiry date on Credit / Debit cards", comment: "Todo item"),
            NSLocalizedString("Make sure your mobile phone is activated for use abroad", comment: "Todo item"),
            NSLocalizedString("Check roaming settings on your mobile phone", comment: "Todo item"),
            NSLocalizedString("Top up your phone card", comment: "Todo item"),
            NSLocalizedString("Book a hotel", comment: "Todo item"),
            NSLocalizedString("Charge batteries", comment: "Todo item"),
            NSLocalizedString("Cancel your papers and milk", comment: "Todo item"),
            NSLocalizedString("Check you have enough prescription medication", comment: "Todo item"),
            NSLocalizedString("Don't forget to get a tax refund", comment: "Todo item"),
            NSLocalizedString("Foreign Plug Adaptors", comment: "Todo item"),
            NSLocalizedString("Shaving Cream / Balm", comment: "Todo item"),
            NSLocalizedString("Toothbrush", comment: "Todo item"),
            NSLocalizedString("Nail File", comment: "Todo item"),
            NSLocalizedString("Moisturiser", comment: "Todo item"),
            NSLocalizedString("Aftershave", comment: "Todo item"),
            NSLocalizedString("Razor", comment: "Todo item"),
            NSLocalizedString("Dental Floss", comment: "Todo item"),
            NSLocalizedString("Toothpaste", comment: "Todo item"),
            NSLocalizedString("Deodorant / Anti-perspirant", comment: "Todo item"),
            NSLocalizedString("Wax/Gel/Hairspray", comment: "Todo item"),
            NSLocalizedString("Comb or Hairbrush", comment: "Todo item"),
            NSLocalizedString("Shampoo", comment: "Todo item"),
            NSLocalizedString("Soap", comment: "Todo item"),
            NSLocalizedString("Watch", comment: "Todo item"),
            NSLocalizedString("Socks", comment: "Todo item"),
            NSLocalizedString("Trousers", comment: "Todo item"),
            NSLocalizedString("Insurance Documents", comment: "Todo item"),
            NSLocalizedString("Photocopies of passport and insurance policy", comment: "Todo item"),
            NSLocalizedString("Mobile Phone Charger", comment: "Todo item"),
            NSLocalizedString("Business Cards", comment: "Todo item"),
            NSLocalizedString("First Aid Kit", comment: "Todo item"),
            NSLocalizedString("Tissues", comment: "Todo item"),
            NSLocalizedString("Imodium", comment: "Todo item"),
            NSLocalizedString("Painkillers", comment: "Todo item"),
            NSLocalizedString("Sunglasses", comment: "Todo item")
        ].map { TodoItem(text: $0) }
    }
}

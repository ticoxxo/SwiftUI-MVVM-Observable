//
//  CDReminder+Helper.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 15/08/25.
//
import Foundation
import CoreData

extension CDReminder {
    
    var uuid: UUID {
        #if DEBUG
        uuid_!
        #else
        uuid_ ?? UUID()
        #endif
    }
    
    var title: String {
        get { title_ ?? "" }
        set {  title_ = newValue }
    }
    
    var descriptor: String {
        get { descriptor_ ?? "" }
        set { descriptor_ = newValue }
    }
    
    var creationDate: Date {
        creationDate_ ?? Date()
    }
    
    var tasks: Set<CDReminderItem> {
        get { (tasks_ as? Set<CDReminderItem>) ?? [] }
        set {  tasks_ = newValue as NSSet }
    }
    
    var isCompleted: Bool {
        get { isCompleted_ }
        set { isCompleted_ = newValue }
    }
    
    var status: StatusItem {
        get { tasks.isEmpty ? .isInProgress :
            (tasks.allSatisfy { $0.statusItem == .isDone } ? .isDone : .isInProgress) }
    }
    
    convenience init( title: String,
                      descriptor: String,
                      context: NSManagedObjectContext) {
        self.init(context: context)
        self.title = title
        self.descriptor = descriptor
    }
    
    public override func awakeFromInsert() {
        self.uuid_ = UUID()
        self.creationDate_ = Date()
    }
    
    //MARK: Fetching
    @MainActor
    static func fetch(_ predicate: NSPredicate = .all) -> NSFetchRequest<CDReminder> {
        let request = CDReminder.fetchRequest()
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \CDReminder.creationDate_, ascending: false),
            NSSortDescriptor(keyPath: \CDReminder.title_, ascending: true)
        ]
        
        request.predicate = predicate
        
        return request
    }
    
    @MainActor
    static var example: CDReminder {
        let context = PersistentContainer.preview.container.viewContext
        let task = CDReminder(title: "Example Reminder",
                                        descriptor: "This is an example reminder",
                                        context: context)
        return task
    }
    
}

extension CDReminder {
    public static func < (lhs: CDReminder, rhs: CDReminder) -> Bool {
        lhs.title < rhs.title
    }
}


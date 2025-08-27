//
//  CDReminderItem+Helper.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 15/08/25.
//
import Foundation
import CoreData

extension CDReminderItem {
    
    var uuid: UUID {
        #if DEBUG
        uuid_!
        #else
        uuid_ ?? UUID()
        #endif
    }
    
    var creationDate: Date {
        creationDate_ ?? Date()
    }
    
    var descriptor : String {
        get { descriptor_ ?? "" }
        set { descriptor_ = newValue }
    }
    
    var dueDate: Date {
        get { dueDate_ ?? Date() }
        set { dueDate_ = newValue }
    }
    
    var statusItem: StatusItem {
        get { StatusItem(rawValue: statusItem_) ?? .isInProgress }
        set {  statusItem_ = newValue.rawValue }
    }
    
    convenience init(
        descriptor: String,
        dueDate: Date,
        context: NSManagedObjectContext
    ) {
        self.init(context: context)
        self.descriptor = descriptor
        self.dueDate = dueDate
    }
    
    public override func awakeFromInsert() {
        self.uuid_ = UUID()
        self.creationDate_ = Date()
    }
    
    // MARK: - Fetching
    @MainActor
    static func fetch(_ predicate: NSPredicate = .all) -> NSFetchRequest<CDReminderItem> {
        let request = CDReminderItem.fetchRequest()
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \CDReminderItem.creationDate_, ascending: false),
            NSSortDescriptor(keyPath: \CDReminderItem.descriptor_, ascending: true)
            
        ]
        
        request.predicate = predicate
        
        return request
    }
    
    
}

extension CDReminderItem {
    public static func < (lhs: CDReminderItem, rhs: CDReminderItem) -> Bool {
        lhs.descriptor < rhs.descriptor
    }
}

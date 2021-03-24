//
//  ToDoListItem+CoreDataProperties.swift
//  ToDoListApp2
//
//  Created by Stepan Ostapenko on 26.02.2021.
//
//

import Foundation
import CoreData
import UIKit

extension ToDoListItem {

    @nonobjc public class func getFetchRequest() -> NSFetchRequest<ToDoListItem> {
        return NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var status: St
    
    @objc public enum St : Int32, Codable{
        case new = 0
        case done = 1
        case inProrgress = 2
    }
    
    public func getStatusInfo() -> String{
        switch status {
        case St.done:
            return "Finished"
        case St.inProrgress:
            return "In progress"
        case St.new:
            return "New"
        default:
            return ""
        }
    }
    
    public func getColor() -> UIColor{
        switch status {
        case St.done:
            return UIColor.systemGreen
        case St.inProrgress:
            return  #colorLiteral(red: 0.9688973199, green: 1, blue: 0.4272307125, alpha: 1)
        case St.new:
            return UIColor.systemGray
        default:
            return UIColor.systemRed
        }
    }
    
    public func getDateString() -> String{
        let formater = DateFormatter()
        formater.dateFormat = "dd.MM.yyyy"
        return formater.string(from: self.createdAt!)

    }

}

extension ToDoListItem : Identifiable {

}



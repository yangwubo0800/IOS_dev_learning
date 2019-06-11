//
//  HJCarModel+CoreDataProperties.swift
//  18_DataPersitenceCoreData
//
//  Created by hongbo ni on 2019/5/27.
//  Copyright © 2019 hongbo ni. All rights reserved.
//
//

import Foundation
import CoreData


extension HJCarModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HJCarModel> {
        return NSFetchRequest<HJCarModel>(entityName: "HJCarModel")
    }

    @NSManaged public var carName: String?
    @NSManaged public var userId: Int64
    @NSManaged public var userName: String?

}

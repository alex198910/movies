//
//  Room+CoreDataProperties.swift
//  MovieShowtimes
//
//  Created by admin on 20.01.2020.
//  Copyright © 2020 Alex. All rights reserved.
//
//

import Foundation
import CoreData


extension Room {

    @nonobjc public class func fetchRequestForRoomEntity() -> NSFetchRequest<Room> {
        return NSFetchRequest<Room>(entityName: "Room")
    }

    @NSManaged public var movieName: String?
    @NSManaged public var movieImage: String?
    @NSManaged public var movieTimes: String?

}

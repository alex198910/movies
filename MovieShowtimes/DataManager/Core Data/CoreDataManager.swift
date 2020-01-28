//
//  CoreDataManager.swift
//  MovieShowtimes
//
//  Created by admin on 20.01.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy private var managedContextOfMovies: NSManagedObjectContext = persistentContainer.viewContext
    
    func add(movies: [Movie]){
        cleanDataBase()
        guard let entity = NSEntityDescription.entity(forEntityName: "Room", in: managedContextOfMovies) else { return }
        movies.forEach { movie in
            let room = Room(entity: entity, insertInto: managedContextOfMovies)
            room.movieName = movie.name
            room.movieTimes = movie.time
            room.movieImage = movie.poster
        }
        
        do {
            try managedContextOfMovies.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func loadMovies() -> [Movie]? {
        var allCinemaFromCoreData: [Room]? = []
        let fetchRequest = Room.fetchRequestForRoomEntity()
        do {
            allCinemaFromCoreData = try managedContextOfMovies.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }

        guard let rooms = allCinemaFromCoreData else { return nil }
        
        let movies: [Movie] = rooms.compactMap { room in
            let movie = Movie(time: room.movieTimes, name: room.movieName, poster: room.movieImage)
            return movie
        }
        return movies
    }
    
    private func cleanDataBase() {
        var allCinemaFromCoreData: [Room]? = []
        let fetchRequest = Room.fetchRequestForRoomEntity()
        
        do {
            allCinemaFromCoreData = try managedContextOfMovies.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        guard let array = allCinemaFromCoreData else { return }
        
        var i = (array.count ) - 1
        
        while (i >= 0){
            managedContextOfMovies.delete((array[i]))
            i -= 1
        }
        
        do {
            try managedContextOfMovies.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

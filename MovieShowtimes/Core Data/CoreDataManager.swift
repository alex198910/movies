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
    
    private var allCinemaFromCoreData: [Room]? = []
    
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
        cleanMoviesDataInDataBase()
        let entity = NSEntityDescription.entity(forEntityName: "Room", in: managedContextOfMovies)!
        for index in 0...movies.count - 1 {
            let cinemaInCoreData = Room(entity: entity, insertInto: managedContextOfMovies)
            cinemaInCoreData.movieName = movies[index].name
            cinemaInCoreData.movieTimes = movies[index].time
            cinemaInCoreData.movieImage = movies[index].poster
            do {
                try managedContextOfMovies.save()
                
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
                
            }
            
        }
        
    }
    
    
    func loadMovies() -> [Movie]? {
        let fetchRequest = Room.fetchRequestForRoomEntity()
        do {
            self.allCinemaFromCoreData = try managedContextOfMovies.fetch(fetchRequest)
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            
        }
        var index = 0
        var allMovies: [Movie]? = []
        while(index <= (self.allCinemaFromCoreData?.count ?? 0) - 1) {
            var singleMovie = Movie()
            singleMovie.name = self.allCinemaFromCoreData?[index].movieName
            singleMovie.time = self.allCinemaFromCoreData?[index].movieTimes
            singleMovie.poster = self.allCinemaFromCoreData?[index].movieImage
            allMovies?.append(singleMovie)
            index += 1
            
        }
        return allMovies
        
    }
    
    
    func cleanMoviesDataInDataBase() {
        let fetchRequest = Room.fetchRequestForRoomEntity()
        do {
            self.allCinemaFromCoreData = try managedContextOfMovies.fetch(fetchRequest)
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            
        }
        guard let array = self.allCinemaFromCoreData else {return print("RETURN")}
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
        allCinemaFromCoreData?.removeAll()
        
    }
    
}

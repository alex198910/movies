//
//  DataManager.swift
//  MovieShowtimes
//
//  Created by admin on 21.01.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    var apiManager = APIManager()
    static let shared = DataManager()
    
    private func appMan(completion: @escaping ([Movie]?) -> () ) {
        apiManager.getData { data in
            completion(data)
            
        }
        
    }
    
    func getMovies(completion: @escaping ([Movie]?) -> () ) {
        appMan { data in
            guard let data = data else {
            // core data
                completion(CoreDataManager.shared.loadMovies())
                return
                
            }
            // json data
            CoreDataManager.shared.cleanMoviesDataInDataBase()
            CoreDataManager.shared.add(movies: data)
            completion(data)
            
        }
        return
        
    }

}

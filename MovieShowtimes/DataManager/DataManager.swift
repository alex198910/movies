//
//  DataManager.swift
//  MovieShowtimes
//
//  Created by admin on 21.01.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class DataManager {
    
    static let shared = DataManager()
    private var apiManager = APIManager()

    func getMovies(completion: @escaping ([Movie]?) -> () ) {
        getData { data in
            guard let data = data else {
                // core data
                completion(CoreDataManager.shared.loadMovies())
                return
            }
            // json data
            DispatchQueue.global(qos: .background).async{
                CoreDataManager.shared.add(movies: data)
            }
            completion(data)
        }
    }
    
    private func getData(completion: @escaping ([Movie]?) -> () ) {
        apiManager.getData { data in
            completion(data)
        }
    }
}

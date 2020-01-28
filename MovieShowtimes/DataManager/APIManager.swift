//
//  APIManager.swift
//  MovieShowtimes
//
//  Created by admin on 26.12.2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class APIManager {
    private let urlPath = "https://firebasestorage.googleapis.com/v0/b/testfirebase-d377b.appspot.com/o/newJson.json?alt=media&token=f01de72b-5c0f-4623-b44d-b6784a3af405"
    private var jsonParser = JsonDataGetter()
    
    func getData(completion: @escaping (([Movie]?) -> Void)) {
        guard let url = URL(string: urlPath) else {
            completion(nil)
            return
        }
        let request = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let urlTask = session.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data,
                  error == nil
            else {
                print("\n\n DataTaskError ---> \(String(describing: error))")
                completion(nil)
                return
            }

            self?.jsonParser.decodeJson(data: data) { data in
                completion(data)
            }
        }
        urlTask.resume()
    }
}

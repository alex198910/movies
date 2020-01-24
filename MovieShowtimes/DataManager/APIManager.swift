//
//  APIManager.swift
//  MovieShowtimes
//
//  Created by admin on 26.12.2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class APIManager: NSObject {
    var jsonParser = JsonDataGetter()
    
    func getData(comletion: @escaping (([Movie]?) -> Void)) {
        let urlPath = "https://firebasestorage.googleapis.com/v0/b/testfirebase-d377b.appspot.com/o/newJson.json?alt=media&token=f01de72b-5c0f-4623-b44d-b6784a3af405"
        let myURL = URL(string: urlPath)!
        let request = URLRequest(url: myURL)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let urlTask = session.dataTask(with: request) { [weak self] myData, response, error in
            guard error == nil
            else {
                print("\n\n DataTaskError ---> \(String(describing: error))")
                comletion(nil)
                return
                
            }
            do {
                guard let myData = myData else { return }
                self?.jsonParser.decodeJson(myData: myData) { data in
                    comletion(data)
                    
                }
                
            }
//            catch {
//                print("Error during parsing ---> \(error) ")
//                comletion(nil)
//
//            }
            
        }
        urlTask.resume()
        
    }
    
}

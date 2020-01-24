//
//  JsonDataGetter.swift
//  MovieShowtimes
//
//  Created by admin on 27.12.2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class JsonDataGetter: NSObject {
    func decodeJson(myData: Data, comletion: @escaping (([Movie]?) -> Void)) {
        do {
            let jsonData = try JSONDecoder().decode([Movie].self, from: myData)
            comletion(jsonData)
            
        } catch {
            //print("Error during parsing ---> \(error) ")
            comletion(nil)
            
        }
        
    }
        
}

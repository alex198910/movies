//
//  JsonDataGetter.swift
//  MovieShowtimes
//
//  Created by admin on 27.12.2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class JsonDataGetter {
    func decodeJson(data: Data, completion: @escaping (([Movie]?) -> Void)) {
        do {
            let jsonData = try JSONDecoder().decode([Movie].self, from: data)
            completion(jsonData)
        } catch {
            //print("Error during parsing ---> \(error) ")
            completion(nil)
        }
    }
}

//
//  File.swift
//  MovieShowtimes
//
//  Created by admin on 09.01.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import CoreData
import UIKit

struct Movie : Decodable {
    var time : String?
    var name : String?
    var poster : String?
}

func printCinemaData(array: [Movie]){
    print("\n")
    var i = 0
    while i < array.count {
        print("CINEMA \(i) _ Name -> \(String(describing:array[i].name))   Times ->  \(String(describing:array[i].time))     Imagee ->  \(String(describing:array[i].poster))")
        i+=1
    }
    
}

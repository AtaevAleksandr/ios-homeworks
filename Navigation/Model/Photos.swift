//
//  Photos.swift
//  Navigation
//
//  Created by Aleksandr Ataev on 12.01.2023.
//

import Foundation
import UIKit

struct Photo {
    var image: String
}

extension Photo {
    static var photos: [Photo] = [Photo(image: "Thor"), Photo(image: "Aquaman"), Photo(image: "Ironman"), Photo(image: "Wolverine"),
                                  Photo(image: "CaptainAmerica"), Photo(image: "Hulk"), Photo(image: "Loki"), Photo(image: "Superman"),
                                  Photo(image: "WonderWoman"), Photo(image: "Spiderman"), Photo(image: "DrStrange"), Photo(image: "PrX"),
                                  Photo(image: "GreenLantern"), Photo(image: "Spawn"), Photo(image: "SilverSurfer"), Photo(image: "CaptainMarvel"),
                                  Photo(image: "Namor"), Photo(image: "Flash"), Photo(image: "BlackBolt"), Photo(image: "MarsianHunter")
    ]
}



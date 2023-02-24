//
//  Post.swift
//  Navigation
//
//  Created by Aleksandr Ataev on 25.11.2022.
//

import Foundation
import UIKit

struct Post {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

extension Post {
    static var posts: [Post] = [
        Post(author: "chrishemsworth",
             description: "Be your own BOSS with the new BOSS Bottled Parfum out now. #BOSSBottled #BeYourOwnBOSS @BOSS",
             image: "ChrisHemsworth",
             likes: 906_982,
             views: 1_540_324),
        Post(author: "prideofgypsies",
             description: "love you @gueikian and @gibsoncustom for saving me the last greene. @kirkhammett i’m so stoked. @metallica fo life. all my aloha j",
             image: "JasonMomoa",
             likes: 405_015,
             views: 704_234),
        Post(author: "emilia_clarke",
             description: "When life (or a supporting artist) gives you dragons, you make them make kissy noises.",
             image: "EmiliaClarke",
             likes: 1_359_161,
             views: 1_795_432),
        Post(author: "therock",
             description: "12am 🕛 🥳 Insanely fun New Years Eve party last night as the clock struck midnight to usher in 2023.",
             image: "DwayneJohnson",
             likes: 1_604_914,
             views: 2_050_543)
    ]
}

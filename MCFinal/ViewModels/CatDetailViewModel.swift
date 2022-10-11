//
//  CatDetailViewModel.swift
//  MCFinal
//
//  Created by Mounika Madishetti on 09/10/22.
//

import Foundation
final class CatDetailViewModel {
    var catData: CatBreedResponse?
    init(catData: CatBreedResponse) {
        self.catData = catData
    }
}

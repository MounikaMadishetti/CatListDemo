//
//  CatBreedsModel.swift
//  MCFinal
//
//  Created by Mounika Madishetti on 08/10/22.
//


// MARK: - CatBreedResponse

struct CatBreedResponse: Codable {
    let breeds: [Breed]
    let categories: [Categories]
    let url: String?
}

// MARK: - Breed
struct Breed: Codable {
    let weight: Weight?
    let name: String?
    let id: String?
    let breedDescription, lifeSpan: String?
    enum CodingKeys: String, CodingKey {
        case  weight, name, id
        case breedDescription = "description"
        case lifeSpan = "life_span"
        
    }
}

// MARK: - Categories
struct Categories: Codable {
    let id: Int?
    let name: String?
}

//MARK: - Weight
struct Weight: Codable {
    let imperial, metric: String?
}

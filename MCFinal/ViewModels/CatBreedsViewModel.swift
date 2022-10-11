//
//  CatBreedsViewModel.swift
//  MCFinal
//
//  Created by Mounika Madishetti on 08/10/22.
//

import Foundation

protocol CatBreedsViewModelProtocol: AnyObject {
    func getApiResponse(completionHandler: @escaping (Result<[CatBreedResponse], Error>) -> Void)
}
 class CatBreedsViewModel: CatBreedsViewModelProtocol {
    var pageCount: Int = 0
    var networkManager = NetworkManager()
    var catBreedResponse: [CatBreedResponse] = []
    
    func getApiResponse(completionHandler: @escaping (Result<[CatBreedResponse], Error>) -> Void) {
        networkManager.getApiData(pageCount: pageCount) { (res: Result<[CatBreedResponse], Error>) in
            switch res {
            case .success(let data):
                self.catBreedResponse.append(contentsOf: data)
                completionHandler(.success(data))
            case .failure(let error):
                completionHandler(.failure(error))
                
            }
        }
    }
}

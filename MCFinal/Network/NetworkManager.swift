//
//  NetworkManager.swift
//  MCFinal
//
//  Created by Mounika Madishetti on 08/10/22.
//

import Foundation
class NetworkManager {
    func getApiData<T: Codable>(pageCount: Int, completionHandler: @escaping (Result<T, Error>) -> Void) {
        
         let request = getUrl(pageCount: pageCount)
            URLSession.shared.dataTask(with: request!) { (data, response, error) in
                DispatchQueue.main.async {
                    if error == nil {
                        guard let data = data else { return }
                        do {
                            let jsonData = try JSONDecoder().decode(T.self, from: data)
                            completionHandler(.success(jsonData))
                        } catch let error {
                            completionHandler(.failure(error))
                        }
                    }
                }
                
            }.resume()
    }
    
    func getUrl(pageCount: Int) -> URLRequest? {
        let urlString = "https://api.thecatapi.com/v1/images/search?order=ASC&limit=20&size=small&page=\(pageCount)"
        guard let url = URL(string: urlString) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "get"
        request.addValue("17d94b92-754f-46eb-99a0-65be65b5d18f", forHTTPHeaderField: "x-api-key")
        return request
    }
}

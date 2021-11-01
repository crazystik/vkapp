//
//  FriendsAPI.swift
//  vkapp
//
//  Created by Pavel Lazarev on 26.10.2021.
//

import Foundation

class FriendsAPI: VKService {
    
    private let basePath = "/method/friends."
    
    func friends(completion: @escaping ([Friend]) -> Void) {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = self.baseUrl
        urlComponents.path = basePath + "get"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: self.token),
            URLQueryItem(name: "user_id", value: String(self.userId)),
            URLQueryItem(name: "order", value: "name"),
            URLQueryItem(name: "fields", value: "photo_100"), // если несколько значений, то писать через запятую в value в строке
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let url = urlComponents.url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            
            do {
                let object = try JSONDecoder().decode(FriendsJSON.self, from: data)
                completion(object.response.items)
            } catch {
                debugPrint(error)
            }
        }
        task.resume()
    }
    
}

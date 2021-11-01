//
//  PhotoAPI.swift
//  vkapp
//
//  Created by Pavel Lazarev on 26.10.2021.
//

import Foundation

final class PhotoAPI: VKService {
    
    private let basePath = "/method/photos."
    
    func photos(completion: @escaping ([Photos]) -> Void) {
        self.photos(ownerId: self.userId, completion: completion)
    }
    
    func photos(ownerId: String, completion: @escaping ([Photos]) -> Void) {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = self.baseUrl
        urlComponents.path = self.basePath + "get"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: self.token),
            URLQueryItem(name: "owner_id", value: ownerId),
            URLQueryItem(name: "album_id", value: "profile"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let url = urlComponents.url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else { debugPrint(error as Any); return }
            
            do {
                let object = try JSONDecoder().decode(PhotosJSON.self, from: data)
                completion(object.response.items)
            } catch {
                debugPrint(error)
            }
            
        }
        task.resume()
    }
    
    
}

//
//  GroupsAPI.swift
//  vkapp
//
//  Created by Pavel Lazarev on 26.10.2021.
//

import Foundation

final class GroupsAPI: VKService {
    
    private let basePath = "/method/groups."
    
    func groups(completion: @escaping ([Group]) -> Void) {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = self.baseUrl
        urlComponents.path = self.basePath + "get"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: self.token),
            URLQueryItem(name: "user_id", value: String(self.userId)),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "v", value: self.version)
        ]
        
        guard let url = urlComponents.url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            
            do {
                let object = try JSONDecoder().decode(GroupsJSON.self, from: data)
                completion(object.response.items)
            } catch {
                debugPrint(error)
            }
        }
        task.resume()
    }
    
    func searchGroups(searchText: String, completion: @escaping ([Group]) -> Void) {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = self.baseUrl
        urlComponents.path = self.basePath + "search"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: self.token),
            URLQueryItem(name: "q", value: searchText),
            URLQueryItem(name: "v", value: self.version)
        ]
        
        guard let url = urlComponents.url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            
            do {
                let object = try JSONDecoder().decode(GroupsJSON.self, from: data)
                completion(object.response.items)
            } catch {
                debugPrint(error)
            }
        }
        task.resume()
    }
    
}

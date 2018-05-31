//
//  APIListModelController.swift
//  PublicAPI Viewer
//
//  Created by Ben Adams on 5/30/18.
//  Copyright © 2018 Ben Adams. All rights reserved.
//

import Foundation

class APIController {
    
    /// Constants for reuse in code
    struct Constants {
        static let baseURL = URL(string: "https://api.publicapis.org/entries")
    }
    
    /// Temporary Storage Properties
    static var apiSearch: [openAPI]?
    
    

    /// API Request Functions
    
    // #1: Get APIs by search description
    static func fetchAPIs(searchByDescription: StringLiteralType, completion: @escaping (() -> Void)) {
        
      // URL check
        guard let url = Constants.baseURL else {
            print("Error creating base url")
            completion()
            return
        }
        // URL build
        let urlParameters: [String: String] = ["description" : searchByDescription]
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let queryItems = urlParameters.compactMap { URLQueryItem(name: $0.key, value: $0.value) }
        components?.queryItems = queryItems
        
        guard let finalURL = components?.url else {
            print("error creating final url")
            completion()
            return
        }
        
        //Test URL
        print(finalURL.absoluteString)
        
        // Request
        var request = URLRequest(url: finalURL)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        
        
        // Datatask + Resume
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("Error getting APIs")
                completion()
                return
            }
            
            guard let data = data else {
                print("Error no data from getting APIs")
                completion()
                return
            }
            
            do {
                let topleveldata = try JSONDecoder().decode(TopLevelData.self, from: data)
            
                apiSearch = topleveldata.entries
                completion()
                return
            } catch {
                print("error decoding fetched terms:")
                completion()
                return
            }
        }.resume()
        
        
        
    }
    
    
    //////////////////////////////////////////////////
    
    static func fetchAPITitle(searchByTitle: StringLiteralType, completion: @escaping (() -> Void)) {
        
        // URL check
        guard let url = Constants.baseURL else {
            print("Error creating base url")
            completion()
            return
        }
        // URL build
        let urlParameters: [String: String] = ["title" : searchByTitle]
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let queryItems = urlParameters.compactMap { URLQueryItem(name: $0.key, value: $0.value) }
        components?.queryItems = queryItems
        
        guard let finalURL = components?.url else {
            print("error creating final url")
            completion()
            return
        }
        
        //Test URL
        print(finalURL.absoluteString)
        
        // Request
        var request = URLRequest(url: finalURL)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        
        
        // Datatask + Resume
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("Error getting APIs")
                completion()
                return
            }
            
            guard let data = data else {
                print("Error no data from getting APIs")
                completion()
                return
            }
            
            do {
                let topleveldata = try JSONDecoder().decode(TopLevelData.self, from: data)
                
                apiSearch = topleveldata.entries
                completion()
                return
            } catch {
                print("error decoding fetched terms:")
                completion()
                return
            }
        }.resume()
    
    
 }
}

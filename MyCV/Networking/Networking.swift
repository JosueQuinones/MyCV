//
//  File.swift
//  MyCV
//
//  Created by Josue Emanuel Quinones Rivera on 5/31/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

public class Networking {
    /**
     Singletone for use methods for access the service
     */
    public static var shared = Networking()
    
    //MARK: - API Information
    private var baseURLString = UIApplication.serverURL
    private var endpoint: String?
    
    //MARK: - URL Session
    private var defaultSession = URLSession(configuration: .default)
    private var dataTask: URLSessionDataTask?
    
    //MARK: - Get json model instance with data from service
    public func getModel<Model: Codable>(model: Model, completion: @escaping (Model?) -> Void) {
        let jsonDecoder = JSONDecoder()
        
        getData { result in
            switch result {
            case .success(let data):
                if let json = try? jsonDecoder.decode(Model.self, from: data) {
                    completion(json)
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
    //MARK: - Fetch data from Service
    private func getData(completion: @escaping (Result<Data, NetworkError>) -> Void) {
        if let url = urlAssembler(endpoint: nil) {
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                if let data = data, let _ = response as? HTTPURLResponse {
                    completion(.success(data))
                } else if let _ = error {
                    completion(.failure(.fetchingError))
                }
            }
            dataTask?.resume()
        }
    }
    
    public func getImage(from url: URL, completion: @escaping (UIImage) -> Void) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        completion(image)
                    }
                }
            }
        }
    }
    
    //MARK: - URL Assemble
    private func urlAssembler(endpoint: String?) -> URL? {
        guard let baseURLString = baseURLString else {
            return nil
        }
        guard var baseURL = URL(string: baseURLString) else {
            return nil
        }
        
        if let endpoint = endpoint {
            baseURL.appendPathComponent(endpoint)
        }
        
        return baseURL
    }
}

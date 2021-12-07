//
//  APIService.swift
//  AsyncImages
//
//  Created by Jeffrey Tabios on 12/6/21.
//

import Foundation

public enum APIServiceError: Error {
    case none
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case decodeError
    case fileNotFound
}

protocol APIService {
    var dataTask: URLSessionDataTask? {get set}
    func request<U: Codable>(endpoint: EndPoint, method: HTTPMethod, completion: @escaping (Result<U,APIServiceError>)->Void)
}

class API: APIService {
    var dataTask: URLSessionDataTask?
    
    func request<U: Codable>(endpoint: EndPoint, method: HTTPMethod, completion: @escaping (Result<U,APIServiceError>)->Void) {
        
        dataTask?.cancel()
                
        var request = URLRequest(url: URL(string: endpoint.url)!)
        request.httpMethod = method.rawValue
        
        endpoint.headers.forEach { key, val in
            request.setValue(val, forHTTPHeaderField: key)
        }
        
        dataTask =
            URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
                defer {
                    self?.dataTask = nil
                }
                
                if error != nil {
                    completion(.failure(.apiError))
                } else if
                    let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200
                {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    
                    guard let result = try? decoder.decode(U.self, from: data) else{
                        completion(.failure(.decodeError))
                        return
                    }
                    
                    completion(.success(result))
                }else{
                    completion(.failure(.invalidResponse))
                }
        }
        dataTask?.resume()
    }
}

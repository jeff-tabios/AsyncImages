//
//  AlbumsService.swift
//  AsyncImages
//
//  Created by Jeffrey Tabios on 12/6/21.
//

import Foundation

protocol AlbumsServiceProtocol {
    func getAlbums(offset: Int, completion: @escaping (Result<Albums,APIServiceError>)->Void)
}

final class AlbumsService: AlbumsServiceProtocol {
    
    let api: APIService
    
    init(api: APIService) {
        self.api = api
    }
    
    func getAlbums(offset: Int, completion: @escaping (Result<Albums,APIServiceError>)->Void) {
        api.request(endpoint: AlbumsAPI.albums(offset: offset, count: 10),
                    method: .get, completion: completion)
    }
}


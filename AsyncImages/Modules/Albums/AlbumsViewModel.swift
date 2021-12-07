//
//  AlbumsViewModel.swift
//  AsyncImages
//
//  Created by Jeffrey Tabios on 12/6/21.
//

import Foundation

class AlbumsViewModel {
    let numItems = 10
    var nextPage = 1
    var albums: [Album] = []
    var getSuccess: (()->Void)?
    let service: AlbumsServiceProtocol
    
    init(service: AlbumsServiceProtocol) {
        self.service = service
    }
    
    func getNextPage() {
        let offset = numItems * nextPage - numItems + 1
        
        service.getAlbums(offset: offset) { [weak self] result in
            switch result {
            case .success(let albums):
                self?.albums += albums.results
                self?.nextPage += 1
                self?.getSuccess?()
            case .failure(_):
                break
            }
        }
    }
}

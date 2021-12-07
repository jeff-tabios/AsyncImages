//
//  AlbumsAPI.swift
//  AsyncImages
//
//  Created by Jeffrey Tabios on 12/6/21.
//

import Foundation

enum AlbumsAPI {
    case albums(offset: Int, count: Int)
}

extension AlbumsAPI: EndPoint {
    
    var baseURL: String { "https://api-metadata-connect.tunedglobal.com/api/v2.1/albums/trending" }
    
    var headers: HTTPHeaders {
        ["StoreId": "luJdnSN3muj1Wf1Q"]
    }
    
    var url: String {
        
        var ep = baseURL
        
        switch self {
        case .albums(let offset, let count):
            ep += "?offset=\(offset)&count=\(count)"
        }
        
        return ep
    }
    
}

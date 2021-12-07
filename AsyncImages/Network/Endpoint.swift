//
//  Endpoints.swift
//  AsyncImages
//
//  Created by Jeffrey Tabios on 12/6/21.
//

import Foundation

public typealias HTTPHeaders = [String:String]

protocol EndPoint{
    var baseURL: String { get }
    var headers: HTTPHeaders { get }
    var url: String { get }
}




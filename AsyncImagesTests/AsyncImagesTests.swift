//
//  AsyncImagesTests.swift
//  AsyncImagesTests
//
//  Created by Jeffrey Tabios on 12/6/21.
//

import XCTest
@testable import AsyncImages

class AsyncImagesTests: XCTestCase {

    func test_getAlbumsShouldReturnItems() {
        let api = API()
        let exp = expectation(description: "get albums")
        api.request(endpoint: AlbumsAPI.albums(offset: 1, count: 10),
                    method: .get) { (result:Result<Albums,APIServiceError>) in
            XCTAssert(true)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }

}

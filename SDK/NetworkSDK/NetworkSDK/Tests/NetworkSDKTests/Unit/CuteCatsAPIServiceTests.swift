//
//  TopListMoviesAPIServiceTests.swift
//  NetworkSDK
//
//  Created by Bodgar Espinosa Miranda on 16/01/25.
//

import XCTest
import Combine
@testable import NetworkSDK
import Switchboard

final class CuteCatsAPIServiceTests: XCTestCase {
    
    private var cancellables: Set<AnyCancellable> = []
    
    let catResponse = [
        CatResponse(
            id: "tyU23CXdkKSFghVc",
            mimetype: "image/png",
            size: 51395,
            tags: ["cute"]
        ),
        CatResponse(
            id: "UIx85TPiQmqwFOBL",
            mimetype: "image/png",
            size: 45668,
            tags: ["cute"]
        ),
        CatResponse(
            id: "BEaOH4JKEvYUxnGH",
            mimetype: "image/png",
            size: 54001,
            tags: [
                "cute",
                "grey",
                "gray",
                "wink"
            ]
        ),
    ]

    
    func test_refresh_shouldReturnError() {
        let mock = MockNetworkService()
        let sut = CuteCatsAPIService(httpClient: mock)
        let expectedError = NSError(domain: "", code: 404, userInfo: nil)
        mock.shouldFail = true
        mock.expectedError = expectedError
        
        let expectation = expectation(description: "Should return error")
        
        sut.catListPublisher
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { result in
                switch result {
                case .failure(let error):
                    XCTAssertNotNil(error)
                    XCTAssertEqual(error as NSError, expectedError)
                case .success(_):
                    XCTFail()
                }
                expectation.fulfill()
            }).store(in: &cancellables)

        sut.refresh()
        
        wait(for: [expectation], timeout: 1)
    }
    
    func test_refresh_shouldReturnMovieResponse() {
        let mock = MockNetworkService()
        let sut = CuteCatsAPIService(httpClient: mock)
        mock.expectedResponse = catResponse
        let expectation = expectation(description: "Should return data")
        
        sut.catListPublisher
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { result in
                switch result {
                case .failure(_):
                    XCTFail()
                case .success(let cats):
                    XCTAssertEqual(cats.count, 3)
                    XCTAssertEqual(cats.first?.mimetype, self.catResponse.first?.mimetype)
                    XCTAssertEqual(cats.first?.size, self.catResponse.first?.size)
                    XCTAssertEqual(cats.first?.tags.first, self.catResponse.first?.tags.first)
                }
                expectation.fulfill()
            }).store(in: &cancellables)

        sut.refresh()
        
        wait(for: [expectation], timeout: 1)
    }
}

final class MockNetworkService: HTTPClient {
    var shouldFail = false
    var expectedError: Error?
    var expectedResponse: [CatResponse]?
    
    func get<T>(from url: URL, httpMethod: NetworkSDK.HTTPMethod, headers: [String : String]?, body: Data?) async throws -> T where T : Decodable {
        if shouldFail {
            throw expectedError!
        } else {
            return expectedResponse! as! T
        }
    }
}

//
//  TopListMoviesAPIService.swift
//  NetworkSDK
//
//  Created by Bodgar Espinosa Miranda on 16/01/25.
//

import Foundation
import Switchboard
import Common
import Combine

final class CuteCatsAPIService: CuteCatsService {    
    
    enum QueryError: Error {
        case successNoData
        case none
        case wrongURL
    }
    
    var catListPublisher: AnyPublisher<Result<[CatResponse], Error>, Error> {
        return catListSubject.share().eraseToAnyPublisher()
    }
    
    var id = UUID()
    
    private let catListSubject = CurrentValueSubject<Result<[CatResponse], Error>, Error>(.success([]))
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient = URLSessionNetwork()) {
        self.httpClient = httpClient
    }
    
    func refresh() {
        guard let url = URL(string: "https://cataas.com/api/cats?tags=cute") else {
            catListSubject.send(.failure(QueryError.wrongURL))
            return
        }
        Task {
            do {
                let catResponse: [CatResponse] = try await httpClient.get(from: url, httpMethod: .GET, headers: nil, body: nil)
                catListSubject.send(.success(catResponse))
            } catch {
                catListSubject.send(.failure(error))
            }
        }
    }
}

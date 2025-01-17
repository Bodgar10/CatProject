//
//  TopListMovieService.swift
//  Switchboard
//
//  Created by Bodgar Espinosa Miranda on 16/01/25.
//

import Foundation
import Combine
import Common

/// Service to get the information of the cats list endpoint.
public protocol CuteCatsService: Service {
    var catListPublisher: AnyPublisher<Result<[CatResponse], Error>, Error> { get }
    func refresh()
}

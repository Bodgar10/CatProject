//
//  NetworkSDKDependencies.swift
//  NetworkSDK
//
//  Created by Bodgar Espinosa Miranda on 16/01/25.
//

import Foundation
import Switchboard
import Common

public struct NetworkSDKDependencies {
    public init() {
        registerDependencies()
    }
    
    private func registerDependencies() {
        ServiceLocator.register(CuteCatsService.self, factory: CuteCatsAPIService())
    }
}

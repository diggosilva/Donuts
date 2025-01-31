//
//  ApiEnvironment.swift
//  Donuts
//
//  Created by Diggo Silva on 30/01/25.
//

import Foundation

class ApiEnvironment {
    static let api = Bundle.main.object(forInfoDictionaryKey: "ApiUrl") as? String
}

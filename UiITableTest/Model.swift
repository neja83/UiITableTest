//
//  Model.swift
//  UiITableTest
//
//  Created by Eugene Krapivenko on 16.03.2022.
//

import Foundation

// MARK: - Discription of models
protocol Goods {
    var name: String { get set }
    var price: Int { get set }
}

protocol Store {
    func getList(_ : @escaping ((_ result: [Goods], _ error: Error?) -> ()))
}

// MARK: - Implementation
struct SomeProduct : Goods {
    var name: String
    var price: Int
}

final class SomeShop: Store {
    typealias action = ((_ result: [Goods] , _ error: Error?) -> ())
    
    func getList(_ completon: @escaping action) {
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 3) {
            let result = [
                SomeProduct(name: "Товар 1", price: 12),
                SomeProduct(name: "Товар 2", price: 24),
                SomeProduct(name: "Товар 3", price: 36),
                SomeProduct(name: "Товар 4", price: 48),
            ]
            completon(result, nil)
        }
    }
}


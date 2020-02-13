//
//  Galaxy.swift
//  App
//
//  Created by Tian Tong on 2020/2/12.
//

import Vapor
import Fluent

final class Galaxy: Model, Content {
    static let schema = "galaxies"
    
    @ID(key: "id")
    var id: Int?
    
    @Field(key: "name")
    var name: String
    
    @Children(for: \.$galaxy)
    var stars: [Star]
    
    init() {}
    
    init(id: Int? = nil, name: String) {
        self.id = id
        self.name = name
    }
}

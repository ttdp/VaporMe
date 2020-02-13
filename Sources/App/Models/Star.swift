//
//  Star.swift
//  App
//
//  Created by Tian Tong on 2020/2/12.
//

import Vapor
import Fluent

final class Star: Model, Content {
    static let schema = "stars"
    
    @ID(key: "id")
    var id: Int?
    
    @Field(key: "name")
    var name: String
    
    @Parent(key: "galaxy_id")
    var galaxy: Galaxy
    
    init() {}
    
    init(id: Int? = nil, name: String, galaxyID: Int) {
        self.id = id
        self.name = name
        self.$galaxy.id = galaxyID
    }
}

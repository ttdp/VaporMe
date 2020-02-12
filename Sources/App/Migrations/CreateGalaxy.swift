//
//  CreateGalaxy.swift
//  App
//
//  Created by Tian Tong on 2020/2/12.
//

import Fluent

struct CreateGalaxy: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("galaxies")
            .field("id", .int, .identifier(auto: true))
            .field("name", .string)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("galaxies").delete()
    }
    
}

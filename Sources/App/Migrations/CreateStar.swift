//
//  CreateStar.swift
//  App
//
//  Created by Tian Tong on 2020/2/12.
//

import Fluent

struct CreateStar: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("stars")
            .field("id", .int, .identifier(auto: true))
            .field("name", .string)
            .field("galaxy_id", .int, .references("galaxies", "id"))
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("stars").delete()
    }
    
}

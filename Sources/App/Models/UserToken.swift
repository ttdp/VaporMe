//
//  UserToken.swift
//  App
//
//  Created by Tian Tong on 2020/2/13.
//

import Vapor
import Fluent

final class UserToken: Model, Content {
    static let schema = "user_tokens"
    
    @ID(key: "id")
    var id: Int?
    
    @Field(key: "value")
    var value: String
    
    @Parent(key: "user_id")
    var user: User
    
    init() {}
    
    init(id: Int? = nil, value: String, userID: User.IDValue) {
        self.id = id
        self.value = value
        self.$user.id = userID
    }    
}

extension UserToken {
    struct Migration: Fluent.Migration {
        
        func prepare(on database: Database) -> EventLoopFuture<Void> {
            database.schema("user_tokens")
                .field("id", .int, .identifier(auto: true))
                .field("value", .string, .required)
                .field("user_id", .int, .required, .references("users", "id"))
                .unique(on: "value")
                .create()
        }
        
        func revert(on database: Database) -> EventLoopFuture<Void> {
            database.schema("user_tokens").delete()
        }
    }
}

extension UserToken: ModelUserToken {
    static let valueKey = \UserToken.$value
    static let userKey = \UserToken.$user
    
    var isValid: Bool {
        true
    }
}

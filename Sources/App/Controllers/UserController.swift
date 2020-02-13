//
//  UserController.swift
//  App
//
//  Created by Tian Tong on 2020/2/13.
//

import Vapor

struct UserController {
    
    func create(req: Request) throws -> EventLoopFuture<User> {
        try User.Create.validate(req)
        
        let create = try req.content.decode(User.Create.self)
        guard create.password == create.confirmPassword else {
            throw Abort(.badRequest, reason: "Passwords did not match")
        }
        
        let user = try User(
            name: create.name,
            email: create.email,
            passwordHash: Bcrypt.hash(create.password)
        )
        
        return user.save(on: req.db).map { user }
    }
    
}

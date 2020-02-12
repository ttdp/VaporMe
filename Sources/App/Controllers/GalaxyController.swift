//
//  GalaxyController.swift
//  App
//
//  Created by Tian Tong on 2020/2/12.
//

import Vapor
import Fluent

struct GalaxyController {
    
    func index(req: Request) throws -> EventLoopFuture<[Galaxy]> {
        return Galaxy.query(on: req.db).with(\.$stars).all()
    }
    
    func create(req: Request) throws -> EventLoopFuture<Galaxy> {
        let galaxy = try req.content.decode(Galaxy.self)
        return galaxy.create(on: req.db).map { galaxy }
    }
    
}

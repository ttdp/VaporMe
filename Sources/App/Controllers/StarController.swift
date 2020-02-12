//
//  StarController.swift
//  App
//
//  Created by Tian Tong on 2020/2/12.
//

import Vapor
import Fluent

struct StarController {
    
    func create(req: Request) throws -> EventLoopFuture<Star> {
        let star = try req.content.decode(Star.self)
        return star.create(on: req.db).map { star }
    }
    
}

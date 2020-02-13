import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    let galaxyController = GalaxyController()
    app.get("galaxies", use: galaxyController.index)
    app.post("galaxies", use: galaxyController.create)
    
    let starController = StarController()
    app.post("stars", use: starController.create)
    app.delete("stars", ":starID", use: starController.delete)
    
    let userController = UserController()
    app.post("users", use: userController.create)
    
    let passwordProtected = app.grouped(User.authenticator().middleware())
    passwordProtected.post("login") { req -> EventLoopFuture<UserToken> in
        let user = try req.auth.require(User.self)
        let token = try user.generateToken()
        return token.save(on: req.db).map { token }
    }
    
    let tokenProtected = app.grouped(UserToken.authenticator().middleware())
    tokenProtected.get("me") { req -> String in
        let user = try req.auth.require(User.self)
        return "Hello, \(user.name)"
    }
}

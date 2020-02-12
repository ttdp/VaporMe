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
}

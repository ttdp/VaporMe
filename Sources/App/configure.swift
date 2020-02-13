import Vapor
import Fluent
import FluentSQLiteDriver

// Configures your application
public func configure(_ app: Application) throws {
    // Uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // Configure SQLite database
    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)
    
//    app.databases.use(.sqlite(.memory), as: .sqlite)
//    app.migrations.add(CreateGalaxy())
//    app.migrations.add(CreateStar())
//    app.migrations.add(User.Migration())
//    app.migrations.add(UserToken.Migration())
    
    // Only the first time need to do migrate(), except memory type
    try app.autoMigrate().wait()
    
    // Register routes
    try routes(app)
}

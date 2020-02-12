import Vapor
import Fluent
import FluentSQLiteDriver

// Configures your application
public func configure(_ app: Application) throws {
    // Uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // Configure SQLite database
    app.databases.use(.sqlite(.memory), as: .sqlite)
    
    // Configure migrations
    app.migrations.add(CreateGalaxy())
    app.migrations.add(CreateStar())
    
    try app.autoMigrate().wait()
    
    // Register routes
    try routes(app)
}

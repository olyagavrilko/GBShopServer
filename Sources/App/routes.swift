import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    let authController = AuthController()
    app.get("login", use: authController.login)
    app.get("logout", use: authController.logout)
    
    let catalogController = CatalogController()
    app.get("catalog", use: catalogController.getProductList)
    
    let reviewsController = ReviewController()
    app.get("reviews", use: reviewsController.getReviews)
    app.post("review", use: reviewsController.addReview)
    app.delete("review", use: reviewsController.deleteReview)
    
    let cartController = CartController()
    app.post("cart", use: cartController.addToBasket)
    app.delete("cart", use: cartController.deleteFromBasket)
    app.get("cart", use: cartController.buy)
}

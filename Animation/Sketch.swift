import Foundation
import CanvasGraphics

class Sketch : NSObject {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas : Canvas
    
    // Agent centre point
    var centre: Point
    let radius: Int
    var velocity: Vector
    
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        // No fill on canvas
        canvas.drawShapesWithFill = false
        
        // Define properties of the agent
        centre = Point(x: canvas.width / 2, y: canvas.height / 2) // Centre of screen
        velocity = Vector(x: Double.random(in: -2...2),
                          y: Double.random(in: -2...2))              // Some direction
        radius = 20
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Clear the canvas
        clearCanvas()
        
        // Move the circle
        centre = Point(x: centre.x + velocity.x,
                       y: centre.y + velocity.y)
        
        // Bounce at edges
        bounceAtEdge()
        
        // Draw a circle at this point
        canvas.drawEllipse(at: centre, width: radius * 2, height: radius * 2)
        
    }
    
    // Clear the canvas
    func clearCanvas() {
        
        // "Clear" the canvas after each draw
        canvas.drawShapesWithBorders = false
        canvas.drawShapesWithFill = true
        canvas.fillColor = .white
        canvas.drawRectangle(at: Point(x: 0, y: 0), width: canvas.width, height: canvas.height)
        canvas.drawShapesWithFill = false
        canvas.drawShapesWithBorders = true
        
    }
    
    // Bounce the agent when it hit's an edge
    func bounceAtEdge() {
        
        // Bounce at left and right edges
        if centre.x + CGFloat(radius) > CGFloat(canvas.width) || centre.x - CGFloat(radius) < 0 {
            velocity.x *= -1
        }
        
        // Bounce at top and bottom of scren
        if centre.y + CGFloat(radius) > CGFloat(canvas.height) || centre.y - CGFloat(radius) < 0 {
            velocity.y *= -1
        }

        
    }
    
}

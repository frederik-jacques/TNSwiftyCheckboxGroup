/*
 Copyright (c) 2015 Frederik Jacques <frederik@the-nerd.be>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

import UIKit

/**
 
 This class is used to show a square checkbox.
 
 Note: Styling is possible by setting your own class as the `styleDataSource` for the `TNSwiftyCheckboxViewController`. The key constants are defined in `TNSwiftyCheckboxStyleOptions`.
 
 */

class TNSwiftySquareCheckboxView: TNSwiftyCheckboxView {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    private var outerSquareShapeLayer:CAShapeLayer!
    private var innerSquareShapeLayer:CAShapeLayer!
    
    // MARK: - Initializers methods
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
    }
    
    // MARK: - Lifecycle methods
    override func prepareForReuse() {
        
        super.prepareForReuse()
        
    }
    
    override func setup() {
        
        if outerSquareShapeLayer == nil {
            createOuterSquare()
        }
        
        if innerSquareShapeLayer == nil {
            createInnerSquare()
        }
        
        super.setup()
        
    }
    
    // MARK: - Private methods
    /**
     This method will create the outer square of the checkbox.
     */
    private func createOuterSquare(){
        
        let rect = checkboxContentView.bounds
        
        outerSquareShapeLayer = CAShapeLayer()
        outerSquareShapeLayer.path = UIBezierPath(rect: rect).CGPath
        outerSquareShapeLayer.bounds = rect
        outerSquareShapeLayer.position = CGPoint(x: rect.midX, y: rect.midY)
        
        let color = styleOptions![TNSwiftyCheckboxStyleOptions.CheckboxOuterColor] as! UIColor
        outerSquareShapeLayer.fillColor = color.CGColor
        
        checkboxContentView.layer.addSublayer(outerSquareShapeLayer)
        
    }
    
    /**
     This method will create the inner square of the checkbox.
     */
    private func createInnerSquare(){
        
        let padding = styleOptions![TNSwiftyCheckboxStyleOptions.CheckboxPadding] as! Int
        
        let rect = checkboxContentView.bounds.insetBy(dx: CGFloat(padding), dy: CGFloat(padding))
        
        innerSquareShapeLayer = CAShapeLayer()
        innerSquareShapeLayer.path = UIBezierPath(rect: rect).CGPath
        innerSquareShapeLayer.bounds = rect
        
        let color = styleOptions![TNSwiftyCheckboxStyleOptions.CheckboxInnerColor] as! UIColor
        innerSquareShapeLayer.fillColor = color.CGColor
        
        innerSquareShapeLayer.position = CGPoint(x: rect.midX, y: rect.midY)
        checkboxContentView.layer.addSublayer(innerSquareShapeLayer)
        
    }
    
    // MARK: - Public methods
    /**
     This method is called when a cell has been touched.
     
     :param: checkValue  Check the checkbox
     :param: animated    Animate the change
     */
    override func checkCheckbox(checkValue: Bool, withAnimation animated: Bool) {
        
        let duration = checkValue ? 0.3 : 0.3
        let easing = checkValue ? UIViewAnimationOptions.CurveEaseIn : UIViewAnimationOptions.CurveEaseOut
        
        let scale:CGFloat = checkValue ? 1.0 : 0.01
        let opacity:Float = checkValue ? 1.0 : 0.0
        
        if( animated ) {
            
            UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options:easing , animations: { () -> Void in
                
                self.innerSquareShapeLayer.transform = CATransform3DMakeScale(scale, scale, scale)
                self.innerSquareShapeLayer.opacity = opacity
                
                }, completion: { (complete:Bool) -> Void in
                    
            })
            
        }else {
            
            // Disable the implicit animations
            CATransaction.setDisableActions(true)
            
            self.innerSquareShapeLayer.transform = CATransform3DMakeScale(scale, scale, scale)
            self.innerSquareShapeLayer.opacity = opacity
            
            CATransaction.setDisableActions(false)
        }
        
    }
    
    // MARK: - Getter & setter methods
    
    // MARK: - IBActions
    
    // MARK: - Target-Action methods
    
    // MARK: - Notification handler methods
    
    // MARK: - Datasource methods
    
    // MARK: - Delegate methods
    
}
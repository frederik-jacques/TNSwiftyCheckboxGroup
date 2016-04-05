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
 
 This class is used to show a circular checkbox.
 
 Note: Styling is possible by setting your own class as the `styleDataSource` for the `TNSwiftyCheckboxViewController`. The key constants are defined in `TNSwiftyCheckboxStyleOptions`.
 
 */

class TNSwiftyCircularCheckboxView: TNSwiftyCheckboxView {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    private var outerCircleShapeLayer:CAShapeLayer!
    private var innerCircleShapeLayer:CAShapeLayer!
    
    // MARK: - Initializers methods
    
    // MARK: - Lifecycle methods
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        // Set the indicator red background of the checkboxContentView to transparant. This is just to give a visual queue where the content view is in Interface Builder.
        checkboxContentView.backgroundColor = UIColor.clearColor()
    }
    
    override func setup() {
        
        if outerCircleShapeLayer == nil {
            createOuterCircle()
        }
        
        if innerCircleShapeLayer == nil {
            createInnerCircle()
        }
        
        super.setup()
    }
    
    // MARK: - Private methods
    /**
     This method will create the outer circle of the checkbox.
     */
    private func createOuterCircle() {
        
        let rect = checkboxContentView.bounds
        
        outerCircleShapeLayer = CAShapeLayer()
        outerCircleShapeLayer.path = UIBezierPath(ovalInRect: rect).CGPath
        outerCircleShapeLayer.bounds = rect
        outerCircleShapeLayer.position = CGPoint(x: rect.midX, y: rect.midY)
        
        let color = styleOptions![TNSwiftyCheckboxStyleOptions.CheckboxOuterColor] as! UIColor
        outerCircleShapeLayer.fillColor = color.CGColor
        
        checkboxContentView.layer.addSublayer(outerCircleShapeLayer)
        
    }
    
    /**
     This method will create the inner circle of the checkbox.
     */
    private func createInnerCircle() {
        
        let padding = styleOptions![TNSwiftyCheckboxStyleOptions.CheckboxPadding] as! Int
        
        let rect = checkboxContentView.bounds.insetBy(dx: CGFloat(padding), dy: CGFloat(padding))
        
        innerCircleShapeLayer = CAShapeLayer()
        innerCircleShapeLayer.path = UIBezierPath(ovalInRect: rect).CGPath
        innerCircleShapeLayer.bounds = rect
        innerCircleShapeLayer.position = CGPoint(x: rect.midX, y: rect.midY)
        
        let color = styleOptions![TNSwiftyCheckboxStyleOptions.CheckboxInnerColor] as! UIColor
        innerCircleShapeLayer.fillColor = color.CGColor
        
        checkboxContentView.layer.addSublayer(innerCircleShapeLayer)
        
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
                
                self.innerCircleShapeLayer.transform = CATransform3DMakeScale(scale, scale, scale)
                self.innerCircleShapeLayer.opacity = opacity
                
                }, completion: { (complete:Bool) -> Void in
                    
            })
            
        }else {
            
            // Disable the implicit animation
            CATransaction.setDisableActions(true)
            
            self.innerCircleShapeLayer.transform = CATransform3DMakeScale(scale, scale, scale)
            self.innerCircleShapeLayer.opacity = opacity
            
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
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
 
 This class is used to show an image as checkbox.
 
 Note: Styling is possible by setting your own class as the `styleDataSource` for the `TNSwiftyCheckboxViewController`. The key constants are defined in `TNSwiftyCheckboxStyleOptions`.
 
 */

class TNSwiftyImageCheckboxView: TNSwiftyCheckboxView {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    /// The image view to hold the image
    var imageView:UIImageView!
    
    // MARK: - Initializers methods
    
    // MARK: - Lifecycle methods
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        // Set the indicator red background of the checkboxContentView to transparant. This is just to give a visual queue where the content view is in Interface Builder.
        checkboxContentView.backgroundColor = UIColor.clearColor()
        
    }
    
    override func setup() {
        
        if imageView == nil {
            
            createImageView()
            setupConstraints()
            
        }
        
        super.setup()
        
    }
    
    // MARK: - Private methods
    /**
     This method will create the image view.
     */
    private func createImageView(){
        
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        checkboxContentView.addSubview(imageView)
        
    }
    
    /**
     Setup constraints for AutoLayout between the checkbox content view and its children
     */
    private func setupConstraints(){
        
        let views = [
            "imageView" : imageView
        ]
        
        let horizontalConstraintForImageView = NSLayoutConstraint.constraintsWithVisualFormat("H:|[imageView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        let verticalConstraintsForImageView = NSLayoutConstraint.constraintsWithVisualFormat("V:|[imageView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        
        checkboxContentView.addConstraints(horizontalConstraintForImageView)
        checkboxContentView.addConstraints(verticalConstraintsForImageView)
        
    }
    
    // MARK: - Public methods
    /**
     This method is called when a cell has been touched.
     
     :param: checkValue  Check the checkbox
     :param: animated    Animate the change
     */
    override func checkCheckbox(checkValue: Bool, withAnimation animated: Bool) {
        
        let nameForCheckedImage = styleOptions![TNSwiftyCheckboxStyleOptions.CheckboxCheckedImageName] as! String
        let nameForUncheckedImage = styleOptions![TNSwiftyCheckboxStyleOptions.CheckboxUncheckedImageName] as! String
        
        if let image = UIImage(named: (checkValue ? nameForCheckedImage : nameForUncheckedImage ) ){
            
            imageView.image = image
            
        }else {
            
            assertionFailure("Could not find the image with name \((checkValue ? nameForCheckedImage : nameForUncheckedImage )), please check your image assets catalog.")
            
        }
        
        
    }
    
    // MARK: - Getter & setter methods
    
    // MARK: - IBActions
    
    // MARK: - Target-Action methods
    
    // MARK: - Notification handler methods
    
    // MARK: - Datasource methods
    
    // MARK: - Delegate methods
    
    
}
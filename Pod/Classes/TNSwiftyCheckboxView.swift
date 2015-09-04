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

    This class serves as the base class for any additional checkbox classes you want to create.
    Just create a new UICollectionViewCell with a XIB and set the superclass to this class.

    There are already a few classes you can use to create different kinds of checkboxes:

    - TNSwiftySquareCheckboxView
    - TNSwiftyCircularCheckboxView
    - TNSwiftyImageCheckboxView

    When you subclass this class, you'll need to do the following steps:

    1. Set this class as the superclass in your CustomCheckboxView.swift file
    2. In your XIB add a UIView which will serve as the content view which will hold your checkbox thingie
        2.1 Add an outlet to this view (checkboxContentView)
    3. In your XIB add a UILabel which will serve as the label with the option
        3.1 Add an outlet to this label (nameLabel)
    4. In your XIB, set the reuseidentifier of the cell to the same name of the class
    5. Override `checkCheckbox(:checkValue:withAnimation)` and add your custom logic to handle the checking of your checkbox
    6. Override the `setup` method if you want to do any styling, if you want to automatically have the name label be setup for you, just call `super.setup()`.

*/


public class TNSwiftyCheckboxView: UICollectionViewCell {
    
    // MARK: - IBOutlets
    /**
        The IBOutlet for the checkbox view inside the cell.
    
        This view serves as a content view which you can use to create your own checkboxes.
    */
    @IBOutlet weak var checkboxContentView: UIView!
    
    /**
        The IBOutlet for the name label inside the cell
    */
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Properties
    var styleOptions:[String:AnyObject]?
    
    // MARK: - Initializers methods
    override public func awakeFromNib() {
        
        super.awakeFromNib()
        
    }
    
    // MARK: - Lifecycle methods
    
    // MARK: - Private methods
    
    // MARK: - Public methods
    public func setup(){
        
        nameLabel.font = styleOptions![TNSwiftyCheckboxStyleOptions.FontOfNameLabel] as! UIFont
        
        let color = styleOptions![TNSwiftyCheckboxStyleOptions.FontColorOfNameLabel] as! UIColor
        nameLabel.textColor = color
        
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .ByWordWrapping
        
        let width = styleOptions![TNSwiftyCheckboxStyleOptions.PreferredWidthOfNameLabel] as! CGFloat
        nameLabel.preferredMaxLayoutWidth = width
        
    }
    
    /**
        This method is called when a cell has been touched.
    
        Override this method in your own TNSwiftyCheckboxView subclasses.
    
        - parameter checkValue:  Check the checkbox
        - parameter animated:    Animate the change
    */
    public func checkCheckbox( checkValue:Bool, withAnimation animated:Bool ) {
        
        // Override this method in your custom CheckboxView class
        
    }
    
    // MARK: - Getter & setter methods
    
    // MARK: - IBActions
    
    // MARK: - Target-Action methods
    
    // MARK: - Notification handler methods
    
    // MARK: - Datasource methods
    
    // MARK: - Delegate methods
    
}

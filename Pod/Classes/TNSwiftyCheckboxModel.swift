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
    This class serves as the model for every checkbox.
*/
public class TNSwiftyCheckboxModel: NSObject {
   
    // MARK: - IBOutlets
    
    // MARK: - Properties
    
    /// Set the checked state of a checkbox
    public var checked:Bool
    
    /// Set the name that will appear in the name label
    public var name:String
    
    // MARK: - Initializers methods
    /**
    
        Create a new `TNSwiftyCheckboxModel` object with a name and checked state
    
        - parameter name: The name that will appear in the UILabel
        - parameter checked: Should the checkbox be checked or unchecked
    
    */
    public init( name:String, checked:Bool ) {
        
        self.name = name
        self.checked = checked
        
        super.init()
        
    }
    
    /**
        
        Create a new `TNSwiftyCheckboxModel` object with a name. The checkbox will be unchecked.
    
        - parameter name: The name that will appear in the UILabel
    
    */
    public convenience init( name:String ) {
        
        self.init( name: name, checked: false )
        
    }
       
    // MARK: - Lifecycle methods
    
    // MARK: - Private methods
    
    // MARK: - Public methods
    
    // MARK: - Getter & setter methods
    
    // MARK: - IBActions
    
    // MARK: - Target-Action methods
    
    // MARK: - Notification handler methods
    
    // MARK: - Datasource methods
    
    // MARK: - Delegate methods
    
}

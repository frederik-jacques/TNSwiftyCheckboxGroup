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
import TNSwiftyCheckboxGroup

class SquareCheckboxesViewController: UIViewController, TNSwiftyCheckboxViewStyleDataSource {

    // MARK: - IBOutlets
    
    // MARK: - Properties
    var checkboxVC:TNSwiftyCheckboxViewController!
    
    // MARK: - Initializers methods
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {

        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if( segue.identifier == "seg-square-checkboxes" ) {

            var checkboxModels = [
                
                TNSwiftyCheckboxModel(name: "Elephant with a very long proboscis", checked: false),
                TNSwiftyCheckboxModel(name: "Tiger", checked: true),
                TNSwiftyCheckboxModel(name: "Antilope", checked: false),
                TNSwiftyCheckboxModel(name: "Monkey", checked: true),
                TNSwiftyCheckboxModel(name: "Spider", checked: false)
            ]
            
            checkboxVC = segue.destinationViewController as! TNSwiftyCheckboxViewController
            checkboxVC.styleDataSource = self
            checkboxVC.checkboxModels = checkboxModels
            
        }
        
    }
    
    // MARK: - Private methods
    
    // MARK: - Public methods
    
    // MARK: - Getter & setter methods
    
    // MARK: - IBActions
    
    // MARK: - Target-Action methods
    
    // MARK: - Notification handler methods
    
    // MARK: - Datasource methods
    // MARK: TNSwiftyCheckboxViewStyleDataSource methods
    func styleDictionaryForCheckboxView() -> [String : AnyObject] {
        
        return [
            
            TNSwiftyCheckboxStyleOptions.CheckboxOuterColor : UIColor.redColor(),

        ]
        
    }
    // MARK: - Delegate methods

}

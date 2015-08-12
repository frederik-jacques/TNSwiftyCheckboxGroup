//
//  ProgrammaticViewController.swift
//  TNSwiftyCheckboxGroup
//
//  Created by Frederik Jacques on 11/08/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//

import UIKit
import TNSwiftyCheckboxGroup

class ProgrammaticViewController: UIViewController, TNSwiftyCheckboxViewControllerDelegate, TNSwiftyCheckboxViewStyleDataSource {

    // MARK: - IBOutlets
    
    // MARK: - Properties
    var checkboxVC:TNSwiftyCheckboxViewController!
    
    // MARK: - Initializers methods
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "Programmatic"
        view.backgroundColor = UIColor.whiteColor()
                
        createCheckboxViewController()
        setupConstraints()
    }
    
    override func didReceiveMemoryWarning() {
     
        super.didReceiveMemoryWarning()
     
    }
    
    // MARK: - Private methods
    private func createCheckboxViewController(){
    
        /* 
            Create an array of TNSwiftyCheckboxModel objects.
            This array will serve as the data source for the view controller.
            You can set the name of the label and whether or not it should be checked.
            When the checked argument is not set, the checkbox will default be unchecked.
        */
        var checkboxModels = [
            
            TNSwiftyCheckboxModel(name: "Elephant with a very long proboscis"),
            TNSwiftyCheckboxModel(name: "Tiger", checked: true),
            TNSwiftyCheckboxModel(name: "Antilope"),
            TNSwiftyCheckboxModel(name: "Monkey"),
            TNSwiftyCheckboxModel(name: "Spider"),
            TNSwiftyCheckboxModel(name: "Crocodile"),
            TNSwiftyCheckboxModel(name: "Anaconda"),
            TNSwiftyCheckboxModel(name: "Tapir"),
            TNSwiftyCheckboxModel(name: "Pirahna"),
            
        ]
        
        /*
            Create the view controller in code.
            If you want you can set the `styleDataSource` property if you want to override some styling options.
            If you want you can also set your class to act as the delegate of the checkbox view controller, so you can receive updates
            when a checkbox its value changed.
        
            Set the `checkboxModels` property, so the view controller know what it has to visualize.
            Then you add the view of the checkbox view controller to the view hierarchy of your own class
            Also call `didMoveToParentViewController`, so the checkbox view controller knows it is inside another view controller.
            This way orientation events are passed on to the view controller.
        */
        checkboxVC = TNSwiftyCheckboxViewController()
        checkboxVC.styleDataSource = self
        checkboxVC.delegate = self
        checkboxVC.checkboxModels = checkboxModels
        addChildViewController(checkboxVC)
        
        view.addSubview(checkboxVC.view)
        checkboxVC.didMoveToParentViewController(self)
        
    }
    
    private func setupConstraints(){
    
        let views = [
            
            "checkboxVC" : checkboxVC.view
            
        ]
        
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[checkboxVC]-|", options: NSLayoutFormatOptions(0), metrics: nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-[checkboxVC]-|", options: NSLayoutFormatOptions(0), metrics: nil, views: views)
    
        view.addConstraints(horizontalConstraints)
        view.addConstraints(verticalConstraints)
    
    }
    
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
            TNSwiftyCheckboxStyleOptions.CheckboxInnerColor : UIColor.whiteColor()
            
        ]
        
    }
    
    // MARK: - Delegate methods
    // MARK: TNSwiftyCheckboxViewControllerDelegate methods
    func swiftyCheckboxViewController(viewController: TNSwiftyCheckboxViewController, checkedValueChangedTo newCheckedValue: Bool, ofCheckboxModel checkboxModel: TNSwiftyCheckboxModel) {
        
        println("[ProgrammaticVC] Checkboxmodel \(checkboxModel.name) its value changed to \(newCheckedValue)")
        
    }

}

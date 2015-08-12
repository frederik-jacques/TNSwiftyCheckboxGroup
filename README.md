# TNSwiftyCheckboxGroup
###  A Swift component to easily create checkbox groups

[![Version](https://img.shields.io/cocoapods/v/TNSwiftyCheckboxGroup.svg?style=flat)](http://cocoapods.org/pods/TNSwiftyCheckboxGroup)
[![License](https://img.shields.io/cocoapods/l/TNSwiftyCheckboxGroup.svg?style=flat)](http://cocoapods.org/pods/TNSwiftyCheckboxGroup)
[![Platform](https://img.shields.io/cocoapods/p/TNSwiftyCheckboxGroup.svg?style=flat)](http://cocoapods.org/pods/TNSwiftyCheckboxGroup)

![Header image](http://cl.ly/image/06302o2o0O1n/tnswiftycheckboxgroup-no-title.jpg)

# What
TNSwiftyCheckboxGroup is a component to create checkbox groups based on UICollectionView. 

There are 3 predefined styles:
* Square checkboxes
* Circular checkboxes
* Image checkboxes

And there is an option to create your custom subclass and build your own checkbox type.

It works in both landscape and portrait.

# How to use

## Programmatically

Programmatically is a bit faster to set up because you don't have to juggle with Interface Builder.

1. Create the array with `TNSwiftyCheckboxModel` classes.

		var checkboxModels = [
    		
            TNSwiftyCheckboxModel(name: "Elephant with a very long proboscis", checked: false),
            TNSwiftyCheckboxModel(name: "Tiger", checked: true),
            TNSwiftyCheckboxModel(name: "Antilope", checked: false),
            TNSwiftyCheckboxModel(name: "Monkey", checked: true),
            TNSwiftyCheckboxModel(name: "Spider", checked: false)
            
		]
		
2. a) If you added this class via CocoaPods, you should import the module at the top of your class
		
		import TNSwiftyCheckboxGroup
		
2. b) Create an instance of `TNSwiftyCheckboxViewController` and add it to the view controller.

		checkboxVC = TNSwiftyCheckboxViewController()
		addChildViewController(checkboxVC)
        
        view.addSubview(checkboxVC.view)
        checkboxVC.didMoveToParentViewController(self)
        
3. Set the `checkboxModels` property with the array you created in step 1

		checkboxVC.checkboxModels = checkboxModels 


## Storyboards
To add TNSwiftyCheckboxGroup to your Storyboard, you'll have to do the following steps. Don't worry it will be over before you can say `Deoxyribonucleic acid` :-).

1. Drag a `Container View` object out of the *Object library* onto your scene. Set constraints on it like you prefer.

2. Remove the attached view controller (this will be automatically added when you add the container view).

3. Drag a `Collection View Controller` object out of the *Object library*. *Note: you can safely remove the prototype `UICollectionViewCell` Interface Builder added.*

4. Ctrl + drag from the container view controller to the UICollectionViewController and select the `embed` segue type.

5. Change the `Custom Class` property of the UICollectionView to `TNSwiftyCheckboxViewController`.

6. Now we need to feed the view controller an array with `TNSwiftyCheckboxModel` objects. To do this we are going to work with `prepareForSegue(_:sender:)`.  Select the *embed segue* you created in step 3 and go to the *Attribute inspector*.  Here you can set an identifier.

7. a) Open up you view controller class and implement the `prepareForSegue(_:sender:)` method.
7. b) If you added this class via CocoaPods, you should import the module at the top of your class

		import TNSwiftyCheckboxGroup

8. In this method we will first check for the correct segue.
    
		override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	
			if( segue.identifier == "YOUR-SEGUE-IDENTIFIER" ) {
        		
				// Add code for step 9 here

			}
	
		}
	
9. Create an array with `TNSwiftyCheckboxModel` object for every checkbox you want to be visualised.

		var checkboxModels = [
    		
            TNSwiftyCheckboxModel(name: "Elephant with a very long proboscis", checked: false),
            TNSwiftyCheckboxModel(name: "Tiger", checked: true),
            TNSwiftyCheckboxModel(name: "Antilope", checked: false),
            TNSwiftyCheckboxModel(name: "Monkey", checked: true),
            TNSwiftyCheckboxModel(name: "Spider", checked: false)
            
		]

10. The `TNSwiftyCheckboxViewController` can be referenced via the `segue.destinationViewController` property.

		checkboxVC = segue.destinationViewController as! TNSwiftyCheckboxViewController

11. Set the `checkboxModels` property with the array you created in step 9

		checkboxVC.checkboxModels = checkboxModels
		
12. That's it :-)

# Delegate
You can set your own class as the delegate of `TNSwiftyCheckboxViewController` if you want to be informed when a checkbox its value gets changed. Just make your class conform to `TNSwiftyCheckboxViewControllerDelegate`.

	class YourViewController: UIViewController, TNSwiftyCheckboxViewControllerDelegate {}
		

Implement the method `swiftyCheckboxViewController(viewController:checkedValueChangedTo:ofCheckboxModel:)`
	
# Style datasource
You can override the appearance of the class by setting your class to be the styling datasource.  This just returns a Dictionary with type [String:AnyObject].  The keys of this dictionary are defined in the struct `TNSwiftyCheckboxStyleOptions`.


| Key                             | Explanation |
| ------------------------------- | -----------:|
| CollectionViewWidthOfCell       | The width of the checkbox cell. Default: 150
| CollectionViewBackgroundColor   | The background color of the collection view. Default: White
| FontOfNameLabel                 | The font of the name label. Default: System 12pt
| FontColorOfNameLabel            | The font color of the name label. Default: #333333
| PreferredWidthOfNameLabel       | The preferred width for the name label. Default: 100
| CheckboxOuterColor              | The outer color for the built-in checkbox types. Default: #333333
| CheckboxInnerColor              | The outer color for the built-in checkbox types. Default: White
| CheckboxPadding                 | The padding between the inner and outer views of the build-in checkbox types. Default: 5
| CheckboxUncheckedImageName      | The image name for the unchecked image (defined in your image assets catalog), if you are using the `TNSwiftyImageCheckboxView` style. Default: *unchecked-image*
| CheckboxCheckedImageName        | The image name for the checked image (defined in your image assets catalog), if you are using the `TNSwiftyImageCheckboxView` style. Default: *checked-image*

For example:

	func styleDictionaryForCheckboxView() -> [String : AnyObject] {
    
    	return [
        
        TNSwiftyCheckboxStyleOptions.CheckboxOuterColor : UIColor.redColor(),

    	]
        
    }


# Convenience properties

* `uncheckedModels` : returns an array with all the `TNSwiftyCheckboxModel` objects that are currently in an *unchecked* state
 
* `checkedModels` : returns an array with all the `TNSwiftyCheckboxModel` objects that are currently in an *checked* state

# Convenience methods

The TNSwiftyCheckboxGroup class has some convenience methods to ask information about the current state of your group.

* `areAllCheckboxesChecked` : Returns a bool if all checkboxes are checked
* `areAllCheckboxesUnchecked` : Returns a bool if all checkboxes are unchecked

# Creating custom cells

It is also possible to create your own checkbox cells and register them with the TNSwiftyCheckboxViewController. These are the steps you have to take.

## Code part

1. Create a new class and subclass `UICollectionViewCell` and check the field *Also create XIB file*. For this example I will name the class *TriangleCollectionViewCell*.

2. Open up your *TriangleCollectionViewCell.swift* file

3. Add the import statement at the top of your file

		import TNSwiftyCheckboxGroup

4. Change the super class from `UICollectionViewCell` to `TNSwiftyCheckboxView`


## Interface Builder part

Before we continue, you can now create your custom checkbox view in Interface Builder.

1. Drag a UIView object from the *Object library* to your XIB file

2. Drag a UILabel object from the *Object library* to your XIB file

3. Give them constraints

4. Right click on the UIView you've created in step 1 and drag a referencing outlet to your Triangle Collection View Controller and choose `checkboxContentView`

5. Right click on the UILabel you've created in step 2 and drag a referencing outlet to your Triangle Collection View Controller and choose `nameLabel`

6. Select the top-level view (Triangle Collection View Cell) and go to the *Attribute inspector* to add a *Reuse Identifier*.  Just name it the same way as your class file (in this case *TriangleCollectionViewCell*)

## Back to the code part

Now we just have to register our custom checkbox class with the TNSwiftyCheckboxGroupViewController.
You do this by setting the `type` property to `.Custom` and register your own class by using the method `registerCustomViewWithClassName(:)`.

In your own view controller, add the following code. 

	let vc = segue.destinationViewController as! TNSwiftyCheckboxViewController
    vc.type = .Custom
    vc.registerCustomViewWithClassName("TriangleCollectionViewCell")
    vc.checkboxModels = checkboxModels

If you build and run you wil see your custom cells appear.  But there isn't any logic yet in your own class.  There are a few methods you can override to add more awesomeness to your cell.

* `setup()` : in this method you can add extra views in code or add animations.  Don't forget to call super.setup at the end of this method. This will automatically setup the `nameLabel`. Ofcourse if you want to do this on your own, don't call `super.setup()` :-)

* `checkCheckbox( checkValue:withAnimation: )` : This method gets called when a cell is (un)checked and is a good place to provide your own (un)checking animations.

# Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

# Installation

TNSwiftyCheckboxGroup is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TNSwiftyCheckboxGroup"
```

# Author

Frederik Jacques, frederik@the-nerd.be
* [Blog](http://www.the-nerd.be/blog)
* [Twitter](http://www.twitter.com/thenerd_be)

# License

TNSwiftyCheckboxGroup is available under the MIT license. See the LICENSE file for more info.

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
 
 Conform to this protocol by setting your own class as the delegate of the view controller if you want to be updated if a checkbox gets checked of unchecked.
 
 :param: viewController      the view controller
 :param: newCheckedValue     the new value of the checkbox model that has been changed
 :param: checkboxModel       the checkbox model that has been changed
 
 */
public protocol TNSwiftyCheckboxViewControllerDelegate:class {
    
    func swiftyCheckboxViewController( viewController:TNSwiftyCheckboxViewController, checkedValueChangedTo newCheckedValue:Bool, ofCheckboxModel checkboxModel:TNSwiftyCheckboxModel )
    
}

/**
 
 Conform to this protocol by setting your own class as the data source of the view controller if you want to override certain styling options.
 
 :returns: An option dictionary
 
 **Note:** The key constants are defined in the `TNSwiftyCheckboxStyleOptions` struct.
 
 */
public protocol TNSwiftyCheckboxViewStyleDataSource:class {
    
    func styleDictionaryForCheckboxView() -> [String : AnyObject]
    
}

/**
 
 Enum with the different types of checkboxes.
 
 */

public enum TNSwiftyCheckboxType:String {
    
    case Square = "TNSwiftySquareCheckboxView"
    case Circular = "TNSwiftyCircularCheckboxView"
    case Image = "TNSwiftyImageCheckboxView"
    case Custom = "TNSwiftyCustomView"
    
}

/**
 
 Struct with constants for the styling of a checkbox view.
 
 */

public struct TNSwiftyCheckboxStyleOptions {
    
    public static let CollectionViewWidthOfCell = "CollectionViewWidthOfCell"
    public static let CollectionViewBackgroundColor = "CollectionViewBackgroundColor"
    public static let FontOfNameLabel = "fontOfNameLabel"
    public static let FontColorOfNameLabel = "fontColorOfNameLabel"
    public static let PreferredWidthOfNameLabel = "preferredWidthOfNameLabel"
    public static let CheckboxOuterColor = "checkboxOuterColor"
    public static let CheckboxInnerColor = "checkboxInnerColor"
    public static let CheckboxPadding = "checkboxPadding"
    public static let CheckboxUncheckedImageName = "checkboxUncheckedImageName"
    public static let CheckboxCheckedImageName = "checkboxCheckedImageName"
    
}

public class TNSwiftyCheckboxViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    private var bundle:NSBundle {
        
        get {
            
            if( type == .Custom ){
                
                return NSBundle.mainBundle()
                
            }
            
            return NSBundle(forClass: self.classForCoder)
        }
        
    }
    
    
    private var layout = TNSwiftyCheckboxCustomLayout()
    
    /**
     Set your own class as the delegate of this class if you want to be informed about events.
     
     Your class should conform to the `TNSwiftyCheckboxViewControllerDelegate` protocol.
     */
    public weak var delegate:TNSwiftyCheckboxViewControllerDelegate?
    
    /**
     Set your own class as the style datasource of this class if you want to override any styling options
     
     Your class should conform to the `TNSwiftyCheckboxViewStyleDataSource` protocol.
     */
    public weak var styleDataSource:TNSwiftyCheckboxViewStyleDataSource?
    
    /**
     Set the type of the checkbox. You can choose between the following types
     
     - Square
     - Circular
     - Image
     - Custom
     
     It defaults to `Square`
     
     **Note:** If you set the type to 'Custom', you **must** register your own class via the `registerCustomViewWithClassName(:)` method.
     */
    public var type = TNSwiftyCheckboxType.Square {
        
        didSet {
            
            classNameToLoad = type.rawValue
            
        }
        
    }
    
    /**
     An options dictionary to set some styling on the checkbox view.
     
     The key constants are defined in the `TNSwiftyCheckboxStyleOptions` struct.
     
     - **CollectionViewBackgroundColor** : The background color of the collection view.
     - **CollectionViewWidthOfCell**     : The width for the cell.
     - **FontOfNameLabel**               : The font to use for the name UILabel. Defaults to SystemFont with size 14.
     - **FontColorOfNameLabel**          : The font color to use for the name UILabel. Defaults to dark gray (#333333).
     - **PreferredWidthOfNameLabel**     : The max width of the cell. Defaults to -1 (dynamic width).
     - **CheckboxOuterColor**            : The color for the outer border. Defaults to dark grey (#333333).
     - **CheckboxInnerColor**            : The color for the inner border. Defaults to white (#ffffff).
     - **CheckboxPadding**               : The padding between the inner and outer view. Defaults to 5.
     - **CheckboxUncheckedImageName**    : The image name for the unchecked image (defined in your image assets catalog if you are using the `TNSwiftyImageCheckboxView` style. Defaults to *unchecked-image*.
     - **CheckboxCheckedImageName**      : The image name for the checked image (defined in your image assets catalog if you are using the `TNSwiftyImageCheckboxView` style. Defaults to *checked-image*.
     
     */
    public var styleOptions:[String : AnyObject] {
        
        get {
            
            var styleDictionary:[String : AnyObject] = [
                TNSwiftyCheckboxStyleOptions.CollectionViewWidthOfCell : 150,
                TNSwiftyCheckboxStyleOptions.CollectionViewBackgroundColor : UIColor.whiteColor(),
                TNSwiftyCheckboxStyleOptions.FontOfNameLabel : UIFont.systemFontOfSize(14),
                TNSwiftyCheckboxStyleOptions.FontColorOfNameLabel : UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1.0),
                TNSwiftyCheckboxStyleOptions.PreferredWidthOfNameLabel : 100,
                TNSwiftyCheckboxStyleOptions.CheckboxOuterColor : UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1.0),
                TNSwiftyCheckboxStyleOptions.CheckboxInnerColor : UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0),
                TNSwiftyCheckboxStyleOptions.CheckboxPadding : 5,
                TNSwiftyCheckboxStyleOptions.CheckboxUncheckedImageName : "unchecked-image",
                TNSwiftyCheckboxStyleOptions.CheckboxCheckedImageName : "checked-image"
            ]
            
            if let styleDataSource = styleDataSource {
                
                let dataSourceOptions = styleDataSource.styleDictionaryForCheckboxView()
                
                /*  If there is a styling datasource provided, merge those keys with the ones of the default dictionary.
                 This way the user doesn't have to specify every key if he only wants to change one option   */
                styleDictionary = styleDictionary.merge(&styleDictionary, dict2: dataSourceOptions)
                
            }
            
            return styleDictionary
            
        }
        
    }
    
    /**
     The name of the checkbox subclass to load.
     */
    var classNameToLoad:String = TNSwiftyCheckboxType.Square.rawValue
    
    /**
     This property contains an array of `TNSwiftyCheckboxModel` objects which this class will use to visualize all the checkboxes.
     You have to set this property **before** the `viewDidLoad:` methods gets fired.
     
     A good place to do this is in the `prepareForSegue` method.
     When this property is set, the collectionview will reload its data.
     
     */
    public var checkboxModels:[TNSwiftyCheckboxModel]? {
        
        didSet {
            
            collectionView?.reloadData()
            
        }
        
    }
    
    /**
     This property gives you an array of `TNSwiftyCheckboxModel` objects which are currently checked.
     
     This can be useful if you want to add custom validation to your project, based on the checkboxes which are checked.
     */
    public var checkedModels:[TNSwiftyCheckboxModel]? {
        
        get {
            
            if let checkboxModels = checkboxModels {
                
                return checkboxModels.filter({ $0.checked })
                
            }
            
            return nil
            
        }
        
    }
    
    /**
     This property gives you an array of `TNSwiftyCheckboxModel` objects which are currently *not* checked.
     
     This can be useful if you want to add custom validation to your project, based on the checkboxes which are not checked.
     */
    public var uncheckedModels:[TNSwiftyCheckboxModel]? {
        
        get {
            
            if let checkboxModels = checkboxModels {
                
                return checkboxModels.filter({ !$0.checked })
                
            }
            
            return nil
            
        }
        
    }
    
    /// Dummy cell used to calculate the correct size of every cell.
    private var sizingCell:TNSwiftyCheckboxView!
    
    // MARK: - Initializers methods
    public init(){
        
        super.init(collectionViewLayout: layout)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    
    // MARK: - Lifecycle methods
    override public func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView?.collectionViewLayout = layout
        
        
        if let bundleURL = bundle.URLForResource("TNSwiftyCheckboxGroup", withExtension: "bundle") {
            
            if let bundle = NSBundle(URL: bundleURL) {
                
                // Load from Cocoapod bundle
                registerCellWithBundle( bundle )
                
            }
            
        }else {
            
            // Load from main bundle
            registerCellWithBundle( bundle )
            
        }
        
    }
    
    private func registerCellWithBundle( bundle:NSBundle ){
        
        let cellNib = UINib(nibName: classNameToLoad, bundle: bundle)
        self.collectionView!.registerNib(cellNib, forCellWithReuseIdentifier: classNameToLoad)
        
        sizingCell = cellNib.instantiateWithOwner(nil, options: nil)[0] as! TNSwiftyCheckboxView
        
        collectionView!.backgroundColor = styleOptions[TNSwiftyCheckboxStyleOptions.CollectionViewBackgroundColor] as? UIColor
        
    }
    
    override public func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - Private methods
    /**
     
     This method will configure the cell for a given indexpath.
     In this method the label or image gets set.
     
     :param: cell        The cell that needs to be configured
     :param: indexPath   The indexPath of the cell which needs to be configured
     
     */
    private func configureCell( cell:TNSwiftyCheckboxView, forIndexPath indexPath:NSIndexPath ) {
        
        let checkboxModel = checkboxModels![indexPath.row]
        
        // Apply styling to the cell and set it up
        cell.styleOptions = styleOptions
        cell.setup()
        
        cell.nameLabel.text = checkboxModel.name
        
        cell.checkCheckbox( checkboxModel.checked, withAnimation: false )
        
    }
    
    // MARK: - Public methods
    
    /**
     Use this method to register the class name of your custom checkbox view
     
     :param: className The name of the class
     */
    public func registerCustomViewWithClassName( className:String ) {
        
        self.classNameToLoad = className
        
    }
    
    /**
     Convenience method to check if all checkboxes are checked.
     
     :returns: Boolean
     */
    public func areAllCheckboxesChecked() -> Bool {
        
        return (checkedModels!.count == checkboxModels!.count)
        
    }
    
    /**
     Convenience method to check if all checkboxes are unchecked.
     
     :returns: Boolean
     */
    public func areAllCheckboxesUnchecked() -> Bool {
        
        return (uncheckedModels!.count == checkboxModels!.count)
        
    }
    
    // MARK: - Getter & setter methods
    
    // MARK: - IBActions
    
    // MARK: - Target-Action methods
    
    // MARK: - Notification handler methods
    
    // MARK: - Datasource methods
    
    
    // MARK: UICollectionViewDataSource methods
    override public func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    override public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let checkboxModels = checkboxModels {
            
            return checkboxModels.count
            
        }
        
        return 0
    }
    
    override public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(classNameToLoad, forIndexPath: indexPath) as! TNSwiftyCheckboxView
        
        self.configureCell(cell, forIndexPath: indexPath)
        
        return cell
    }
    
    // MARK: - Delegate methods
    // MARK: UICollectionViewDelegate
    override public func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        // Update model
        let checkboxModel = checkboxModels![indexPath.row]
        checkboxModel.checked = !checkboxModel.checked
        
        // Update cell
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! TNSwiftyCheckboxView
        cell.checkCheckbox( checkboxModel.checked, withAnimation: true)
        
        // Let the delegate know that a value has changed
        self.delegate?.swiftyCheckboxViewController(self, checkedValueChangedTo: checkboxModel.checked, ofCheckboxModel: checkboxModel)
        
    }
    
    // MARK: UICollectionViewDelegateFlowLayout methods
    public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        self.configureCell(sizingCell, forIndexPath: indexPath)
        
        let widthOfCell = styleOptions[TNSwiftyCheckboxStyleOptions.CollectionViewWidthOfCell] as! CGFloat
        
        return CGSizeMake(widthOfCell, sizingCell.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height)
        
    }
    
    public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsZero
        
    }
    
    public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 8
        
    }
    
    public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 8
        
    }
    
    public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSizeZero
        
    }
    
    public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSizeZero
        
    }
    
}
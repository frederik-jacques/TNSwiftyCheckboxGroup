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

// Custom layout class based onthe answer of Kevin R.
// http://stackoverflow.com/questions/13017257/how-do-you-determine-spacing-between-cells-in-uicollectionview-flowlayout

import UIKit

public class TNSwiftyCheckboxCustomLayout: UICollectionViewFlowLayout {
    
    var maximumCellSpacing = CGFloat(9.0)
    
    override public func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let attributesToReturn = super.layoutAttributesForElementsInRect(rect)! as [UICollectionViewLayoutAttributes]
        
        for attributes in attributesToReturn ?? [] {
            
            if attributes.representedElementKind == nil {
                
                attributes.frame = self.layoutAttributesForItemAtIndexPath(attributes.indexPath)!.frame
                
            }
            
        }
        
        return attributesToReturn
        
    }
    
    override public func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        
        let currentAttributes = super.layoutAttributesForItemAtIndexPath(indexPath)
        
        let sectionInset = (self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout).sectionInset
        
        if indexPath.item == 0 {
            
            let currentFrame = currentAttributes!.frame
            currentAttributes!.frame = CGRect(x: sectionInset.left, y: currentFrame.origin.y, width: currentFrame.width, height: currentFrame.height)
            
            return currentAttributes
        }
        
        let previousIndexPath = NSIndexPath(forItem: indexPath.item-1, inSection: indexPath.section)
        let previousFrame = self.layoutAttributesForItemAtIndexPath(previousIndexPath)!.frame
        let prevFrameRightPoint = previousFrame.origin.x + previousFrame.size.width + maximumCellSpacing
        
        let currentFrame = currentAttributes!.frame
        
        let stretchedCurrentFrame = CGRect(x: 0, y: currentFrame.origin.y, width: self.collectionView!.frame.width, height: currentFrame.height)
        
        if CGRectIntersectsRect(previousFrame, stretchedCurrentFrame) {
            
            currentAttributes!.frame = CGRect(x: prevFrameRightPoint, y: currentFrame.origin.y, width: currentFrame.width, height: currentFrame.height)
            
        } else {
            
            currentAttributes!.frame = CGRect(x: sectionInset.left, y: currentFrame.origin.y, width: currentFrame.width, height: currentFrame.height)
            
        }
        
        return currentAttributes
        
    }
    
}

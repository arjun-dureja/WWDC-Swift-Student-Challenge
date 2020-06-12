import Foundation
import UIKit

public class SortingView {
    
    //View for the sorting algorithms
    public class func setupView(title: String, description: String, descriptionYPos: Int, descriptionFontSize: Int, rects: inout [Rectangle]) -> UIView {
        
        //Setup view
        let view = UIView()
        view.backgroundColor = .customGray
        let titleLabel = UILabel(frame: CGRect(x: 52, y: 500, width: 20, height: 50))
        titleLabel.text = title
        titleLabel.textColor = .systemBlue
        titleLabel.font = UIFont(name: "Noteworthy-Bold", size: 46)
        titleLabel.sizeToFit()
        titleLabel.transform = CGAffineTransform(scaleX: 1, y: -1)
        view.addSubview(titleLabel)
        
        let descriptionLabel = UILabel(frame: CGRect(x: 52, y: descriptionYPos, width: 300, height: 50))
        descriptionLabel.text = description
        descriptionLabel.textColor = .white
        descriptionLabel.font = UIFont(name: "Noteworthy-Bold", size: CGFloat(descriptionFontSize))
        descriptionLabel.numberOfLines = 0
        descriptionLabel.sizeToFit()
        descriptionLabel.transform = CGAffineTransform(scaleX: 1, y: -1)
        view.addSubview(descriptionLabel)
        
        
        //Generate rectangles with random heights
        var x = 400
        var prevHeights = [Int]()
        for _ in 0..<6 {
            //Confirms that each rectangle has atleast a difference of 30 in height
            var height = 0
            loop:
            while true {
                height = Int.random(in: 35...300)
                for i in 0..<prevHeights.count {
                    if abs(height - prevHeights[i]) < 30 {
                        continue loop
                    }
                }
                prevHeights.append(height)
                break
            }
            let rect = Rectangle(frame: CGRect(x: x, y: 190, width: 40, height: height))
            rect.backgroundColor = .customPurple
            rects.append(rect)
            
            //Number label at bottom of rectangle - shows the height
            let label = UILabel(frame: CGRect(x: 10, y: -10, width: 20, height: 50))
            label.transform = CGAffineTransform(scaleX: 1, y: -1)
            label.text = "\(Int(rect.frame.height))"
            label.font = UIFont(name: "Noteworthy-Bold", size: 14)
            label.sizeToFit()
            label.textColor = .white
            rect.addSubview(label)
            x+=50
        }
        
        //Add rectangles to view
        for i in 0..<rects.count {
            view.addSubview(rects[i])
        }
        
        //Flip view upside down so that rects look better
        view.transform = CGAffineTransform(scaleX: 1, y: -1)
        return view
    }
    
    //Setup the custom styled button
    public class func setupButton(title: String) -> UIButton {
        let sortButton = UIButton(frame: CGRect(x: 510, y: 140 , width: 70, height: 35))
        sortButton.setTitle(title, for: .normal)
        sortButton.backgroundColor = .systemBlue
        sortButton.layer.cornerRadius = 10
        sortButton.titleLabel!.font = UIFont(name: "Noteworthy-Bold", size: 20)
        sortButton.transform = CGAffineTransform(scaleX: 1, y: -1)
        return sortButton
    }
}


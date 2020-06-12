import UIKit

//Model for a rectangle
public class Rectangle: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override func draw(_ rect: CGRect) {
        let path = UIBezierPath(rect: rect)
        path.stroke()
    }
}

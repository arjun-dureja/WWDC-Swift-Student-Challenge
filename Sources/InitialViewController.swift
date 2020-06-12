import UIKit
import PlaygroundSupport

public class InitialViewController: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup view
        let view = UIView()
        view.backgroundColor = .customGray
        let titleLabel = UILabel(frame: CGRect(x: 52, y: 25, width: 20, height: 50))
        titleLabel.text = "Sorting Algorithms"
        titleLabel.textColor = .customPink
        titleLabel.font = UIFont(name: "Noteworthy-Bold", size: 46)
        titleLabel.sizeToFit()
        
        let introLabel = UILabel(frame: CGRect(x: 52, y: 130, width: 550, height: 50))
        introLabel.text = """
                          Algorithms are the building blocks of computer programs.
                          They are as important to programming as recipes are to cooking.
                          They are a series of steps that produce a desired output.\n
                          This playground is a quick introduction to sorting algorithms.
                          You will learn about three different algorithms and how they compare to each other.
                          
                          """
        introLabel.textColor = .white
        introLabel.font = UIFont(name: "Noteworthy-Bold", size: 20)
        introLabel.numberOfLines = 0
        introLabel.sizeToFit()
        
        let nextButton = SortingView.setupButton(title: "Begin")
        nextButton.frame.origin.x = 52
        nextButton.frame.origin.y = 400
        nextButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
        nextButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        
        view.addSubview(titleLabel)
        view.addSubview(introLabel)
        view.addSubview(nextButton)
        self.view = view
    }
    
    
    @objc func nextPressed() {
        let vc = TimeComplexityViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}

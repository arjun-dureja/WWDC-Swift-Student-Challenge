import UIKit
import PlaygroundSupport

public class TimeComplexityViewController: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup view
        let view = UIView()
        view.backgroundColor = .customGray
        let titleLabel = UILabel(frame: CGRect(x: 52, y: 25, width: 20, height: 50))
        titleLabel.text = "Time Complexity"
        titleLabel.textColor = .systemBlue
        titleLabel.font = UIFont(name: "Noteworthy-Bold", size: 46)
        titleLabel.sizeToFit()
        
        let introLabel = UILabel(frame: CGRect(x: 52, y: 100, width: 300, height: 50))
        introLabel.text = """
                          Before getting started with sorting algorithms, lets learn a little bit about time complexity. \
                          The time complexity of an algorithm quantifies the amount of time it takes for an algorithm \
                          to run based on the length of the input. \n
                          We can quantify this using Big O Notation, which is a way to describe how fast functions grow. If you take a look at the chart on the right, you can see the growth of common time complexities. The ones with a lower growth, are considered to be faster.
                          """
        introLabel.textColor = .white
        introLabel.font = UIFont(name: "Noteworthy-Bold", size: 20)
        introLabel.numberOfLines = 0
        introLabel.sizeToFit()
        
        let nextButton = SortingView.setupButton(title: "Next")
        nextButton.frame.origin.x = 515
        nextButton.frame.origin.y = 485
        nextButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
        nextButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        
        //Import chart - drawn from iPad
        let chart = UIImageView(frame: CGRect(x: 385, y: 150, width: 325, height: 325))
        chart.image = UIImage(named: "Chart.jpeg")
        chart.layer.masksToBounds = true
        chart.layer.cornerRadius = 20
        
        view.addSubview(titleLabel)
        view.addSubview(introLabel)
        view.addSubview(nextButton)
        view.addSubview(chart)
        self.view = view
    }
    
    
    @objc func nextPressed() {
        //Show bubble sort view controller when next is pressed
        let vc = BubbleSortViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}

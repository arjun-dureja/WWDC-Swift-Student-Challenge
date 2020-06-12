import UIKit
import PlaygroundSupport

public class EndViewController: UIViewController {
    
    //Properties to sort
    var rects = [Rectangle]()
    var swaps = [Int]()
    var timer: Timer?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup view
        let view = UIView()
        view.backgroundColor = .customGray
        
        let titleLabel = UILabel(frame: CGRect(x: 52, y: 500, width: 20, height: 50))
        titleLabel.text = "The End"
        titleLabel.textColor = .systemBlue
        titleLabel.font = UIFont(name: "Noteworthy-Bold", size: 46)
        titleLabel.sizeToFit()
        titleLabel.transform = CGAffineTransform(scaleX: 1, y: -1)
        view.addSubview(titleLabel)
        
        let descriptionLabel = UILabel(frame: CGRect(x: 52, y: 20, width: 350, height: 50))
        descriptionLabel.text = """
                                This marks the end of the Playground.
                                You learned five new things today!: \n
                                \u{2022} Time Complexity
                                \u{2022} Big O Notation
                                \u{2022} Bubble Sort
                                \u{2022} Insertion Sort
                                \u{2022} Quick Sort \n
                                Hopefully this knowledge has been valuable to you and you are now inspired to learn more!
                                As a bonus, check out how Quick Sort works on a large list of numbers ->
                                Thank you for viewing my Playground.
                                -Arjun Dureja
                                """
        descriptionLabel.textColor = .white
        descriptionLabel.font = UIFont(name: "Noteworthy-Bold", size: 19)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.sizeToFit()
        descriptionLabel.transform = CGAffineTransform(scaleX: 1, y: -1)
        view.addSubview(descriptionLabel)
        
        //Generate rects to sort with random heights
        var x = 410
        for _ in 0..<50 {
            let height = Int.random(in: 35...400)
            let rect = Rectangle(frame: CGRect(x: x, y: 150, width: 5, height: height))
            rect.backgroundColor = .customPurple
            rects.append(rect)
            x+=7
        }
        
        //Add rects to view
        for i in 0..<rects.count {
            view.addSubview(rects[i])
        }
        
        //Flip view upside down so that rects look better
        view.transform = CGAffineTransform(scaleX: 1, y: -1)
        self.view = view
        
        //Sort button which calls sortPressed
        let sortButton = SortingView.setupButton(title: "Sort")
        sortButton.frame.origin.y = 100
        sortButton.frame.origin.x = 550
        sortButton.addTarget(self, action: #selector(sortPressed), for: .touchUpInside)
        sortButton.transform = CGAffineTransform(scaleX: 1, y: -1)
        view.addSubview(sortButton)
    }
    
    @objc func sortPressed(_ sender: UIButton) {
        sender.isHidden = true
        
        //Get quick sort swaps
        self.swaps = SortingAlgorithms.quickSort(rects: rects)
        PlaygroundPage.current.needsIndefiniteExecution = true
        
        //Timer to call sort every 0.05 seconds
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(sort), userInfo: nil, repeats: true)
    }
    
    //Function called every 0.05 seconds, performs one swap
    var i = 0
    @objc func sort() {
        //Checks if swapping is complete
        if i >= swaps.count {
            timer?.invalidate()
            
            for i in 0..<rects.count {
                rects[i].backgroundColor = .customGreen
            }
            return
        }
        
        //Swap elements
        let temp = rects[swaps[i]].frame.origin.x
        let first = self.rects[self.swaps[self.i]]
        let second = self.rects[self.swaps[self.i+1]]
        
        //Perform swapping animation
        UIView.animate(withDuration: 0.025, animations: {
            first.backgroundColor = .customGreen
            second.backgroundColor = .customGreen
            
            self.rects[self.swaps[self.i]].frame.origin.x = self.rects[self.swaps[self.i+1]].frame.origin.x
            self.rects[self.swaps[self.i+1]].frame.origin.x = temp
        }, completion: {
            (value: Bool) in
            first.backgroundColor = .customPurple
            second.backgroundColor = .customPurple
        })
        
        //Swap elements in array
        let tmp = rects[swaps[i]]
        rects[swaps[i]] = rects[swaps[i+1]]
        rects[swaps[i+1]] = tmp
        
        //Increment index by 2 for next swap
        i+=2
    }
}

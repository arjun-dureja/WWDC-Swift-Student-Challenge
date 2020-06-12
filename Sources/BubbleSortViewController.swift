import UIKit
import PlaygroundSupport

public class BubbleSortViewController: UIViewController {
    
    //Class properties needed for sorting
    var rects = [Rectangle]()
    var swaps = [Int]()
    var timer: Timer?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup view using SortingView
        let description = """
        Bubble Sort is one of the simplest and slowest sorting algorithms. It repeatedly steps through the list, \
        compares elements next to eachother, and swaps them if needed. \n
        The time complexity of this algorithm is O(n\u{00B2}). This is because it needs to make n\u{00B2} comparisons.
        """
        
        let view = SortingView.setupView(title: "Bubble Sort", description: description, descriptionYPos: 170, descriptionFontSize: 20, rects: &rects)
        self.view = view
        
        let sortButton = SortingView.setupButton(title: "Sort")
        sortButton.addTarget(self, action: #selector(sortPressed), for: .touchUpInside)
        view.addSubview(sortButton)
    }
    
    @objc func sortPressed(_ sender: UIButton) {
        sender.isHidden = true
        
        //Get swaps from SortingAlgorithms
        self.swaps = SortingAlgorithms.bubbleSort(rects: rects)
        PlaygroundPage.current.needsIndefiniteExecution = true
        
        //Set a timer to swap every second
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(sort), userInfo: nil, repeats: true)
    }
    
    //Function called every second, which does one swap
    var i = 0
    @objc func sort() {
        //Checks if swaps are finished
        if i >= swaps.count {
            timer?.invalidate()
            
            for i in 0..<rects.count {
                rects[i].backgroundColor = .customGreen
            }
            
            //Show next button
            let nextButton = SortingView.setupButton(title: "Next")
            nextButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
            view.addSubview(nextButton)
            return
        }
        
        //Swap elements
        let temp = rects[swaps[i]].frame.origin.x
        let first = self.rects[self.swaps[self.i]]
        let second = self.rects[self.swaps[self.i+1]]
        
        //Perform swapping animation
        UIView.animate(withDuration: 0.5, animations: {
            first.backgroundColor = .customGreen
            second.backgroundColor = .customGreen
            
            self.rects[self.swaps[self.i]].frame.origin.x = self.rects[self.swaps[self.i+1]].frame.origin.x
            self.rects[self.swaps[self.i+1]].frame.origin.x = temp
        }, completion: {
            (value: Bool) in
            first.backgroundColor = .customPurple
            second.backgroundColor = .customPurple
        })
        
        //Perform swap within array
        let tmp = rects[swaps[i]]
        rects[swaps[i]] = rects[swaps[i+1]]
        rects[swaps[i+1]] = tmp
        
        //Increase index by 2 to perform next swap
        i+=2
    }
    
    @objc func nextPressed() {
        //Go to Insertion Sort for the next view
        let vc = InsertionSortViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

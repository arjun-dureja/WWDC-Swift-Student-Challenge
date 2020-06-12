import UIKit
import PlaygroundSupport

public class InsertionSortViewController: UIViewController {

    //Properties for sorting
    var rects = [Rectangle]()
    var swaps = [Int]()
    var timer: Timer?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup view
        let description = """
        Insertion Sort is slightly more complicated than Bubble Sort, but still quite slow. \
        It iterates through the list moving elements to their sorted position, slowly growing a sorted list. This continues until no elements remain. It is similar to how we would sort a deck of cards. \n
        The time complexity of this algorithm is still O(n\u{00B2}). In practise however, it is known to be a little faster than Bubble Sort.
        """
        
        let view = SortingView.setupView(title: "Insertion Sort", description: description, descriptionYPos: 85, descriptionFontSize: 20, rects: &rects)
        self.view = view
        
        let sortButton = SortingView.setupButton(title: "Sort")
        sortButton.addTarget(self, action: #selector(sortPressed), for: .touchUpInside)
        view.addSubview(sortButton)
    }
    
    @objc func sortPressed(_ sender: UIButton) {
        sender.isHidden = true
        
        //Get insertion sort swaps from SortingAlgorithms
        self.swaps = SortingAlgorithms.insertionSort(rects: rects)
        PlaygroundPage.current.needsIndefiniteExecution = true
        
        //Timer that calls function every second to sort
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(sort), userInfo: nil, repeats: true)
    }
    
    //Function called every second, performs a swap
    var i = 0
    @objc func sort() {
        //Checks if swaps are finished
        if i >= swaps.count {
            timer?.invalidate()
            
            for i in 0..<rects.count {
                rects[i].backgroundColor = .customGreen
            }
            
            let nextButton = SortingView.setupButton(title: "Next")
            nextButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
            view.addSubview(nextButton)
            return
        }
        
        //Perform swap
        let temp = rects[swaps[i]].frame.origin.x
        let first = self.rects[self.swaps[self.i]]
        let second = self.rects[self.swaps[self.i+1]]
        
        //Animate swap
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
        
        //Perform swap in array
        let tmp = rects[swaps[i]]
        rects[swaps[i]] = rects[swaps[i+1]]
        rects[swaps[i+1]] = tmp
        
        //Increment index by 2 for next swap
        i+=2
    }
    
    @objc func nextPressed() {
        //Push quick sort view controller if next button is pressed
        let vc = QuickSortViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

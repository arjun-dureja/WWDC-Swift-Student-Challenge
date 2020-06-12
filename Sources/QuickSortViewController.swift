import UIKit
import PlaygroundSupport

public class QuickSortViewController: UIViewController {
    
    //Properties for sorting
    var rects = [Rectangle]()
    var swaps = [Int]()
    var timer: Timer?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup view
        let description = """
        Quick Sort is one of the most complicated and fastest sorting algorithms. \
        It is a "divide and conquer" algorithm, meaning that it breaks the list down into multiple sub-lists to sort it. Quick Sort creates two empty arrays to hold elements and selects a value called the "pivot". One of the two arrays will hold all the values less than the pivot, and the other will hold all the values greater than the pivot. These sub-arrays are then sorted recursively.  \n
        The time complexity of this algorithm is
        O(n log n). This is because the recursive part of the algorithm ends up building a tree-like structure which is log n in height, and the algorithm goes through this tree n times. This is significanly faster than Bubble Sort or Insertion Sort which is why it is one of the most commonly used sorting algorithms.
        """
        
        let view = SortingView.setupView(title: "Quick Sort", description: description, descriptionYPos: 30, descriptionFontSize: 15, rects: &rects)
        self.view = view
        
        let sortButton = SortingView.setupButton(title: "Sort")
        sortButton.addTarget(self, action: #selector(sortPressed), for: .touchUpInside)
        view.addSubview(sortButton)
    }
    
    @objc func sortPressed(_ sender: UIButton) {
        sender.isHidden = true
        
        //Get quick sort swaps from SortingAlgorithms
        self.swaps = SortingAlgorithms.quickSort(rects: rects)
        PlaygroundPage.current.needsIndefiniteExecution = true
        
        //Timer to call function every second to sort
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(sort), userInfo: nil, repeats: true)
    }
    
    //Function called every second, performs a swap
    var i = 0
    @objc func sort() {
        //Check if swaps are finished
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
        
        //Perform a swap
        let temp = rects[swaps[i]].frame.origin.x
        let first = self.rects[self.swaps[self.i]]
        let second = self.rects[self.swaps[self.i+1]]
        
        //Animate the swap
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
        
        //Increment the index for the next swap
        i+=2
    }
    
    @objc func nextPressed() {
        //Push end view controller if next button is pressed
        let vc = EndViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

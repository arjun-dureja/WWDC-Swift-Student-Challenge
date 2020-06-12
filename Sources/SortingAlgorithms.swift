import Foundation

//Sorting algorithms - written from scratch
public class SortingAlgorithms {
    
    //Insertion Sort
    public class func insertionSort(rects: [Rectangle]) -> [Int] {
        var swaps = [Int]()
        var temp = rects
        
        for i in 1..<temp.count {
            var j = i
            while j > 0 && temp[j].frame.height < temp[j-1].frame.height {
                swaps.append(j-1)
                swaps.append(j)
                temp.swapAt(j - 1, j)
                j -= 1
            }
         }
        
        return swaps
    }
    
    //Bubble Sort
    public class func bubbleSort(rects: [Rectangle]) -> [Int] {
        var swaps = [Int]()
        var temp = rects
        
        for i in 0..<temp.count {
            for j in 1..<temp.count - i {
                if temp[j].frame.height < temp[j-1].frame.height {
                    swaps.append(j-1)
                    swaps.append(j)
                    temp.swapAt(j - 1, j)
                }
            }
        }
        
        return swaps
    }
    
    //Quick Sort
    public class func quickSort(rects: [Rectangle]) -> [Int] {
        var temp = rects
        var swaps = [Int]()
        
        func quicksortMain(low: Int, high: Int){
            guard low < high else { return }
            let p = quicksortPartition(low: low, high: high)
            quicksortMain(low: low, high: p-1)
            quicksortMain(low: p+1, high: high)
        }
        
        func quicksortPartition(low: Int, high: Int) -> Int {
            let pivot = temp[high].frame.height
            var i = low
            for j in low..<high {
                if temp[j].frame.height < pivot {
                    swaps.append(i)
                    swaps.append(j)
                    temp.swapAt(i, j)
                    if i != j {

                    }
                    i += 1
                }
            }
            swaps.append(i)
            swaps.append(high)
            temp.swapAt(i, high)
            return i
        }
        
        func randHigh(min: Int, max: Int) -> Int {
            let k = Int(arc4random_uniform(UInt32(max-min))) + min
            return k
        }
        
        quicksortMain(low: 0, high: temp.count-1)
        
        return swaps
    }
}

//
//  BubbleSort.swift
//  Algorithms
//
//  Created by Sergey Koriukin on 22/04/2019.
//  Copyright © 2019 Sergey Koriukin. All rights reserved.
//

import Foundation


var list2 = [5,2,7,34,87,43,1,12,8]

func bubbleSort (array:inout[Int]) -> [Int] {
    
    let size = array.count
    
    for i in 0..<size {
        
        var pass = (size - 1) - i
        
        for j in 0..<pass {
            
            var key = array[j]
            
            if key > array[j + 1] {
                
                
                let tmp = array[j + 1]
                array[j + 1] = key
                array[j] = tmp
            }
        }
    }
    
    return array
}

print("было :", list2)
print("стало :", bubbleSort (array: &(list2)))

/*func bubbleSort<T: Comparable>(_ array: inout [T]) {
 for i in 0..<array.count {
 for j in 1..<array.count-i {
 if array[j-1] > array[j] {
 swap(&array[j-1], &array[j])
 }
 }
 }
 }
 */


func bubbleSortEfficient<T: Comparable>(_ array: inout [T]) {
    array.withUnsafeMutableBufferPointer { buffer in
        for n in buffer.startIndex..<buffer.endIndex {
            for i in 1..<(buffer.count - n) {
                if buffer[i - 1] > buffer[i] {
                    swap(&buffer[i - 1], &buffer[i])
                }
            }
        }
    }
}


print("было 2:", list2)
print("стало 2:", bubbleSortEfficient(&(list2)))

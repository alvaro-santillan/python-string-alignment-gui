//
//  main.swift
//  sdfg
//
//  Created by Álvaro Santillan on 8/3/20.
//  Copyright © 2020 Álvaro Santillan. All rights reserved.
//

import Foundation

func alignStrings(newStartString: [String], newEndString: [String], insertCost: Int, deleteCost: Int, subCost: Int) -> [[Int]] {
    // Modify the strings and create a matrix of the corret size with np.inf for every cell.
//    let startString = "-" + startString
//    let endString = "-" + endString
//    let newEndString = endString.components(separatedBy: "")
//    let newStartString = endString.components(separatedBy: "")
    
    var costMatrix = [[Int]]()
    
    for x in 0...newStartString.count - 1 {
        var tempArray = [Int]()
        for y in 0...newEndString.count - 1 {
            tempArray.append(9)
        }
        costMatrix.append(tempArray)
    }

    // For loop to update matrix to correct values.
    for x in 0...newStartString.count - 1 {
//        print("yy" + String(y))
        for y in 0...newEndString.count - 1 {
            var diagonal = 9
            var topPlusCost = 9
            var leftPlusCost = 9
            var diagonalPlusCost = 9
            
            if (y-1 > -1) && (x-1 > -1) {
                diagonal = costMatrix[y-1][x-1]
            }
            
            if (y-1 > -1) {
                diagonalPlusCost = diagonal + subCost
            }
            
            if (y-1 > -1) {
                topPlusCost = costMatrix[y-1][x] + deleteCost
            }
            
            if (x-1 > -1) {
                leftPlusCost = costMatrix[y][x-1] + insertCost
            }
            else {
//                print(x,y)
                leftPlusCost = 1
            }
//            print(diagonal,topPlusCost,leftPlusCost,diagonalPlusCost)
//            print("---")
            
            // Populate first spot with 0 runs once.
            if newEndString[x] == "-" && newStartString[y] == "-" {
                costMatrix[y][x] = 0
//                print("a", costMatrix[y][x])
            // Populate the first x and y columns in the matrix.
            }
            else if newEndString[x] == "-" {
                costMatrix[y][x] = y * deleteCost
//                print("b", costMatrix[y][x])
            }
            else if newEndString == ["-"] {
                costMatrix[y][x] = y * insertCost
            // Append the smallest value while taking into consideration if the diagonal is a no-op or a sub.
            }
            else if newEndString[x] == newStartString[y] {
                costMatrix[y][x] = min(topPlusCost, leftPlusCost, diagonal)
//                print("c", costMatrix[y][x], topPlusCost, leftPlusCost, diagonal)
            }
            else {
                costMatrix[y][x] = min(topPlusCost, leftPlusCost, diagonalPlusCost)
//                print("d", costMatrix[y][x], topPlusCost, leftPlusCost, diagonalPlusCost)
            }
        }
    }

    
    for i in costMatrix {
        print(i)
    }
//    print(costMatrix)
    return costMatrix
}

var py = [[0, 1, 2, 3, 4], [1, 0, 1, 2, 3], [2, 1, 2, 3, 2], [3, 2, 1, 2, 3], [4, 3, 2, 1, 2]]

py = [[0, 1, 2, 3, 4, 5], [1, 0, 1, 2, 3, 4], [2, 1, 0, 1, 2, 3], [3, 2, 1, 0, 1, 2], [4, 3, 2, 1, 2, 3], [5, 4, 3, 2, 1, 2]]

//let sw = alignStrings(newStartString: ["-","B","E","A","R"], newEndString: ["-","B","A","R","E"], insertCost: 1, deleteCost: 1, subCost: 2)
let sw = alignStrings(newStartString: ["-","P","L","A","I","N"], newEndString: ["-","P","L","A","I","N"], insertCost: 1, deleteCost: 1, subCost: 2)

//if py == sw {
//    print("pass")
//} else {
//    print("fail")
//    print(sw)
//}

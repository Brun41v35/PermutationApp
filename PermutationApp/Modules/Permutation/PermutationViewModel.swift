//
//  PermutationViewModel.swift
//  PermutationApp
//
//  Created by Bruno Silva on 14/10/22.
//

import UIKit

protocol PermutationViewModelProtocol {
    func generatePermutationWith(value: String) -> [String]
}

final class PermutationViewModel: PermutationViewModelProtocol {
    
    // MARK: - Public Methods
    
    func generatePermutationWith(value: String) -> [String] {
        guard let newValue = value.first else { return [String]() }
        let firstCharacter = String(describing: newValue)
        return findPermutationWith(value: value, position: 1, permutations: [firstCharacter])
    }
    
    func findPermutationWith(value: String,
                             position: Int,
                             permutations: [String]) -> [String] {
        let currentIndex = String.Index(utf16Offset: position, in: value)
        let lastIndex = currentIndex == value.endIndex
        
        if lastIndex { return permutations }
        
        let currentCharacter = value[currentIndex]
        var newArray = [String]()
        
        for permutation in permutations {
            let share = sharingValues(currentCharacter, permutation)
            newArray.append(contentsOf: share)
        }
        
        let newPosition = position + 1
        return findPermutationWith(value: value, position: newPosition, permutations: newArray.sorted())
    }
    
    func sharingValues(_ newCharacter: Character,
                       _ permutation: String) -> [String] {
        var newValues = [String]()
        
        for i in 0..<permutation.count + 1 {
            var newPermutation = permutation
            let currentIndex = String.Index(utf16Offset: i, in: permutation)
            
            newPermutation.insert(newCharacter, at: currentIndex)
            newValues.append(newPermutation)
        }
        return newValues
    }
    
    func showMessage() {
    }
}

//
//  ResultViewModel.swift
//  PermutationApp
//
//  Created by Bruno Silva on 14/10/22.
//

import UIKit

protocol ResultViewModelProtocol {
    var permutationValues: String? { get set }
}

final class ResultViewModel: ResultViewModelProtocol {
    
    // MARK: - Private Properties
    
    private let permutations: [String]
    
    // MARK: - Public Propeties
    
    var permutationValues: String?
    
    // MARK: - Init
    
    init(permutations: [String]) {
        self.permutations = permutations
        teste()
    }
    
    // MARK: - Public Methods
    
    func teste() {
        for permutation in permutations {
            permutationValues = permutation
        }
    }
}

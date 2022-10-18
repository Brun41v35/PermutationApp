//
//  PermutationFactory.swift
//  PermutationApp
//
//  Created by Bruno Silva on 14/10/22.
//

import UIKit

protocol PermutationFactoryProtocol {
    func make(permutations: [String]) -> UIViewController
}

struct PermutationFactory: PermutationFactoryProtocol {
    func make(permutations: [String]) -> UIViewController {
        let resultView = ResultView()
        let resultViewController = ResultViewController(permutations: permutations,
                                                        resultView: resultView)
        return resultViewController
    }
}

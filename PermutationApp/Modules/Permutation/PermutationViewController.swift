//
//  PermutationViewController.swift
//  PermutationApp
//
//  Created by Bruno Silva on 13/10/22.
//

import UIKit

final class PermutationViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let factory: PermutationFactoryProtocol
    private let viewModel: PermutationViewModelProtocol
    
    // MARK: - Init
    
    init(factory: PermutationFactoryProtocol,
         viewModel: PermutationViewModelProtocol) {
        self.factory = factory
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = PermutationView(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Extension

extension PermutationViewController: PermutationViewDelegate {
    func callResulScreen(valueTextField: String) {
        let permutations = viewModel.generatePermutationWith(value: valueTextField)
        let result = factory.make(permutations: permutations)
        navigationController?.pushViewController(result, animated: true)
    }
}

//
//  ResultViewController.swift
//  PermutationApp
//
//  Created by Bruno Silva on 14/10/22.
//

import UIKit

final class ResultViewController: UIViewController {
    
    // MARK: - Private Properties    
    
    private let permutations: [String]
    private let resultView: ResultView
    
    // MARK: - Init
    
    init(permutations: [String],
         resultView: ResultView) {
        self.permutations = permutations
        self.resultView = resultView
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = resultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInformations()
    }
    
    // MARK: - Public Methods
    
    func setupInformations() {
        resultView.setupInformations(permutations: permutations)
    }
}

//
//  ResultView.swift
//  PermutationApp
//
//  Created by Bruno Silva on 14/10/22.
//

import UIKit
 import SnapKit

final class ResultView: UIView {
    
    // MARK: - Private Properties
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Resultado 🎉"
        label.numberOfLines = 0
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        
        return label
    }()
    
    private lazy var resultTextField: UITextView = {
        let textView = UITextView()
        textView.scrollRangeToVisible(NSRange(location: 0, length: 0))
        textView.layer.cornerRadius = 10
        textView.textColor = .label
        textView.tintColor = .label
        
        return textView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func setupInformations(permutations: [String]) {
        for permutation in permutations {
            resultTextField.text.append(permutation + "\n\n")
        }
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        setupViews()
        setupConstraints()
        setupBackgroundColor()
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(resultTextField)
    }
    
    private func setupBackgroundColor() {
        backgroundColor = .systemPink
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(50)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        resultTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(100)
        }
    }
}

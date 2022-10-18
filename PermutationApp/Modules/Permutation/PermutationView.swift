//
//  PermutationView.swift
//  PermutationApp
//
//  Created by Bruno Silva on 13/10/22.

import UIKit
import SnapKit

protocol PermutationViewDelegate: AnyObject {
    func callResulScreen(valueTextField: String)
}

final class PermutationView: UIView {
    
    // MARK: - Private Properties
    
    private unowned let delegate: PermutationViewDelegate
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Olá, veja aqui a permutação de uma palavra! 🤩"
        label.numberOfLines = 0
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        
        return label
    }()
    
    private lazy var wordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Digite aqui.."
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.textColor = .label
        textField.tintColor = .label
        textField.textAlignment = .center
        textField.font = UIFont.preferredFont(forTextStyle: .title2)
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 12
        textField.backgroundColor = .tertiarySystemGroupedBackground
        textField.autocorrectionType = .no
        textField.returnKeyType = .go
        
        return textField
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("Confirmar", for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.titleLabel?.layer.masksToBounds = true
        button.titleLabel?.layer.cornerRadius = 10
        button.backgroundColor = .systemPink
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.5
        button.addTarget(self, action: #selector(showResult), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Init
    
    init(delegate: PermutationViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        setupViews()
        setupConstraints()
        setupBackgroundColor()
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(wordTextField)
        addSubview(confirmButton)
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
        
        wordTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(50)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
    }
    
    // MARK: - Actions
    
    @objc
    private func showResult() {
        let valueTextField = wordTextField.text ?? ""
        delegate.callResulScreen(valueTextField: valueTextField)
    }
}

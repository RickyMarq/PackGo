//
//  SearchScreen.swift
//  PackGo
//
//  Created by Henrique Marques on 13/09/22.
//

import UIKit

class SearchScreen: UIView {
    
    lazy var appLogoImageView: UIImageView = {
        let image = UIImage(named: "logo")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var informerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Localize suas encomendas"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var packCodeTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.textAlignment = .center
        textField.adjustsFontSizeToFitWidth = true
        textField.backgroundColor = .black
        textField.autocorrectionType = .no
        textField.placeholder = "Código de rastreio."
        textField.textColor = .white
        textField.text = "LB327135716HK"
        textField.autocapitalizationType = .allCharacters
        return textField
    }()
    
    public func packCodeTextFieldProtocols(delegate: UITextFieldDelegate) {
        self.packCodeTextField.delegate = delegate
    }
    
    private func setUpUIElements() {
        self.addSubview(self.appLogoImageView)
        self.addSubview(self.informerLabel)
        self.addSubview(self.packCodeTextField)
    }
    
    private func setUpConstraints() {
        self.configAppLogoImageViewConstraints()
        self.configInformerLabelConstraints()
        self.configPackCodeConstraints()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpUIElements()
        self.setUpConstraints()
        self.backgroundColor = UIColor(red: 99.00/255.00, green: 86.00/255.00, blue: 3.00/255.00, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func SetUpBackgroundColor() {
        let custom = UIColor(red: 47/256, green: 54/256.0, blue: 64/256.0, alpha: 33/256.0)
        self.backgroundColor = custom
    }
    
    private func configAppLogoImageViewConstraints() {
        NSLayoutConstraint.activate([
        
            self.appLogoImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            self.appLogoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.appLogoImageView.widthAnchor.constraint(equalToConstant: 150),
            self.appLogoImageView.heightAnchor.constraint(equalToConstant: 150),
        
        ])
    }
    
    private func configInformerLabelConstraints() {
        NSLayoutConstraint.activate([
        
            self.informerLabel.topAnchor.constraint(equalTo: self.appLogoImageView.bottomAnchor, constant: 20),
            self.informerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            
        ])
    }
    
    private func configPackCodeConstraints() {
        NSLayoutConstraint.activate([
        
            self.packCodeTextField.topAnchor.constraint(equalTo: self.informerLabel.bottomAnchor, constant: 25),
            self.packCodeTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            self.packCodeTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            self.packCodeTextField.heightAnchor.constraint(equalToConstant: 30),
        
        ])
    }
    
    

}

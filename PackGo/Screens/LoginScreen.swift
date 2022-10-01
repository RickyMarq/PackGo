//
// Copyright © 2022 Anti Coding Coding Club.
// All Rights Reserved.
//


import UIKit

class LoginScreen: UIView {
	
	lazy var subImageView:UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.image = UIImage(named: "loading")
		return image
	}()
	
	lazy var logoAppImageView:UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.image = UIImage(named: "logo")
		return image
	}()
	
	lazy var loginLabel:UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .systemBackground
		label.font = UIFont.boldSystemFont(ofSize: 40)
		label.text = "Bem-vindo(a)"
		return label
	}()
	
	lazy var descriptionLabel:UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .systemBackground
		label.textAlignment = .center
		label.font = UIFont.systemFont(ofSize: 14)
		label.text = "Faça login para acessar seus rastreios"
		return label
	}()
	
	lazy var loginTextField:UITextField = {
		let txt = UITextField()
		txt.translatesAutoresizingMaskIntoConstraints = false
		txt.autocorrectionType = .no
		txt.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
		txt.borderStyle = .roundedRect
		txt.keyboardType = .emailAddress
		txt.attributedPlaceholder = NSAttributedString(
			string: "E-mail",
			attributes: [NSAttributedString.Key.foregroundColor:UIColor.white.withAlphaComponent(0.4)]
		)
		txt.textColor = .white
		txt.clipsToBounds = true
		txt.layer.cornerRadius = 12
		txt.layer.borderWidth = 1.0
		txt.layer.borderColor = UIColor.white.cgColor
		return txt
	}()
	
	lazy var pswTextField:UITextField = {
		let txt = UITextField()
		txt.translatesAutoresizingMaskIntoConstraints = false
		txt.autocorrectionType = .no
		txt.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
		txt.borderStyle = .roundedRect
		txt.keyboardType = .default
		txt.isSecureTextEntry = true
		txt.attributedPlaceholder = NSAttributedString(
			string: "Senha",
			attributes: [NSAttributedString.Key.foregroundColor:UIColor.white.withAlphaComponent(0.4)]
		)
		txt.textColor = .white
		txt.clipsToBounds = true
		txt.layer.cornerRadius = 12
		txt.layer.borderWidth = 1.0
		txt.layer.borderColor = UIColor.white.cgColor
		return txt
	}()
	
	lazy var recoverPswBtn:UIButton = {
		let btn = UIButton(type: .system)
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.setTitle("Recuperar senha?", for: .normal)
		btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
		btn.setTitleColor(.systemBackground, for: .normal)
		return btn
	}()
	
	lazy var loginBtn:UIButton = {
		let btn = UIButton(type: .system)
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.backgroundColor = .darkGray
		btn.setTitle("Entrar", for: .normal)
		btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
		btn.setTitleColor(.white, for: .normal)
		btn.layer.cornerRadius = 8
		btn.titleLabel?.textAlignment = .center
		return btn
	}()
	
	lazy var lineView:UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .darkGray
		return view
	}()
	
	lazy var signInGoogleView:UIButton = {
		let btn = UIButton(type: .system)
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.backgroundColor = .red
		btn.setImage(UIImage(named: "gmail"), for: .normal)
		btn.imageView?.contentMode = .scaleAspectFit
		btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 50)
		btn.tintColor = .white
		btn.setTitle("Entrar com Google", for: .normal)
		btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
		btn.setTitleColor(.white, for: .normal)
		btn.layer.cornerRadius = 8
		btn.titleLabel?.textAlignment = .center
		return btn
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.addSubview(self.subImageView)
		self.addSubview(self.logoAppImageView)
		self.addSubview(self.loginLabel)
		self.addSubview(self.descriptionLabel)
		self.addSubview(self.loginTextField)
		self.addSubview(self.pswTextField)
		self.addSubview(self.recoverPswBtn)
		self.addSubview(self.loginBtn)
		self.addSubview(self.lineView)
		self.addSubview(self.signInGoogleView)
		self.configConstrains()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	private func configConstrains() {
		NSLayoutConstraint.activate([
			
			self.subImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			self.subImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			self.subImageView.topAnchor.constraint(equalTo: self.topAnchor),
			self.subImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			
			self.logoAppImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 55),
			self.logoAppImageView.heightAnchor.constraint(equalToConstant: 108),
			self.logoAppImageView.widthAnchor.constraint(equalToConstant: 108),
			self.logoAppImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			
			self.loginLabel.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 16),
			self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			
			self.descriptionLabel.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 4),
			self.descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
			self.descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
			
			self.loginTextField.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 32),
			self.loginTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
			self.loginTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
			self.loginTextField.heightAnchor.constraint(equalToConstant: 39),
			
			self.pswTextField.topAnchor.constraint(equalTo: self.loginTextField.bottomAnchor, constant: 10),
			self.pswTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
			self.pswTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
			self.pswTextField.heightAnchor.constraint(equalToConstant: 39),
			
			self.recoverPswBtn.topAnchor.constraint(equalTo: self.pswTextField.bottomAnchor, constant: 10),
			self.recoverPswBtn.trailingAnchor.constraint(equalTo: self.loginTextField.trailingAnchor),
			self.recoverPswBtn.heightAnchor.constraint(equalToConstant: 20),
			
			self.loginBtn.topAnchor.constraint(equalTo: self.recoverPswBtn.bottomAnchor, constant: 36),
			self.loginBtn.leadingAnchor.constraint(equalTo: self.loginTextField.leadingAnchor),
			self.loginBtn.trailingAnchor.constraint(equalTo: self.loginTextField.trailingAnchor),
			self.loginBtn.heightAnchor.constraint(equalToConstant: 41),
			
			self.lineView.topAnchor.constraint(equalTo: self.loginBtn.bottomAnchor, constant: 48),
			self.lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 64),
			self.lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64),
			self.lineView.heightAnchor.constraint(equalToConstant: 0.5),
			
			self.signInGoogleView.topAnchor.constraint(equalTo: self.lineView.bottomAnchor, constant: 48),
			self.signInGoogleView.leadingAnchor.constraint(equalTo: self.loginBtn.leadingAnchor),
			self.signInGoogleView.trailingAnchor.constraint(equalTo: self.loginBtn.trailingAnchor),
			self.signInGoogleView.heightAnchor.constraint(equalToConstant: 41),
				
		])
	}
	
}

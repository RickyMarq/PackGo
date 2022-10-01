//
// Copyright © 2022 Anti Coding Coding Club.
// All Rights Reserved.
//


import UIKit

class LoginScreen: UIView {

	lazy var subImageView:UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.image = UIImage(named: "logo")
		return image
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.addSubview(self.subImageView)
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
	
		])
	}
	
	
	
}

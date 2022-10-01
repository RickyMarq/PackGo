//
// Copyright © 2022 Anti Coding Coding Club.
// All Rights Reserved.
//


import UIKit

class LoginViewController: UIViewController {
	
	var screen:LoginScreen?
	
	override func loadView() {
		self.screen = LoginScreen()
		self.view = self.screen
	}

    override func viewDidLoad() {
        super.viewDidLoad()
    }

	override func viewWillAppear(_ animated: Bool) {
		self.navigationController?.setNavigationBarHidden(true, animated: false)
	}

}

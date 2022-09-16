//
//  PackageController.swift
//  PackGo
//
//  Created by Henrique Marques on 13/09/22.
//

import UIKit

class PackageController: UIViewController {
    
    var packageScreen: PackageScreen?
    var package: String!
    
    var viewModel: PackageViewModel?
        
    override func loadView() {
        self.packageScreen = PackageScreen()
        self.view = packageScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        viewModel = PackageViewModel(delegate: self)
        self.packageScreen?.packageTableViewProtocols(delegate: self, dataSource: self)
        self.getDataFromViewModel()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
        
    init(package: String) {
        self.package = package
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        self.title = "Encomenda"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getDataFromViewModel() {
        self.viewModel?.GetData(code: package)
    }

}

extension PackageController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PackageCell? = tableView.dequeueReusableCell(withIdentifier: PackageCell.identifier, for: indexPath) as? PackageCell
        let path = viewModel?.GeIndex(indexPath: indexPath)
        let t = viewModel?.getTestIndex(indexPath: indexPath)
        
        
        
        cell?.descriptionLabel.text = path?.descricao ?? ""
        
        cell?.tipoLabel.text = path?.unidade.tipo ?? ""
        
        cell?.cidadeLabel.text = (t?.cidade ?? "") + "-" + (t?.uf ?? "")
        cell?.dataLabel.text = path?.dtHrCriado ?? ""
        
        DispatchQueue.global().async {
            if let imageUrl = URL(string: "https://proxyapp.correios.com.br" + (path?.urlIcone!)!) {
                do {
                    let data = try Data(contentsOf: imageUrl)
                    let img = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell?.iconImageView.image = img
                    }
                } catch {
                    print("Error")
                }
            }
        }
        
        return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension PackageController: PackageViewModelProtocols {
   
    func success() {
        DispatchQueue.main.async {
            print("Success")
            self.packageScreen?.packageTableView.reloadData()
            self.packageScreen?.activity.stopAnimating()
        }
    }
    
    func failure() {
        print("Error")
        
    }
    
    
}

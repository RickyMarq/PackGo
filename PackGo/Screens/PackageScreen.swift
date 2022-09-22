//
//  PackageScreen.swift
//  PackGo
//
//  Created by Henrique Marques on 13/09/22.
//

import UIKit

class PackageScreen: UIView {
    
    lazy var packageTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundView = activity
        tableView.backgroundColor = .black
        tableView.showsVerticalScrollIndicator = false
        tableView.register(PackageCell.self, forCellReuseIdentifier: PackageCell.identifier)
        return tableView
    }()
    
    lazy var activity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.style = UIActivityIndicatorView.Style.large
        activity.startAnimating()
        activity.hidesWhenStopped = true
        return activity
    }()
    
    public func packageTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.packageTableView.delegate = delegate
        self.packageTableView.dataSource = dataSource
    }

    private func setUpUIElements() {
        self.addSubview(self.packageTableView)
        self.addSubview(self.activity)
    }
    
    private func setUpUIConstraints() {
        self.configPackageTableViewConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpUIElements()
        self.setUpUIConstraints()
        self.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configPackageTableViewConstraints() {
        NSLayoutConstraint.activate([
        
        
            self.packageTableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.packageTableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.packageTableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.packageTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }

}

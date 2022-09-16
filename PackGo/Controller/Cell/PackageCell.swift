//
//  PackageCell.swift
//  PackGo
//
//  Created by Henrique Marques on 13/09/22.
//

import UIKit

class PackageCell: UITableViewCell {

    static let identifier = "PackageCell"
    var viewModel: PackageCellViewModel?
    
    lazy var iconImageView: UIImageView = {
        let image = UIImage(named: "loading")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 7
        return imageView
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 2
        label.textColor = .white
 //       label.font = UIFont.systemFontBold(ofSize: 12)
        return label
    }()
    
    lazy var tipoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Unidade de Distribuição"
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    lazy var cidadeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Unidade de Distribuição"
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    lazy var dataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    
    private func setUpUIElements() {
        self.contentView.addSubview(self.iconImageView)
        self.contentView.addSubview(self.descriptionLabel)
        self.contentView.addSubview(self.tipoLabel)
        self.contentView.addSubview(self.cidadeLabel)
        self.contentView.addSubview(self.dataLabel)
    }
    
    private func setUpUIConstraints() {
        self.configIconImageViewConstraints()
        self.configTestLabel()
        self.configTipoLabelConstraints()
        self.configCidadeLabelConstraints()
        self.configDataLabelConstraints()
        
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUIElements()
        self.setUpUIConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configIconImageViewConstraints() {
        NSLayoutConstraint.activate([
        
            self.iconImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            self.iconImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30),
            self.iconImageView.heightAnchor.constraint(equalToConstant: 50),
            self.iconImageView.widthAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    private func configTestLabel() {
        NSLayoutConstraint.activate([
        
            self.descriptionLabel.topAnchor.constraint(equalTo: self.iconImageView.topAnchor, constant: -10),
            self.descriptionLabel.leftAnchor.constraint(equalTo: self.iconImageView.rightAnchor, constant: 10),
            self.descriptionLabel.widthAnchor.constraint(equalToConstant: 250),
            
        ])
    }

    private func configTipoLabelConstraints() {
        NSLayoutConstraint.activate([
        
            self.tipoLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor,constant: 3),
            self.tipoLabel.leftAnchor.constraint(equalTo: self.descriptionLabel.leftAnchor),
            self.tipoLabel.widthAnchor.constraint(equalToConstant: 200)
        
        ])
    }
    
    private func configCidadeLabelConstraints() {
        NSLayoutConstraint.activate([
        
            self.cidadeLabel.topAnchor.constraint(equalTo: self.tipoLabel.bottomAnchor),
            self.cidadeLabel.leftAnchor.constraint(equalTo: self.tipoLabel.leftAnchor),
            self.cidadeLabel.widthAnchor.constraint(equalToConstant: 100),
        
        ])
    }
    
    private func configDataLabelConstraints() {
        NSLayoutConstraint.activate([
        
            self.dataLabel.topAnchor.constraint(equalTo: self.cidadeLabel.bottomAnchor),
            self.dataLabel.leftAnchor.constraint(equalTo: self.cidadeLabel.leftAnchor),
            self.dataLabel.widthAnchor.constraint(equalToConstant: 120),
        
        
        ])
    }
    
    func prepareCell(model: Evento) {
        self.viewModel = PackageCellViewModel(object: model)
        
        self.descriptionLabel.text = viewModel?.descricao ?? ""
    }
}
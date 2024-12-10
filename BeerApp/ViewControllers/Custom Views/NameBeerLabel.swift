//
//  NameBeerLabel.swift
//  BeerApp
//
//  Created by Sasha on 4.12.24.
//

import UIKit

class NameBeerLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabel() {
        self.textColor = .black
        self.font = .systemFont(ofSize: 25, weight: .bold)
        self.adjustsFontSizeToFitWidth = true
        self.textAlignment = .left
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }

}

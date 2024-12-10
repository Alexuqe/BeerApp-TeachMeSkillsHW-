//
//  CountBeerLabel.swift
//  BeerApp
//
//  Created by Sasha on 7.12.24.
//

import UIKit

class CountBeerLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabel() {
        self.text = String(0)
        self.textColor = .black
        self.font = .systemFont(ofSize: 20, weight: .regular)
        self.numberOfLines = 0
        self.textAlignment = .center
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

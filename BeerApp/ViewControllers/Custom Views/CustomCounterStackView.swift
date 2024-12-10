//
//  CustomStackView.swift
//  BeerApp
//
//  Created by Sasha on 7.12.24.
//

import UIKit

class CustomCounterStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureStackView()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func configureStackView() {
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fillProportionally
        self.spacing = 5
        self.translatesAutoresizingMaskIntoConstraints = false
    }

}

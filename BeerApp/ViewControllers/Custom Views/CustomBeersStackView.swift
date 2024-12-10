//
//  CustomBeersStackView.swift
//  BeerApp
//
//  Created by Sasha on 7.12.24.
//

import UIKit

class CustomBeersStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureStackView()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func configureStackView() {
        self.axis = .vertical
        self.spacing = 15
        self.distribution = .fillProportionally
        self.alignment = .fill
        self.translatesAutoresizingMaskIntoConstraints = false
    }

}

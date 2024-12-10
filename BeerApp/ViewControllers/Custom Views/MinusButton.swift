//
//  MinusButton.swift
//  BeerApp
//
//  Created by Sasha on 3.12.24.
//

import UIKit

class MinusButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        self.backgroundColor = .lightGray
        self.setTitleColor(.white, for: .normal)
        self.setTitleColor(.gray, for: .highlighted)
        self.setTitle("-", for: .normal)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

}

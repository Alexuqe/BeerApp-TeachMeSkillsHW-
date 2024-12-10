//
//  CoutingButton.swift
//  BeerApp
//
//  Created by Sasha on 4.12.24.
//

import UIKit

class CoutingButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {

        self.backgroundColor = UIColor(red: 148/255 , green: 143/255, blue: 250/255, alpha: 1)

        self.layer.cornerRadius = 15
        self.setTitleColor(.white, for: .normal)
        self.setTitleColor(.opaqueSeparator, for: .highlighted)
        self.setTitle("", for: .normal)
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false

    }

}

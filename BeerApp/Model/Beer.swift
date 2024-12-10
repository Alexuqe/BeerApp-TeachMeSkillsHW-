    //
    //  Beer.swift
    //  BeerApp
    //
    //  Created by Sasha on 3.12.24.
    //

import Foundation


class Beer {
    let name: String
    var counting: Int
    let price: Double
    var quantity: Int

    init(name: String, counting: Int, price: Double, quantity: Int) {
        self.name = name
        self.counting = counting
        self.price = price
        self.quantity = quantity
    }

}

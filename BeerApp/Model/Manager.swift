    //
    //  ManagerTwo.swift
    //  BeerApp
    //
    //  Created by Sasha on 5.12.24.
    //

import Foundation
import UIKit


class Manager {

    static let shared = Manager()

    var beerMTwo = [
        Beer(name: "Guiness", counting: 100, price: 2, quantity: 0),
        Beer(name: "Corona", counting: 100, price: 3, quantity: 0),
        Beer(name: "Heineken", counting: 100, price: 5, quantity: 0)
    ]

    enum BeerCase: String {
        case guiness = "Guiness"
        case corona = "Corona"
        case heineken = "Heineken"
    }

    let beers = [BeerCase.guiness.rawValue, BeerCase.corona.rawValue, BeerCase.heineken.rawValue]

    private init() {}

    func getBeer(_ beer: BeerCase) -> Beer {

        return  beerMTwo.filter { $0.name == beer.rawValue }.first ?? beerMTwo.first!
    }

    func plusButton(value: String, beer: BeerCase) -> String {
        let beers = beerMTwo.filter { $0.name == beer.rawValue }.first

        if beers?.quantity ?? 0 < beers?.counting ?? 100 {
            beers?.quantity += 1
        } else {
            beers?.quantity = beers?.counting ?? 100
        }

        print(beers!.quantity)
        return String(beers!.quantity)
    }

    func minusButton(value: String, beer: BeerCase) -> String {
        let beers = beerMTwo.filter { $0.name == beer.rawValue }.first

        if beers?.quantity ?? 0 > 0 {
            beers?.quantity -= 1
        } else {
            beers?.quantity = 0
        }
        print(beers!.quantity)
        return String(beers!.quantity)
    }

    func sellBeer(beers: [String], values: [String]) -> String {
        var totalSale = 0.0
        var saleDetails = ""

        for (index, value) in values.enumerated() {
                // Ищем индекс пива в массиве beerMTwo

            let beer = beerMTwo.filter { $0.name == beers[index] }.first
            let soldCount = Int(value) ?? 0

            let price = beer?.price ?? 0
            let subtotal = Double(soldCount) * (price)
            totalSale += subtotal
            beer?.counting -= soldCount
            beer?.quantity = 0
            saleDetails += "\(soldCount) * \(Double(price)) $ – \(beer?.name ?? "0")\n"

            print(beer?.counting ?? 100)
        }

        return """
               \(saleDetails)
               Total Sum: \(totalSale) $
               """
    }

    func startDay(beers: [String], values: [String]) -> String {
        let totalSale = 0.0
        var saleDetails = ""

        for (index, _) in values.enumerated() {
                // Ищем индекс пива в массиве beerMTwo
            let beer = beerMTwo.filter { $0.name == beers[index] }.first
            let soldCount = 0
            beer?.counting = 100
            beer?.quantity = 0
            saleDetails += "\(soldCount) * \(beer?.price ?? 0) $ – \(beer?.name ?? "0")\n"

            print(beer?.counting ?? 100)
        }

        return """
               \(saleDetails)
               Total Sum: \(totalSale) $
               """
    }

    func endDay(beers: [String]) -> String {

        var saleDetails: [String] = []

        for value in beers {
            let beer = beerMTwo.filter { $0.name == value }.first
            let price = beer?.price ?? 0
            let soldCount = 100 - (beer?.counting ?? 100)
            let revenue = Double(soldCount) * price

            saleDetails.append("\(soldCount) * \(price) - \(beer?.name ?? "0") on sum: \(revenue) $")

            print(beer?.counting ?? 100)
        }

        let totalSum = beerMTwo.reduce(0) { sum, beer in
            sum + Double(100 - beer.counting) * beer.price
        }

        return  """
                \(saleDetails.joined(separator: ",\n"))
                
                Total Sum: \(totalSum) $
                """
    }

}



#Preview {
    let perviewViewController = ViewController()
    perviewViewController
}


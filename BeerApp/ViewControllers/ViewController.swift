    //
    //  ViewController.swift
    //  BeerApp
    //
    //  Created by Sasha on 3.12.24.
    //

import UIKit

final class ViewController: UIViewController {

    let beers = Manager.shared.beers

        //MARK: Labels
    let guinesNameLabel = NameBeerLabel()
    let coronaNameLabel = NameBeerLabel()
    let heinekenNameLabel = NameBeerLabel()

    let guinessCountLabel = CountBeerLabel()
    let coronaCountLabel = CountBeerLabel()
    let heinekenCountLabel = CountBeerLabel()

    let chequeLabel = UILabel()

        //MARK: Buttons

    let plusButtonGuiness = PlusButton()
    let minusButtonGuiness = MinusButton()

    let plusButtonCorona = PlusButton()
    let minusButtonCorona = MinusButton()

    let plusButtonHeineken = PlusButton()
    let minusButtonHeineken = MinusButton()

    let sellButton = CoutingButton()
    let endFayButton = CoutingButton()
    let startDayButton = CoutingButton()


        //MARK: Stack Views

    let stackViewGuinessBeer = CustomCounterStackView()
    let stackViewCoronaBeer = CustomCounterStackView()
    let stackViewHeinekenBeer = CustomCounterStackView()

    let guinessStackView = CustomBeersStackView()
    let coronaStacView = CustomBeersStackView()
    let heinekenStackView = CustomBeersStackView()

    let stackAllView = UIStackView()
    let stackViewCountingButton = UIStackView()


        //MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        updateUI()
    }

    override func viewDidLayoutSubviews() {
//        updateUI()
    }


}


private extension ViewController {

        //MARK: Setup UI

    func updateUI() {

        configureNameLabels()
        configureCountLabels()

        configureCountingButtons()

        layoutGuinessCountElement()
        layoutCoronaCountElement()
        layoutHeinekenCountElement()

        beersStack()

        configureAllStackView()

        configureChequeLabel()
        configureCoutingButtons()

        configureStackViewCoutingButton()

    }

        //MARK: Configure UI

    func configureNameLabels() {
        guinesNameLabel.text = "\(Manager.shared.getBeer(.guiness).name) : \(Manager.shared.getBeer(.guiness).price) $"
        coronaNameLabel.text = "\(Manager.shared.getBeer(.corona).name) : \(Manager.shared.getBeer(.corona).price) $"
        heinekenNameLabel.text = "\(Manager.shared.getBeer(.heineken).name) : \(Manager.shared.getBeer(.heineken).price) $"

        view.addSubview(guinesNameLabel)
        view.addSubview(coronaNameLabel)
        view.addSubview(heinekenNameLabel)
    }

    func configureCountLabels() {
        view.addSubview(guinessCountLabel)
        view.addSubview(coronaCountLabel)
        view.addSubview(heinekenCountLabel)
    }


    func configureCountingButtons() {
        view.addSubview(plusButtonGuiness)
        view.addSubview(minusButtonGuiness)
        plusButtonGuiness.tag = 0
        minusButtonGuiness.tag = 0

        view.addSubview(plusButtonCorona)
        view.addSubview(minusButtonCorona)
        plusButtonCorona.tag = 1
        minusButtonCorona.tag = 1

        view.addSubview(plusButtonHeineken)
        view.addSubview(minusButtonHeineken)
        plusButtonHeineken.tag = 2
        minusButtonHeineken.tag = 2

        plusButtonGuiness.addTarget(self, action: #selector(tapPlusButton), for: .touchUpInside)
        minusButtonGuiness.addTarget(self, action: #selector(tapMinusButton), for: .touchUpInside)

        plusButtonCorona.addTarget(self, action: #selector(tapPlusButton), for: .touchUpInside)
        minusButtonCorona.addTarget(self, action: #selector(tapMinusButton), for: .touchUpInside)

        plusButtonHeineken.addTarget(self, action: #selector(tapPlusButton), for: .touchUpInside)
        minusButtonHeineken.addTarget(self, action: #selector(tapMinusButton), for: .touchUpInside)
    }

    func configureChequeLabel() {
        chequeLabel.text = Manager.shared.sellBeer(
            beers: beers,
            values: [
                guinessCountLabel.text ?? "0",
                coronaCountLabel.text ?? "0",
                heinekenCountLabel.text ?? "0"
            ]
        )
        chequeLabel.font = .systemFont(ofSize: 22, weight: .regular)
        chequeLabel.textColor = .black
        chequeLabel.textAlignment = .center
        chequeLabel.numberOfLines = 0
        chequeLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(chequeLabel)
        constrainteLabel()
    }

    func configureCoutingButtons() {
        sellButton.setTitle("Sell", for: .normal)
        startDayButton.setTitle("Start Day", for: .normal)
        endFayButton.setTitle("End Day", for: .normal)

        sellButton.tag = 0
        startDayButton.tag = 1
        endFayButton.tag = 2

        view.addSubview(sellButton)
        view.addSubview(startDayButton)
        view.addSubview(endFayButton)

        sellButton.addTarget(self, action: #selector(countBeer), for: .touchUpInside)
        startDayButton.addTarget(self, action: #selector(countBeer), for: .touchUpInside)
        endFayButton.addTarget(self, action: #selector(countBeer), for: .touchUpInside)
    }


        //MARK: Action

    @objc func tapPlusButton(_ sender: UIButton) {

        switch sender.tag {
            case 0: guinessCountLabel.text = Manager.shared.plusButton(value: guinessCountLabel.text ?? "0", beer: .guiness)
            case 1: coronaCountLabel.text = Manager.shared.plusButton(value: coronaCountLabel.text ?? "0", beer: .corona)
            default: heinekenCountLabel.text = Manager.shared.plusButton(value: heinekenCountLabel.text ?? "0", beer: .heineken)
        }
    }

    @objc func tapMinusButton(_ sender: UIButton) {

        switch sender.tag {
            case 0: guinessCountLabel.text = Manager.shared.minusButton(value: guinessCountLabel.text ?? "0", beer: .guiness)
            case 1: coronaCountLabel.text = Manager.shared.minusButton(value: coronaCountLabel.text ?? "0", beer: .corona)
            default: heinekenCountLabel.text = Manager.shared.minusButton(value: heinekenCountLabel.text ?? "0", beer: .heineken)
        }
    }

    @objc func countBeer(_ sender: UIButton) {

        switch sender.tag {
            case 0:
                chequeLabel.text = Manager.shared.sellBeer(beers: beers, values: [guinessCountLabel.text ?? "0", coronaCountLabel.text ?? "0", heinekenCountLabel.text ?? "0"])

                guinessCountLabel.text = String(0)
                coronaCountLabel.text = String(0)
                heinekenCountLabel.text = String(0)

            case 1:
                chequeLabel.text = Manager.shared.startDay(beers: beers, values: [guinessCountLabel.text ?? "0", coronaCountLabel.text ?? "0", heinekenCountLabel.text ?? "0"])
            default:
                chequeLabel.text = Manager.shared.endDay(beers: beers)

        }
    }


        //MARK: Stack Views


    func layoutGuinessCountElement() {
        stackViewGuinessBeer.addArrangedSubview(minusButtonGuiness)
        stackViewGuinessBeer.addArrangedSubview(guinessCountLabel)
        stackViewGuinessBeer.addArrangedSubview(plusButtonGuiness)

        view.addSubview(stackViewGuinessBeer)
    }

    func layoutCoronaCountElement() {
        stackViewCoronaBeer.addArrangedSubview(minusButtonCorona)
        stackViewCoronaBeer.addArrangedSubview(coronaCountLabel)
        stackViewCoronaBeer.addArrangedSubview(plusButtonCorona)

        view.addSubview(stackViewCoronaBeer)
    }

    func layoutHeinekenCountElement() {
        stackViewHeinekenBeer.addArrangedSubview(minusButtonHeineken)
        stackViewHeinekenBeer.addArrangedSubview(heinekenCountLabel)
        stackViewHeinekenBeer.addArrangedSubview(plusButtonHeineken)

        view.addSubview(stackViewHeinekenBeer)
    }

    func beersStack() {

        guinessStackView.addArrangedSubview(guinesNameLabel)
        guinessStackView.addArrangedSubview(stackViewGuinessBeer)
        coronaStacView.addArrangedSubview(coronaNameLabel)
        coronaStacView.addArrangedSubview(stackViewCoronaBeer)
        heinekenStackView.addArrangedSubview(heinekenNameLabel)
        heinekenStackView.addArrangedSubview(stackViewHeinekenBeer)

        view.addSubview(guinessStackView)
        view.addSubview(coronaStacView)
        view.addSubview(heinekenStackView)
    }

    func configureAllStackView() {
        stackAllView.axis = .vertical
        stackAllView.alignment = .fill
        stackAllView.distribution = .fillProportionally
        stackAllView.spacing = 50
        stackAllView.translatesAutoresizingMaskIntoConstraints = false

        stackAllView.addArrangedSubview(guinessStackView)
        stackAllView.addArrangedSubview(coronaStacView)
        stackAllView.addArrangedSubview(heinekenStackView)

        view.addSubview(stackAllView)
        constrainteAllStakView()
    }

    func configureStackViewCoutingButton() {
        stackViewCountingButton.axis = .vertical
        stackViewCountingButton.spacing = 20
        stackViewCountingButton.alignment = .fill
        stackViewCountingButton.distribution = .fillProportionally
        stackViewCountingButton.translatesAutoresizingMaskIntoConstraints = false

        stackViewCountingButton.addArrangedSubview(sellButton)
        stackViewCountingButton.addArrangedSubview(startDayButton)
        stackViewCountingButton.addArrangedSubview(endFayButton)

        view.addSubview(stackViewCountingButton)
        constraiteCountingButtonStack()
    }

        // MARK: Constrainte

    func constrainteAllStakView() {
        NSLayoutConstraint.activate([
            stackAllView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            stackAllView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            stackAllView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
    }

    func constrainteLabel() {
        NSLayoutConstraint.activate([
            chequeLabel.topAnchor.constraint(equalTo: stackAllView.bottomAnchor, constant: 50),
            chequeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            chequeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
    }

    func constraiteCountingButtonStack() {
        NSLayoutConstraint.activate([
            stackViewCountingButton.topAnchor.constraint(equalTo: chequeLabel.bottomAnchor, constant: 50),
            stackViewCountingButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            stackViewCountingButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
    }


}

#Preview {
    let perviewViewController = ViewController()
    perviewViewController
}

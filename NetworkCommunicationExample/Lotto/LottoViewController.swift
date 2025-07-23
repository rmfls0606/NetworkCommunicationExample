//
//  LottoViewController.swift
//  NetworkCommunicationExample
//
//  Created by 이상민 on 7/23/25.
//

import UIKit
import SnapKit

class LottoViewController: UIViewController {
    
    private var winningLottoNumber: (winningNum: [Int], bonusNum: Int) {
        let randomLottoNumber = [Int](1...45).shuffled()
        let winningNumber = Array(randomLottoNumber[0...5])
        let bonusNumber = randomLottoNumber[6]
        return (winningNum: winningNumber, bonusNum: bonusNumber)
    }
    
    private let lottoRound: [Int] = [Int](1...1181)
    
    private let lottoRoundTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.tintColor = .clear
        return textField
    }()
    
    private let lottoRoundPickerView =   UIPickerView()
    
    private let winningNumberTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "당첨번호 안내"
        label.textColor = .black
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private let drawDateLabel: UILabel = {
        let label = UILabel()
        label.text = "2020-05-30 추첨"
        label.textColor = .systemGray3
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    private let winningNumberContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    private let winningResultLabel: UILabel = {
        let label = UILabel()
        label.text = "913회 당첨결과"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let lottoBallStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let plusLabel: UILabel = {
        let label = UILabel()
        label.text = "+"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    private func makeBonusBallView(number: Int) -> UIView{
        let container = UIView()
        
        let bonusBall = LottoBallView(ballNumber: number)
        
        let bonusBallTextLabel = UILabel()
        bonusBallTextLabel.text = "보너스"
        bonusBallTextLabel.textColor = .systemGray
        bonusBallTextLabel.font = .systemFont(ofSize: 12)
        bonusBallTextLabel.textAlignment = .center
        
        container.addSubview(bonusBall)
        container.addSubview(bonusBallTextLabel)
        
        bonusBall.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(bonusBall.snp.width)
        }
        
        bonusBallTextLabel.snp.makeConstraints { make in
            make.top.equalTo(bonusBall.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
        }
        
        return container
    }
}

extension LottoViewController: ViewDesignProtocol{
    func configureHierarchy() {
        view.addSubview(lottoRoundTextField)
        
        view.addSubview(winningNumberContainer)
        winningNumberContainer.addSubview(winningNumberTitleLabel)
        winningNumberContainer.addSubview(drawDateLabel)
        
        view.addSubview(winningResultLabel)
        
        view.addSubview(lottoBallStackView)
    }
    
    func configureLayout() {
        lottoRoundTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.height.equalTo(44)
        }
        
        winningNumberContainer.snp.makeConstraints { make in
            make.top.equalTo(lottoRoundTextField.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(36)
        }
        
        winningNumberTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        drawDateLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        winningResultLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(winningNumberContainer.snp.bottom).offset(20)
        }
        
        lottoBallStackView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(winningResultLabel.snp.bottom).offset(20)
        }
    }
    
    func configureView() {
        navigationItem.title = "Lotto"
        
        view.backgroundColor = .white
        
        lottoRoundTextField.inputView = lottoRoundPickerView
        lottoRoundPickerView.delegate = self
        lottoRoundPickerView.dataSource = self
        
        winningLottoNumber.winningNum.forEach { num in
            let ball = LottoBallView(ballNumber: num)
            lottoBallStackView.addArrangedSubview(ball)
        }
        
        lottoBallStackView.addArrangedSubview(plusLabel)
        
        lottoBallStackView
            .addArrangedSubview(
                makeBonusBallView(number: winningLottoNumber.bonusNum)
            )
    }
}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.lottoRound.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(self.lottoRound[row])회"
    }
}

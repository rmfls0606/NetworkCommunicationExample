//
//  LottoViewController.swift
//  NetworkCommunicationExample
//
//  Created by 이상민 on 7/23/25.
//

import UIKit
import SnapKit

class LottoViewController: UIViewController {
    
    private let lottoRoundTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureView()
    }
}

extension LottoViewController: ViewDesignProtocol{
    func configureHierarchy() {
        view.addSubview(lottoRoundTextField)
        
        view.addSubview(winningNumberContainer)
        winningNumberContainer.addSubview(winningNumberTitleLabel)
        winningNumberContainer.addSubview(drawDateLabel)
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
    }

    func configureView() {
        navigationItem.title = "Lotto"
        
        view.backgroundColor = .white
    }
}

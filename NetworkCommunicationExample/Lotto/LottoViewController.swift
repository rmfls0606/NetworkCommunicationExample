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
    }

    func configureLayout() {
        lottoRoundTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.height.equalTo(44)
        }
    }

    func configureView() {
        navigationItem.title = "Lotto"
        
        view.backgroundColor = .white
    }
}

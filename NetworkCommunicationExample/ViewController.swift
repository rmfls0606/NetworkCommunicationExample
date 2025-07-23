//
//  ViewController.swift
//  NetworkCommunicationExample
//
//  Created by 이상민 on 7/23/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let lottoMoveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Lotto", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray2.cgColor
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
}

extension ViewController: ViewDesignProtocol{
    func configureHierarchy() {
        view.addSubview(lottoMoveButton)
    }

    func configureLayout() {
        lottoMoveButton.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.centerY.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureView() {
        view.backgroundColor = .white
    }
}

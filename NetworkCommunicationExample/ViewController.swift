//
//  ViewController.swift
//  NetworkCommunicationExample
//
//  Created by 이상민 on 7/23/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let lottoMoveButton = configureMoveButton(text: "Lotto")
    
    private let movieMoveButton = configureMoveButton(text: "Movie")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    @objc
    private func lottoMoveButtonClicked(_ sender: UIButton){
        let viewController = LottoViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc
    private func movieMoveButtonClicked(_ sender: UIButton){
        let viewController = MovieViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private static func configureMoveButton(text: String) -> UIButton{
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray2.cgColor
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        return button
    }
}

extension ViewController: ViewDesignProtocol{
    func configureHierarchy() {
        view.addSubview(lottoMoveButton)
        view.addSubview(movieMoveButton)
    }

    func configureLayout() {
        lottoMoveButton.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.centerY.equalTo(view.safeAreaLayoutGuide)
        }
        
        movieMoveButton.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(lottoMoveButton.snp.bottom).offset(10)
        }
    }
    
    func configureView() {
        view.backgroundColor = .white
        
        lottoMoveButton.addTarget(self, action: #selector(lottoMoveButtonClicked), for: .touchUpInside)
        
        movieMoveButton.addTarget(self, action: #selector(movieMoveButtonClicked), for: .touchUpInside)
    }
}

//
//  MovieViewController.swift
//  NetworkCommunicationExample
//
//  Created by 이상민 on 7/24/25.
//

import UIKit
import SnapKit

class MovieViewController: UIViewController {

    private let movieSearchTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.textColor = .systemGray3
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.systemGray3.cgColor
        return textField
    }()
    
    private let movieSearchButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("검색", attributes: AttributeContainer([
            .font: UIFont.systemFont(ofSize: 14)
        ]))
        config.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 16,
            bottom: 0,
            trailing: 16
        )
        config.baseForegroundColor = .black
        
        button.configuration = config
        button.backgroundColor = .systemGray3
        return button
    }()
    
    private let movieTableVie: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private let movieSearchView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureView()
        configureLayout()
    }
}

extension MovieViewController: ViewDesignProtocol{
    func configureHierarchy() {
        view.addSubview(movieSearchView)
        
        movieSearchView.addSubview(movieSearchTextField)
        movieSearchView.addSubview(movieSearchButton)
        
        view.addSubview(movieTableVie)
    }

    func configureLayout() {
        movieSearchView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(44)
        }
        
        movieSearchTextField.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.trailing.equalTo(movieSearchButton.snp.leading).offset(-8)
        }
        
        movieSearchTextField
            .setContentHuggingPriority(.defaultLow, for: .horizontal)
        movieSearchTextField
            .setContentCompressionResistancePriority(
                .defaultLow,
                for: .horizontal
            )
        
        movieSearchButton.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
        }
        movieSearchButton
            .setContentHuggingPriority(.defaultHigh, for: .horizontal)
        movieSearchButton
            .setContentCompressionResistancePriority(
                .defaultHigh,
                for: .horizontal
            )
        
        movieTableVie.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(movieSearchView.snp.bottom).offset(8)
        }
    }
    
    func configureView() {
        navigationItem.title = "Movie"
        
        view.backgroundColor = .black
    }
}

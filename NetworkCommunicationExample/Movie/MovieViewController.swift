//
//  MovieViewController.swift
//  NetworkCommunicationExample
//
//  Created by 이상민 on 7/24/25.
//

import UIKit
import SnapKit
import Alamofire

class MovieViewController: UIViewController {

    private var movieList: [BoxOffice] = []
    
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
    
    private let movieTableView: UITableView = {
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
    
    private func callRequest(date: String){
        let url = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=\(ApiKey.boxofficApiKey)&targetDt=\(date)"
        
        AF.request(url, method: .get)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BoxOfficeResult.self) { response in
                switch response.result {
                case .success(let value):
                    self.movieList = value.boxOfficeResult.dailyBoxOfficeList
                    self.movieTableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    @objc
    private func searchTextFieldReturnClicked(_ sender: UITextField){
        guard let text = sender.text, !text.isEmpty else {
            return
        }
        
        callRequest(date: text)
    }
    
    @objc
    private func searchButtonClicked(_ sender: UIButton){
        guard let text = movieSearchTextField.text, !text.isEmpty else {
            return
        }
        
        callRequest(date: text)
    }
}

extension MovieViewController: ViewDesignProtocol{
    func configureHierarchy() {
        view.addSubview(movieSearchView)
        
        movieSearchView.addSubview(movieSearchTextField)
        movieSearchView.addSubview(movieSearchButton)
        
        view.addSubview(movieTableView)
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
        
        movieTableView.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(movieSearchView.snp.bottom).offset(8)
        }
    }
    
    func configureView() {
        navigationItem.title = "Movie"
        
        view.backgroundColor = .black
        
        movieSearchTextField.addTarget(self, action: #selector(searchTextFieldReturnClicked), for: .editingDidEndOnExit)
        
        movieSearchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
        
        movieTableView
            .register(
                MovieTableViewCell.self,
                forCellReuseIdentifier: MovieTableViewCell.identifier
            )
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.separatorStyle = .none
        movieTableView.backgroundColor = .black
    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MovieTableViewCell.identifier,
            for: indexPath
        ) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configureData(rank: indexPath.row + 1, movie: movieList[indexPath.row])
        return cell
    }
}

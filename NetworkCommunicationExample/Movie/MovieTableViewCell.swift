//
//  MovieTableViewCell.swift
//  NetworkCommunicationExample
//
//  Created by 이상민 on 7/24/25.
//

import UIKit
import SnapKit

class MovieTableViewCell: UITableViewCell {
    
    static let identifier = "MovieTableViewCell"
    
    private let container: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private let rankView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        return view
    }()
    
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "1"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let movieTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "영화 제목"
        label.textColor = .systemGray3
        return label
    }()
    
    private let movieDate: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray3
        label.text = "2020-04-01"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureData(rank: Int, movie: Movie){
        rankLabel.text = rank.description
        
        movieTitle.text = movie.title
        
        movieDate.text = movie.releaseDate
    }
}

extension MovieTableViewCell: ViewDesignProtocol{
    func configureHierarchy() {
        contentView.addSubview(container)
        
        container.addArrangedSubview(rankView)

        rankView.addSubview(rankLabel)
        
        container.addArrangedSubview(movieTitle)

        container.addArrangedSubview(movieDate)
    }

    func configureLayout() {
        container.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(8)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        rankLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.verticalEdges.equalToSuperview().inset(4)
        }
        
        rankLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        movieTitle.setContentHuggingPriority(.defaultLow, for: .horizontal)
        movieTitle.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        movieDate.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        movieDate.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    }
    
    func configureView() {
        self.selectionStyle = .none
        self.backgroundColor = .black
    }
}

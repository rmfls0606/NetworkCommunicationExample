//
//  LottoBallView.swift
//  NetworkCommunicationExample
//
//  Created by 이상민 on 7/23/25.
//

import UIKit
import SnapKit

class LottoBallView: UIView {

    var ballNumber: Int
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let boundsTextLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .systemGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    init(ballNumber: Int){
        self.ballNumber = ballNumber
        super.init(frame: .zero)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.width / 2
        self.clipsToBounds = true
    }
}

extension LottoBallView: ViewDesignProtocol{
    func configureHierarchy() {
        addSubview(numberLabel)
    }

    func configureLayout() {
        self.snp.makeConstraints { make in
            make.height.equalTo(self.snp.width)
        }
        
        numberLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func configureView() {
        backgroundColor = .systemGray4
        
        numberLabel.text = "\(ballNumber)"
    }
}

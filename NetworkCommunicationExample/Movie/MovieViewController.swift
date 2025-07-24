//
//  MovieViewController.swift
//  NetworkCommunicationExample
//
//  Created by 이상민 on 7/24/25.
//

import UIKit

class MovieViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureView()
        configureLayout()
    }
}

extension MovieViewController: ViewDesignProtocol{
    func configureHierarchy() {
        
    }

    func configureLayout() {

    }
    
    func configureView() {
        view.backgroundColor = .orange
    }
}

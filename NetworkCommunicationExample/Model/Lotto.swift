//
//  Lotto.swift
//  NetworkCommunicationExample
//
//  Created by 이상민 on 7/24/25.
//

import Foundation

struct Lotto: Decodable{
    let drwNoDate: String
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
}

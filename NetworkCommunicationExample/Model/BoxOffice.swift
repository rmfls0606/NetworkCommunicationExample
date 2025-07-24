//
//  BoxOffice.swift
//  NetworkCommunicationExample
//
//  Created by 이상민 on 7/25/25.
//

import Foundation

struct BoxOfficeResult: Decodable{
    let boxOfficeResult: DailyBoxOfficeList
}

struct DailyBoxOfficeList:Decodable{
    let dailyBoxOfficeList: [BoxOffice]
}

struct BoxOffice: Decodable{
    let rank: String
    let movieNm: String
    let openDt: String
}

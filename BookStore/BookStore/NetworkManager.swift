//
//  NetworkManager.swift
//  BookStore
//
//  Created by 박준영 on 5/3/24.
//

import UIKit

class NetworkManager {
    
    func fetchAPI(query: String) {
        
        var url = URL(string: "https://dapi.kakao.com/v3/search/book")!
        url = URL(string: url.absoluteString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!     // 한글 인코딩 추가
        url.append(queryItems: [URLQueryItem(name: "query", value: query)])
        
        var request = URLRequest(url: url)
    
        request.allHTTPHeaderFields = ["Authorization": "KakaoAK {510aed2153c26b6173b37707b592b58c}"]
    
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
            }
            guard let data = data else { return }
            
            guard let remoteBook = try? JSONDecoder().decode(RemoteBook.self, from: data) else {
                print("디코딩 실패")
                return
            }
            print("책 검색 결과", remoteBook)
        }.resume()

    }
    
    
    
}

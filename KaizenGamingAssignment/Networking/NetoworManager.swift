//
//  NetoworManager.swift
//  KaizenGamingAssignment
//
//  Created by Huseyin Yusuf on 4/6/23.
//

import Foundation
import Alamofire

public typealias responseHandler = (_ data: Data?, _ error: Error?) -> Void

// Singleton class
class NetworkManager {

    // MARK: - Properties
    static let shared = NetworkManager()

    private let endpoint = "https://618d3aa7fe09aa001744060a.mockapi.io/api/sports"

    func fetchSportsData(completion: @escaping responseHandler) {
        AF.request(endpoint, method: .get).response { response in
            switch (response.result) {
                case .success(let data):
                    guard let data = data else { return }
                    if let string = String(data: data, encoding: .utf8) {
                        print(string)
                    }
                    completion(data,nil)
                case .failure(let error):
                    print(error)
                    completion(nil,error)
            }
            
        }
    }
}

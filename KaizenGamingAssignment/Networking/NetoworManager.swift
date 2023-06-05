//
//  NetoworManager.swift
//  KaizenGamingAssignment
//
//  Created by Huseyin Yusuf on 4/6/23.
//

import Foundation
import Alamofire

public typealias responseHandler = (_ jsonArray: [JSON]?, _ error: Error?) -> Void
public typealias JSON = [String:Any]

// Singleton class
class NetworkManager {
    
    // MARK: - Properties
    static let shared = NetworkManager()
    
    private let endpoint = "https://618d3aa7fe09aa001744060a.mockapi.io/api/sports"
    
    func fetchSportsData(completion: @escaping responseHandler) {
        AF.request(endpoint, method: .get).response { response in
            switch (response.result) {
                case .success:
                    guard let data = response.data,
                          let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [JSON]
                    else { return }
                    debugPrint(json)
                    completion (json,nil)
                case .failure(let error):
                    print(error)
                    completion(nil,error)
            }
            
        }
    }
}

//
//  NetworkManager.swift
//  FacilityManagement
//
//  Created by CEPL on 29/06/23.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init(){}

    func getFacilities(completion: @escaping (_ facilitiesContainer: FacilitiesContainer?, _ error: Error?) -> Void) {
        if let url = URL(string: "https://my-json-server.typicode.com/iranjith4/ad-assignment/db") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(nil, error)
                    } else if let data = data {
                        do {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let facilitiesContainer = try? decoder.decode(FacilitiesContainer.self, from: data)
                            completion(facilitiesContainer, nil)
                        }
                    }
            }.resume()
        }
    }

}

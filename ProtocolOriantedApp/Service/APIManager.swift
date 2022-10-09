//
//  APIManager.swift
//  ProtocolOriantedApp
//
//  Created by emre on 8.10.2022.
//

import Foundation


class APIManager  : UserService {
    
    
    //singleton yerıne protocol kullnacaz
//    static let shared = APIManager()
//    private init() {}
    
    func fetchUser(completion: @escaping (Result<User, Error>) -> Void) {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        URLSession.shared.dataTask(with: url) { data, res, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                if let user = try? JSONDecoder().decode([User].self, from: data).last {
                    completion(.success(user))
                } else {
                    completion(.failure(NSError()))
                }
            }
        }.resume()
    }
    
}

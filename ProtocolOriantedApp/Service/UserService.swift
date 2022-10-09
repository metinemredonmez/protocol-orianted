//
//  UserService.swift
//  ProtocolOriantedApp
//
//  Created by emre on 8.10.2022.
//

import Foundation


protocol UserService {
    
    func fetchUser(completion: @escaping (Result<User, Error>) -> Void)
    
}

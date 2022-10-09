//
//  UserViewModel.swift
//  ProtocolOriantedApp
//
//  Created by emre on 8.10.2022.
//

import Foundation

class UserViewModel  {
    
    // *yukaırda confomr ettırmek ınterface yerıne delegate pattern kullancaz
    // bu degısken sadece buna eırsıldıgı ,ini,t edılecek !
    weak var outputprotocol: UserViewModelProtocol?
    
    private let userService : UserService
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func fetchUsers() {
        
        userService.fetchUser {[weak self] result in //weak var yazdıgımız ıcın
            switch result {
            case .success(let user):
                self?.outputprotocol?.updateView(name: user.name, email: user.email, username: user.username)
            case .failure(_):
                self?.outputprotocol?.updateView(name:"no user", email: "", username: "")
            }
        }
        
    }
    
    
}

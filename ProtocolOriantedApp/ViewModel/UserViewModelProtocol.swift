//
//  UserViewModelProtocol.swift
//  ProtocolOriantedApp
//
//  Created by emre on 8.10.2022.
//

import Foundation

protocol UserViewModelProtocol : AnyObject { // weak var ıcın obur tarafta extend edecz 
    // yenı bır veri geşdıdıgınde update view yapacak gorunumlerı guncellyecek
    //ne ıletmek ıstıyoruz name, email , username gibi ....
    func updateView(name: String, email:String,username: String)
    
}
 

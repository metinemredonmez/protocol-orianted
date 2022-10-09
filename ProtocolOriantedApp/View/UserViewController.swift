//
//  ViewController.swift
//  ProtocolOriantedApp
//
//  Created by emre on 8.10.2022.
//

import UIKit


enum NSFecthError: Error {
    case nameError
    case emailError
    case userError
    
}

//enum errrorları çalış !

class UserViewController: UIViewController , UserViewModelProtocol {// işte burada protocolu delegate olarak kullanırız
    
    func updateView(name: String, email: String, username: String) {
        self.nameLabel.text = name
        self.emailLabel.text = email
        self.userNameLabel.text = username

        
    }
    
    
    private let viewModel : UserViewModel

    //label
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //label
    private let userNameLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //label
    private let emailLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        //burada
        self.viewModel.outputprotocol = self  // kendımıze esıtledık view kdoel degısıtırk kendıme esıtledık kendımızde protcollu userviewmodelprotocol olduk
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        setupViews()
        //fetchUsers()
        viewModel.fetchUsers() // buradada cagırdık! 

    }
    

    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(userNameLabel)
        view.addSubview(emailLabel)
        
        
        NSLayoutConstraint.activate(
         [
            //name
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 60),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            
            
            
            //email
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 60),
            emailLabel.widthAnchor.constraint(equalToConstant: 200),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            
            
            //username
            userNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userNameLabel.heightAnchor.constraint(equalToConstant: 60),
            userNameLabel.widthAnchor.constraint(equalToConstant: 200),
            userNameLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
         
         
         ]
        
        )
        
    }
    // burada yapmyaca fetch

}


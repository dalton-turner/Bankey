//
//  ViewController.swift
//  Bankey
//
//  Created by Dalton Turner on 6/22/22.
//

import UIKit

class LoginViewController: UIViewController {

    let titleView = UILabel()
    let subTitleView = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    var password: String? {
        return loginView.passwordTextField.text
    }
    var username: String? {
        return loginView.usernameTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
    func style() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.text = "Bankey"
        titleView.font = titleView.font.withSize(34)
        titleView.textAlignment = .center
        titleView.textColor = .label
        titleView.numberOfLines = 0
        
        subTitleView.translatesAutoresizingMaskIntoConstraints = false
        subTitleView.text = "Your premium source for all things banking!"
        subTitleView.font = titleView.font.withSize(17)
        subTitleView.textAlignment = .center
        subTitleView.textColor = .label
        subTitleView.numberOfLines = 0
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.isHidden = true
        errorMessageLabel.numberOfLines = 0
    }

    func layout() {
        view.addSubview(titleView)
        view.addSubview(subTitleView)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // Title View
        NSLayoutConstraint.activate([
            titleView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -125),
            titleView.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        // Subtitle View
        NSLayoutConstraint.activate([
            subTitleView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            subTitleView.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subTitleView.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        // Log In View
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
        ])
        
        // Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        // Error Label
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
    }
}

extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    func login() {
        guard let username = username, let password = password else {
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / Password cannot be blank")
            return
        } else if username == "Kevin Parker" && password == "welcome" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect Username / Password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
    }
}


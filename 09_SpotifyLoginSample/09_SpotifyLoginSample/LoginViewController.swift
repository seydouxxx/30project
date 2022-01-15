//
//  LoginViewController.swift
//  09_SpotifyLoginSample
//
//  Created by Seydoux on 2021/11/19.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: GIDSignInButton!
    @IBOutlet weak var appleLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [self.emailLoginButton, self.googleLoginButton, self.appleLoginButton]
            .forEach {
                $0?.layer.borderWidth = 1
                $0?.layer.borderColor = UIColor.white.cgColor
                $0?.layer.cornerRadius = 30
            }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        let signInConfig = GIDConfiguration.
        // Google Sign in
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self, callback: <#T##GIDSignInCallback?##GIDSignInCallback?##(GIDGoogleUser?, Error?) -> Void#>)
    }
    
    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
        print("google")
    }
    
    @IBAction func appleLoginButtonTapped(_ sender: UIButton) {
        print("apple")
    }
}

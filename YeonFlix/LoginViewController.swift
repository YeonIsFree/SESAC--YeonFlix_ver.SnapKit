//
//  LoginViewController.swift
//  YeonFlix
//
//  Created by Seryun Chun on 2023/12/27.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var codeTextField: UITextField!
    
    @IBOutlet weak var joinButton: UIButton!
    
    @IBOutlet weak var moreInfoView: UIView!
    
    @IBOutlet weak var moreInfoLabel: UILabel!
    
    @IBOutlet weak var moreInfoSwitch: UISwitch!
    
    @IBOutlet weak var validationLabel: UILabel!
        
    func textFieldConfiguration() {
        addressTextField.placeholder = "*이메일 주소 (4글자 이상)"
        addressTextField.textColor = .white
        addressTextField.backgroundColor = .darkGray
        addressTextField.keyboardType = .emailAddress
        
        passwordTextField.placeholder = "*비밀번호 (6글자 이상)"
        passwordTextField.textColor = .white
        passwordTextField.backgroundColor = .darkGray
        
        nicknameTextField.placeholder = "닉네임"
        nicknameTextField.textColor = .white
        nicknameTextField.backgroundColor = .darkGray
        
        locationTextField.placeholder = "위치"
        locationTextField.textColor = .white
        locationTextField.backgroundColor = .darkGray
        
        codeTextField.placeholder = "추천 코드 입력"
        codeTextField.textColor = .white
        codeTextField.backgroundColor = .darkGray
        codeTextField.keyboardType = .numberPad
    }
    
    func joinButtonConfiguration() {
        joinButton.setTitle("회원가입", for: .normal)
        joinButton.setTitleColor(.black, for: .normal)
        joinButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        joinButton.backgroundColor = .white
        joinButton.layer.cornerRadius = 10
    }
    
    func moreInfoConfiguration() {
        moreInfoView.backgroundColor = .black
        moreInfoLabel.text = "추가 정보 입력"
        moreInfoLabel.textColor = .white
        moreInfoLabel.font = .systemFont(ofSize: 15)
        moreInfoSwitch.onTintColor = .systemPink
    }
    
    func validationLabelConfiguration() {
        validationLabel.text = ""
        validationLabel.font = .systemFont(ofSize: 12)
    }
    
    // Email은 공백이거나 4글자 미만이면 안됩니다.
    func isValidEmail() -> Bool {
        if let address = addressTextField.text {
            if address.count < 4 {
                return false
            }
            return true
        }
        return false
    }
    
    // Password는 공백이거나 6글자 미만이면 안됩니다.
    func isValidPassword() -> Bool {
        if let password = passwordTextField.text {
            if password.count < 6 {
                return false
            }
            return true
        }
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldConfiguration()
        joinButtonConfiguration()
        moreInfoConfiguration()
        validationLabelConfiguration()
    }
    
    @IBAction func joinButtonTapped(_ sender: Any) {
        if isValidEmail() && isValidPassword() {
            validationLabel.text = "사용 가능한 이메일, 비밀번호 입니다"
            validationLabel.textColor = .systemBlue
        } else {
            validationLabel.text = "이메일 혹은 비밀번호를 올바르게 입력해 주세요"
            validationLabel.textColor = .red
        }
        
        view.endEditing(true)
    }
    
    @IBAction func emailKeyboardDismiss(_ sender: UITextField) {
    }
    
    @IBAction func passwordKeyboardDismiss(_ sender: UITextField) {
    }
    
    @IBAction func nicknameKeyboardDismiss(_ sender: UITextField) {
    }
    
    @IBAction func locationKeyboardDismiss(_ sender: UITextField) {
    }
    
    
    
    
    
    
    
}

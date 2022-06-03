//
//  ViewController.swift
//  ViperApiCalling
//
//  Created by Apple on 23/05/22.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {
   
    @IBOutlet var lblMessage: UILabel!

    private let viewModel: LoginViewModel = LoginViewModel(provider: OnboardingServiceProvider())

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.view = self
        self.viewModel.email = "pankaj@mailinator.com"
        self.viewModel.password = "123456"
    }

    @IBAction func callApiAction(_ sender: UIButton) {
        viewModel.onAction(action: .inputComplete(.login), for: .login)

      //  viewModel.validateUserInput()
        }
    
  
}

// MARK: API Callback
extension LoginViewController: OnboardingViewRepresentable {
    func onAction(_ action: OnboardingAction) {

        
        switch action {
        case let .requireFields(msg), let .errorMessage(msg):
            print("API Callback for requireFields or errorMessage is \(msg)")
            self.lblMessage.text = msg
        case let .login(msg , _):
            print("API Callback for sucess is \(msg)")
            self.lblMessage.text = msg
        default:
            break
        }
    }
}

final class LoginViewModel {
    
    var email: String = ""
    var password: String = ""
    var username: String = ""
    var social_id: String = ""
    var socialLoginImageURL: URL?
    var selectedImage: UIImage = UIImage()
    var delegate: OnboardingServiceProvierDelegate?
    
    weak var view: OnboardingViewRepresentable?
    let provider: OnboardingServiceProvidable
    
    init(provider: OnboardingServiceProvidable) {
        self.provider = provider
        self.provider.delegate = self
    }
    
    func onAction(action: OnboardingAction, for screen: OnboardingScreenType) {
        switch action {
        case .inputComplete(screen): validateUserInput()
        default: break
        }
    }
    
     func validateUserInput() {
       
        self.provider.login(param: UserParams.Login(email: email, password: password, fcm_token: "fcmToken", os_version: UIDevice.current.systemVersion, device_model: "UIDevice.current.modelName", device_udid: "" , device_type: "ios"))
    }
    
}

extension LoginViewModel: OnboardingServiceProvierDelegate, InputViewDelegate {
    func completed<T>(for action: OnboardingAction, with response: T?, with error: APIError?) {
        DispatchQueue.main.async {
            if error != nil {
                self.view?.onAction(.errorMessage(error?.responseData?.message ?? ERROR_MESSAGE))
            } else {
                if let resp = response as? SuccessResponseModel, resp.code == 200 {
                    
                    print("resp.data?.loginData?.authenticationToken is \(resp.data?.loginData?.authenticationToken)")
                    print("resp.data?.loginData?.email is \(resp.data?.loginData?.email)")
                    self.view?.onAction(.login(resp.message ?? "", resp.data?.loginData?.isVerified ?? false))
                } else {
                    self.view?.onAction(.errorMessage((response as? SuccessResponseModel)?.message ?? ERROR_MESSAGE))
                }
            }
        }
    }
}

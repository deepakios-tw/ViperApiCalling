//
//  OnboardingProvider.swift
//  Clustry
//
//  Created by Mohd Ali Khan on 05/11/2019.
//  Copyright © 2021 m@k. All rights reserved.
//

import Foundation

final class OnboardingServiceProvider: OnboardingServiceProvidable {
    
    private let task = UserTask()
    var delegate: OnboardingServiceProvierDelegate?
    
    func register(param:UserParams.Signup) {
          
        task.signup(params: param, responseModel: SuccessResponseModel.self) { [weak self](resp, err) in
            if err != nil {
                self?.delegate?.completed(for: .register, with: resp, with: err)
                return
            }
            self?.delegate?.completed(for: .register, with: resp, with: nil)
        }
    }
    
    func login(param: UserParams.Login) {
          
        task.login(params: param, responseModel: SuccessResponseModel.self) { [weak self](resp, err) in
            if err != nil {
                self?.delegate?.completed(for: .login(resp?.message ?? "", resp?.data?.loginData?.isVerified ?? false), with: resp, with: err)
                return
            }
            self?.delegate?.completed(for: .login(resp?.message ?? "",  resp?.data?.loginData?.isVerified ?? false), with: resp, with: nil)
        }
    }

    func forgotPassword(param: UserParams.ForgotPassword) {
          
        task.forgotPassword(params: param, responseModel: SuccessResponseModel.self) { [weak self](resp, err) in
            if err != nil {
                self?.delegate?.completed(for: .forgotPassword(resp?.message ?? ""), with: resp, with: err)
                return
            }
            self?.delegate?.completed(for: .forgotPassword(resp?.message ?? ""), with: resp, with: nil)
        }
    }
    
    func changePassword(param: UserParams.ChangePassword) {
          
        task.changePassword(params: param, responseModel: SuccessResponseModel.self) { [weak self](resp, err) in
            if err != nil {
                self?.delegate?.completed(for: .changePassword(resp?.message ?? ""), with: resp, with: err)
                return
            }
            self?.delegate?.completed(for: .changePassword(resp?.message ?? ""), with: resp, with: nil)
        }
    }
    
    func socialLogin(param: UserParams.SocialLogin) {
          
        task.socialLogin(params: param, responseModel: SuccessResponseModel.self) { [weak self](resp, err) in
            if err != nil {
                self?.delegate?.completed(for: .socialLogin(resp?.message ?? ""), with: resp, with: err)
                return
            }
            self?.delegate?.completed(for: .socialLogin(resp?.message ?? ""), with: resp, with: nil)
        }
    }
    
    func verification(param: UserParams.Verification) {
          
        task.verification(params: param, responseModel: SuccessResponseModel.self) { [weak self](resp, err) in
            if err != nil {
                self?.delegate?.completed(for: .verification(resp?.message ?? ""), with: resp, with: err)
                return
            }
            self?.delegate?.completed(for: .verification(resp?.message ?? ""), with: resp, with: nil)
        }
    }
    
    func resendVerification(param: UserParams.ResendVerification) {
          
        task.resendVerification(params: param, responseModel: SuccessResponseModel.self) { [weak self](resp, err) in
            if err != nil {
                self?.delegate?.completed(for: .resendVerification, with: resp, with: err)
                return
            }
            self?.delegate?.completed(for: .resendVerification, with: resp, with: nil)
        }
    }
    
    func logout(param: UserParams.logout) {
          
        task.logout(params: param, responseModel: SuccessResponseModel.self) { [weak self](resp, err) in
            if err != nil {
                self?.delegate?.completed(for: .logout, with: resp, with: err)
                return
            }
            self?.delegate?.completed(for: .logout, with: resp, with: nil)
        }
    }
    
    func updateProfile(param: UserParams.UpdateProfile) {
          
        task.updateProfile(params: param, responseModel: SuccessResponseModel.self) { [weak self](resp, err) in
            if err != nil {
                self?.delegate?.completed(for: .updateProfile, with: resp, with: err)
                return
            }
            self?.delegate?.completed(for: .updateProfile, with: resp, with: nil)
        }
    }
    
    func subscription(param:UserParams.Subscription) {
        task.subscription(params: param, responseModel: SuccessResponseModel.self) { [weak self](resp, err) in
            if err != nil {
                self?.delegate?.completed(for: .subscription, with: resp, with: err)
                return
            }
            self?.delegate?.completed(for: .subscription, with: resp, with: nil)
        }
    }
}


//
// Responses.swift
// CallRecording
//
// Created by Mohd Ali Khan on 21/07/2020.
// Copyright © 2020 cis. All rights reserved.
//
import Foundation
struct SuccessResponseModel: Codable {
    let status: Bool?
    let code: Int?
    let message: String?
    let data: DataClass?
}
// MARK: - DataClass
struct DataClass: Codable {
    var register: Register?
    var loginData: LoginData?
    
//    var user: User?
//    var habit: Habit?
//    var habits: [AllHabits]?
//    var habitDetails: HabitDetails?
//    var habitMark: HabitMark?
//    let groupHabits: [GroupHabit]?
//    let invitaions: [Invitaion]?
//    let friends: [Friend]?
//    let joinHabit: JoinHabit?
//    let allGroupHabits: [AllGroupHabit]?
//    let habitCalender: [HabitCalender]?
//    let groupHabitDetails: GroupHabitDetails?
//    let groupHabitMembers: [GroupHabitMember]?
//    let shareHabit: [ShareHabit]?
//    let getSubscription: GetSubscription?
    
    enum CodingKeys: String, CodingKey {
        case register
        case loginData = "login_data"
        
    }
}

// MARK: - Register
struct Register: Codable {
  let id,createdAt, updatedAt: Int?
  let email, encryptedPassword: String?
  let confirmationToken, resetPasswordToken, resetPasswordSentAt, rememberCreatedAt: String?
  let verificationCode, authenticationToken, username: String?
  let isVerified,isGoogle, isApple: Bool?
  let deviceType, osVersion, deviceModel, fcmToken,deviceUdid: String?
  let loginType, socialID: String?
  let profileImage,memoji,forgotPassword: String?
  enum CodingKeys: String, CodingKey {
    case id, email
    case encryptedPassword = "encrypted_password"
    case confirmationToken = "confirmation_token"
    case resetPasswordToken = "reset_password_token"
    case resetPasswordSentAt = "reset_password_sent_at"
    case rememberCreatedAt = "remember_created_at"
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case verificationCode = "verification_code"
    case authenticationToken = "authentication_token"
    case username, memoji
    case isVerified = "is_verified"
    case deviceType = "device_type"
    case osVersion = "os_version"
    case deviceModel = "device_model"
    case fcmToken = "fcm_token"
    case forgotPassword = "forgot_password"
    case deviceUdid = "device_udid"
    case loginType = "login_type"
    case socialID = "social_id"
    case isGoogle = "is_google"
    case isApple = "is_apple"
    case profileImage = "profile_image"
  }
}

// MARK: - LoginData
struct LoginData: Codable {
    var id: Int?
    var email, encryptedPassword: String?
    var confirmationToken, resetPasswordToken, resetPasswordSentAt, rememberCreatedAt: String?
    var createdAt, updatedAt, transactionDate: Int?
    var verificationCode, authenticationToken, username: String?
    var memoji: String?
    var isVerified, isSubscribed: Bool?
    var deviceType, osVersion, deviceModel, fcmToken: String?
    var forgotPassword: String?
    var deviceUdid: String?
    var loginType, socialID: String?
    var isGoogle, isApple: Bool?
    var profileImage: String?
    enum CodingKeys: String, CodingKey {
        case id, email
        case encryptedPassword = "encrypted_password"
        case confirmationToken = "confirmation_token"
        case resetPasswordToken = "reset_password_token"
        case resetPasswordSentAt = "reset_password_sent_at"
        case rememberCreatedAt = "remember_created_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case verificationCode = "verification_code"
        case authenticationToken = "authentication_token"
        case username, memoji
        case isVerified = "is_verified"
        case deviceType = "device_type"
        case osVersion = "os_version"
        case deviceModel = "device_model"
        case fcmToken = "fcm_token"
        case forgotPassword = "forgot_password"
        case deviceUdid = "device_udid"
        case loginType = "login_type"
        case socialID = "social_id"
        case isGoogle = "is_google"
        case isApple = "is_apple"
        case profileImage = "profile_image"
        case transactionDate = "transaction_date"
        case isSubscribed = "is_subscribed"
    }
}


//
//  Constants.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 12/11/2020.
//

import SwiftUI

class Constants {
    static let displayName: String = "Vyb Dating"
    static let tagLine: String = "Stop swiping and put your personality first. Feel the Vyb."
}

enum FontName: String {
    case Black = "Roboto-Black"
    case BlackItalic = "Roboto-BlackItalic"
    case Italic = "Roboto-Italic"
    case BoldItalic = "Roboto-BoldItalic"
    case Light = "Roboto-BoldLight"
    case Medium = "Roboto-Medium"
    case MediumItalic = "Roboto-MediumItalic"
    case Regular = "Roboto-Regular"
    case Thin = "Roboto-Thin"
    case Bold = "Roboto-Bold"
    case ThinItalic = "Roboto-ThinItalic"
    
    func of(size: CGFloat) -> Font {
        return Font.custom(self.rawValue, size: size)
    }
}

enum NavigationPushedAction: Int {
    case phoneNumberAction
    case linkedInAction
    case phoneNumberVerificationAction
    case genderAction
    case fullNameAction
    case profilePicAction
    case professionalAction
    case preferenceAction
    case dateOfBirthAction
}

class ConstantOptions {
    //MARK: all levels of education
    static let educationalOptions = ["High School", "Some college","Associate degree","Bachelor’s degree","Graduate degree","PhD/ Post Doctorate"]

    //MARK: all gender options
    static let genderOptions = ["Male","Female","Transgender"]

    //MARK: all race options
    static let raceOptions = [ "White/ Caucasian", "Latino/Hispanic", "Black/African descent", "Asian", "Native American","East Indian","Pacific Islander","Middle Eastern","Asian other"]

    //MARK: all body types
    static let bodyTypesOptions = ["Slim/Slender","Athletic/Fit","Above Average","Muscular","Curvy","A few extra pounds","Big and beautiful","Heavyset"]

    //MARK: all relatonship statuses
    static let relationshipStatuses = ["Never married","Currently separated","Divorced","Widow/Widower"]

    //MARK: all children statuses
    static let childrenOptions = ["No","Definitely","Someday"]

    //MARK: all smoking options
    static let smokingOptions = ["No","Yes - occasionally","Yes - Daily","Yes - trying to quit"]

    //MARK: all drink options
    static let drinkOptions = ["Never","Social drinker","Moderately","Regularly"]

    //MARK: religious options
    static let religiousOptions = ["Neither religious not spiritual","Spiritual but not religious","Christian","Catholic","Hindu","Buddhist","Jewish","Muslim","Sikh","Shinto","Others"]
}


struct LinkedInConstants {
    
    static let CLIENT_ID = "MY_CLIENT_ID"
    static let CLIENT_SECRET = "MY_CLIENT_SECRET"
    static let REDIRECT_URI = "MY_REDIRECT_URI"
    static let SCOPE = "r_liteprofile%20r_emailaddress" //Get lite profile info and e-mail address
    
    static let AUTHURL = "https://www.linkedin.com/oauth/v2/authorization"
    static let TOKENURL = "https://www.linkedin.com/oauth/v2/accessToken"
}




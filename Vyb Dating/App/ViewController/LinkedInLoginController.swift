//
//  LinkedInLoginController.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 28/11/2020.
//

import UIKit
import WebKit



class LinkedInLoginController: UIViewController {
    
    //MARK: webview instance
    var webView = WKWebView()
    var linkedInData: LinkedInData = LinkedInData()
    
    
    override func viewDidLoad() {
        

        self.setUpNavigationBar()
        
        self.linkedInAuthVC()
    }
    
    private func setUpNavigationBar()  {
         self.navigationItem.title = "LinkedIn Login"
         self.navigationController?.navigationBar.isTranslucent = false
            
         navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
         navigationController?.navigationBar.shadowImage = UIImage()
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelAction))
        navigationController?.navigationItem.leftBarButtonItem = cancelButton
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(self.refreshAction))
        navigationController?.navigationItem.rightBarButtonItem = refreshButton
    }
    
    
    func linkedInAuthVC() {
            // Create linkedIn Auth ViewController
            webView.navigationDelegate = self
            self.view.addSubview(webView)
            webView.translatesAutoresizingMaskIntoConstraints = false
         
            self.webView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
            self.webView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
            self.webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
            self.webView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

            let state = "linkedin\(Int(NSDate().timeIntervalSince1970))"

            let authURLFull = LinkedInConstants.AUTHURL + "?response_type=code&client_id=" + LinkedInConstants.CLIENT_ID + "&scope=" + LinkedInConstants.SCOPE + "&state=" + state + "&redirect_uri=" + LinkedInConstants.REDIRECT_URI

            let urlRequest = URLRequest.init(url: URL.init(string: authURLFull)!)
            webView.load(urlRequest)
    }
    
    @objc func cancelAction() {
        self.dismiss(animated: true, completion: nil)
    }

    @objc func refreshAction() {
        self.webView.reload()
    }
}

extension LinkedInLoginController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        RequestForCallbackURL(request: navigationAction.request)
        
        //Close the View Controller after getting the authorization code
        if let urlStr = navigationAction.request.url?.absoluteString {
            if urlStr.contains("?code=") {
                self.dismiss(animated: true, completion: nil)
            }
        }
        decisionHandler(.allow)
    }

    func RequestForCallbackURL(request: URLRequest) {
        // Get the authorization code string after the '?code=' and before '&state='
        let requestURLString = (request.url?.absoluteString)! as String
        if requestURLString.hasPrefix(LinkedInConstants.REDIRECT_URI) {
            if requestURLString.contains("?code=") {
                if let range = requestURLString.range(of: "=") {
                    let linkedinCode = requestURLString[range.upperBound...]
                    if let range = linkedinCode.range(of: "&state=") {
                        let linkedinCodeFinal = linkedinCode[..<range.lowerBound]
                        handleAuth(linkedInAuthorizationCode: String(linkedinCodeFinal))
                    }
                }
            }
        }
    }

    func handleAuth(linkedInAuthorizationCode: String) {
        linkedinRequestForAccessToken(authCode: linkedInAuthorizationCode)
    }

    func linkedinRequestForAccessToken(authCode: String) {
        let grantType = "authorization_code"

        // Set the POST parameters.
        let postParams = "grant_type=" + grantType + "&code=" + authCode + "&redirect_uri=" + LinkedInConstants.REDIRECT_URI + "&client_id=" + LinkedInConstants.CLIENT_ID + "&client_secret=" + LinkedInConstants.CLIENT_SECRET
        let postData = postParams.data(using: String.Encoding.utf8)
        let request = NSMutableURLRequest(url: URL(string: LinkedInConstants.TOKENURL)!)
        request.httpMethod = "POST"
        request.httpBody = postData
        request.addValue("application/x-www-form-urlencoded;", forHTTPHeaderField: "Content-Type")
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task: URLSessionDataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            let statusCode = (response as! HTTPURLResponse).statusCode
            if statusCode == 200 {
                let results = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [AnyHashable: Any]

                let accessToken = results?["access_token"] as! String
                print("accessToken is: \(accessToken)")

                let expiresIn = results?["expires_in"] as! Int
                print("expires in: \(expiresIn)")

                // Get user's id, first name, last name, profile pic url
                self.fetchLinkedInUserProfile(accessToken: accessToken)
            }
        }
        task.resume()
    }
    
    func fetchLinkedInUserProfile(accessToken: String) {
            let tokenURLFull = "https://api.linkedin.com/v2/me?projection=(id,firstName,lastName,profilePicture(displayImage~:playableStreams))&oauth2_access_token=\(accessToken)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            let verify: NSURL = NSURL(string: tokenURLFull!)!
            let request: NSMutableURLRequest = NSMutableURLRequest(url: verify as URL)
            let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
                if error == nil {
                    let linkedInProfileModel = try? JSONDecoder().decode(LinkedInProfileModel.self, from: data!)
                    
                    //AccessToken
                    print("LinkedIn Access Token: \(accessToken)")
                    
                    // LinkedIn Id
                    let linkedinId: String! = linkedInProfileModel?.id
                    print("LinkedIn Id: \(linkedinId ?? "")")
                    self.linkedInData.id = linkedinId

                    // LinkedIn First Name
                    let linkedinFirstName: String! = linkedInProfileModel?.firstName.localized.enUS
                    print("LinkedIn First Name: \(linkedinFirstName ?? "")")
                    self.linkedInData.firstName = linkedinFirstName

                    // LinkedIn Last Name
                    let linkedinLastName: String! = linkedInProfileModel?.lastName.localized.enUS
                    print("LinkedIn Last Name: \(linkedinLastName ?? "")")
                    self.linkedInData.lastName = linkedinLastName

                    // LinkedIn Profile Picture URL
                    let linkedinProfilePic: String!

                    /*
                     Change row of the 'elements' array to get diffrent size of the profile url
                     elements[0] = 100x100
                     elements[1] = 200x200
                     elements[2] = 400x400
                     elements[3] = 800x800
                    */
                    if let pictureUrls = linkedInProfileModel?.profilePicture.displayImage.elements[2].identifiers[0].identifier {
                        linkedinProfilePic = pictureUrls
                    } else {
                        linkedinProfilePic = "Not exists"
                    }
                    print("LinkedIn Profile Avatar URL: \(linkedinProfilePic ?? "")")
                    self.linkedInData.profile = linkedinProfilePic
                    // Get user's email address
                    self.fetchLinkedInEmailAddress(accessToken: accessToken)
                }
            }
            task.resume()
        }

        func fetchLinkedInEmailAddress(accessToken: String) {
            let tokenURLFull = "https://api.linkedin.com/v2/emailAddress?q=members&projection=(elements*(handle~))&oauth2_access_token=\(accessToken)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            let verify: NSURL = NSURL(string: tokenURLFull!)!
            let request: NSMutableURLRequest = NSMutableURLRequest(url: verify as URL)
            let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
                if error == nil {
                    let linkedInEmailModel = try? JSONDecoder().decode(LinkedInEmailModel.self, from: data!)

                    // LinkedIn Email
                    let linkedinEmail: String! = linkedInEmailModel?.elements[0].elementHandle.emailAddress
                    print("LinkedIn Email: \(linkedinEmail ?? "")")
                    self.linkedInData.email = linkedinEmail

                    DispatchQueue.main.async {
                        //DONE NOW
                        self.dismiss(animated: true) {
                            
                        }
                    }
                }
            }
            task.resume()
        }
}

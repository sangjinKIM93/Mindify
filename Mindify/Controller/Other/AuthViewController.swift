//
//  AuthViewController.swift
//  Mindify
//
//  Created by 김상진 on 2021/02/18.
//  Copyright © 2021 kipCalm. All rights reserved.
//

import UIKit
import WebKit

class AuthViewController: UIViewController, WKNavigationDelegate{
    
    private let webView: WKWebView = {
        let config = WKWebViewConfiguration()
        config.preferences.javaScriptEnabled = true
        let webView = WKWebView(frame: .zero, configuration: config)
        
        return webView
    }()
    
    public var completionHandler: ((Bool) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Sign in"
        view.backgroundColor = .systemBackground
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        // 1단계 - 로그인 권한 동의 여부 check
        guard let url = AuthManager.shared.signInURL else { return }
        webView.load(URLRequest(url: url))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url = webView.url else {
            return
        }
        
        let componenet = URLComponents(string: url.absoluteString)
        guard let code = componenet?.queryItems?.first(where: { $0.name == "code" })?.value else {
            return
        }
        
        // 2단계 - access & refresh token 요청
        print("Code: \(code)")  // 이 코드의 역할이 뭐지? -> User가 권한 동의 하면 spotify가 주는 코드 -> 이 코드를 통해서 accessToken을 받을 수 있어
        AuthManager.shared.exchangeCodeForToken(code: code) { [weak self] success in
            DispatchQueue.main.async {
                // 3단계 - WelocomViewController로 이동 후 completion 로직 수행 (성공시 -> Main 화면 출력, 실패시 -> 경고창 출력)
                self?.navigationController?.popToRootViewController(animated: true)
                self?.completionHandler?(success)
            }
        }
    }
}

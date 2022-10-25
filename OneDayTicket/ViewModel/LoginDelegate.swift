//
//  LoginDelegate.swift
//  onedayticket-ios
//
//  Created by Sean on 2022/10/13.
//

import Foundation

protocol LoginDelegate {
    func loginCallBack(loginData: LoginDataType)
    func versionCallBack(versionData: VersionDataType)
}


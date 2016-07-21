//
//  String+Extension.swift
//  LongLian369
//
//  Created by 杨蒙 on 16/7/6.
//  Copyright © 2016年 北京龙链科技有限公司. All rights reserved.
//

import Foundation

public extension String {
    
    /// 判断手机号是否合法
    static func isValidmobile(string: String) -> Bool {
        // 判断是否是手机号
        let patternString = "^1[3|4|5|7|8][0-9]\\d{8}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", patternString)
        return predicate.evaluateWithObject(string)
    }
    
    /// 判断密码是否合法
    static func isValidPasswod(string: String) -> Bool {
        // 验证密码是 6 - 16 位字母或数字
        let patternString = "^[0-9A-Za-z]{6,16}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", patternString)
        return predicate.evaluateWithObject(string)
    }
    
}

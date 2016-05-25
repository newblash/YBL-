//
//  Restaurant.swift
//  定制cell的使用
//
//  Created by 杨晶 on 16/3/7.
//  Copyright © 2016年 YJ. All rights reserved.
//
//账号类型,用与判断是设计师,业务员,老板的超级管理员权限

import Foundation

struct YBLdata {
    var name: String!
    var psw: String!
    var type: String!
    
    init(name: String, psw: String, type: String){
        self.name = name
        self.type = type
        self.psw = psw
    }
}


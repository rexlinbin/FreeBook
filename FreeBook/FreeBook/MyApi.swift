//
//  MyApi.swift
//  FreeBook
//
//  Created by admin on 2017/9/11.
//  Copyright © 2017年 lengyue. All rights reserved.
//

import Foundation
import Moya

enum MyApi {
    case Home
}

extension MyApi: TargetType{
    var baseURL: URL {
        return URL(string: "http://book.km.com")!
    }
    
    var path: String {
        switch self {
        case .Home:
            return "/"
            
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .Home:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .Home:
            return nil
            
        }
    }
    
    var sampleData: Data {
        switch self {
        case .Home:
            return Data()
        }
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String: String]? {
        return nil
    }
    
}

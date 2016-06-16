//
//  Manager.swift
//  rxSample
//
//  Created by 山口智生 on 2016/06/12.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class Manager {
    static let manager = Manager()
    
    var entries = Variable<[Entry]>([])
}
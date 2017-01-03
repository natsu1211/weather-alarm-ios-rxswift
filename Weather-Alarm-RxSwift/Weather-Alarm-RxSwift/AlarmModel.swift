//
//  AlarmModel.swift
//  Weather-Alarm-RxSwift
//
//  Created by longyutao on 16/11/27.
//  Copyright © 2016年 LongGames. All rights reserved.
//

import Foundation

struct Alarm{
    var time : Date
    var repeatWeekdays : [Int]
    let id : String = UUID().uuidString
}

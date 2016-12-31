//
//  AlarmVIewModel.swift
//  Weather-Alarm-RxSwift
//
//  Created by longyutao on 16/12/31.
//  Copyright © 2016年 LongGames. All rights reserved.
//

import RxCocoa
import RxSwift

struct AlarmMainViewModel{
    private var alarms : Variable<[Alarm]?>
    private let disposeBag : DisposeBag = DisposeBag()
    
    var date =  PublishSubject<Date>()
    
    let addButtonTapped = PublishSubject<Void>()
    let alarmSelected = PublishSubject<IndexPath>()
    let alarmDeleted = PublishSubject<IndexPath>()
    
    let editButtonEnabled : Driver<Bool>
    let barTitle : Driver<String>
    
    init(){
        barTitle = .just("Alarm")
    }
    
    
}

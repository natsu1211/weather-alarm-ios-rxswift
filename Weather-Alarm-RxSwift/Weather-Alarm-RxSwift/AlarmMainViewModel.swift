//
//  AlarmVIewModel.swift
//  Weather-Alarm-RxSwift
//
//  Created by longyutao on 16/12/31.
//  Copyright © 2016年 LongGames. All rights reserved.
//

import RxCocoa
import RxSwift

enum addEditViewMode{
    case add
    case edit
}

struct AlarmMainViewModel{
    //input
    var time =  PublishSubject<Date>()
    var repeatWeekdays = PublishSubject<[Int]>()
    let addButtonTapped = PublishSubject<Void>()
    let editButtonTapped = PublishSubject<Void>()
    let alarmSelected = PublishSubject<IndexPath>()
    var alarmDeleted = PublishSubject<IndexPath>()
    
    
    //output
    var editButtonEnabled : Driver<Bool> {
        return .just(alarms.value.isEmpty)
    }

    var barTitle : Driver<String> {
        return .just("Alarm")
    }
    
    var transformToEditView : Driver<addEditViewMode>
    
    
    //private
    private var alarms : Variable<[Alarm]>
    private let disposeBag : DisposeBag = DisposeBag()
    
    init(){
        alarms = Variable<[Alarm]>([])
        
        let addMode : Observable<addEditViewMode> =
            addButtonTapped.map{.add}
        let editMode : Observable<addEditViewMode> =
            alarmSelected.map{_ in .edit}
        transformToEditView = Observable.of(addMode, editMode).merge()
            .asDriver(onErrorDriveWith: .empty())
    }
    
    
}

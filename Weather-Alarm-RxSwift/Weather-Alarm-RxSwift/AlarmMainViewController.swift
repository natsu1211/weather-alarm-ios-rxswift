//
//  AlarmMainViewController.swift
//  Weather-Alarm-RxSwift
//
//  Created by longyutao on 17/1/3.
//  Copyright © 2017年 LongGames. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class AlarmMainViewController: UITableViewController {

    @IBOutlet weak var addButton: UIBarButtonItem!
    
    let mainViewModel = AlarmMainViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func bindViewModel(){
        //input
        self.addButton.rx.tap
            .bindTo(mainViewModel.addButtonTapped)
            .addDisposableTo(disposeBag)
        
        
        self.navigationItem.leftBarButtonItem?.rx.tap
            .bindTo(mainViewModel.editButtonTapped)
            .addDisposableTo(disposeBag)
        
        self.tableView.rx.itemSelected
            .bindTo(mainViewModel.alarmSelected)
            .addDisposableTo(self.disposeBag)
        
        self.tableView.rx.itemDeleted
            .bindTo(mainViewModel.alarmDeleted)
            .addDisposableTo(self.disposeBag)
        
        
        //output
        mainViewModel.barTitle
            .drive(self.navigationItem.rx.title)
            .addDisposableTo(self.disposeBag)
        
        mainViewModel.editButtonEnabled
            .drive{self.navigationItem.leftBarButtonItem = self.editButtonItem}
            .addDisposableTo(self.disposeBag)
        
    }
}

// MARK: - Table view data source
extension AlarmMainViewController{
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
}

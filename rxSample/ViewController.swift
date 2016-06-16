//
//  ViewController.swift
//  rxSample
//
//  Created by 山口智生 on 2016/06/12.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    var entries = Manager.manager.entries
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelection = false
        
        entries.asDriver()
            .drive(tableView.rx_itemsWithCellIdentifier("cell",cellType: UITableViewCell.self)) { row, item, cell in
                cell.textLabel?.text = item.japanese + " : " + item.english
            }
            .addDisposableTo(disposeBag)
    }
}

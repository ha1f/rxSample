//
//  AddEntryViewController.swift
//  rxSample
//
//  Created by 山口智生 on 2016/06/12.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class AddEntryViewController: BaseViewController {
    
    @IBOutlet weak var englishTextField: UITextField!
    @IBOutlet weak var japaneseTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var entries = Manager.manager.entries
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.rx_tap
            .subscribeNext { [weak self] _ in
                guard let `self` = self else {
                    return
                }
                self.entries.value.append(Entry(japanese: self.japaneseTextField.text ?? "", english: self.englishTextField.text ?? ""))
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            .addDisposableTo(disposeBag)
    }
    
}

//
//  NumbersViewController.swift
//  Numbers
//
//  Created by 住田雅隆 on 2022/06/29.
//

import UIKit
import RxSwift
import RxCocoa

class ViewModel {
    let username = BehaviorRelay<String>(value: "")
}

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    let disposeBag = DisposeBag()
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    func setupViewModel() {
        viewModel = ViewModel()
        // MARK: ViewModelの変化をViewController(UIshiに伝える
        viewModel.username
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
        
        // MARK: ViewModel(UI)の変化をViewModelに伝える
        textField.rx.text.orEmpty
            .bind(to: viewModel.username)
            .disposed(by: disposeBag)
    }
}

        

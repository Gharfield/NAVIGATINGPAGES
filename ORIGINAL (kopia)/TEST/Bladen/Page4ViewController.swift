
//  Page4ViewController.swift
//  TEST
//  Created by Gustaf Hallberg on 2023-12-21.
// BLÄDDRA RECEPT
import UIKit

class Page4ViewController: UIViewController, PageViewController {
    var pageIndex: Int
    
    init(pageIndex: Int) {
        self.pageIndex = pageIndex
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 220/255, green: 205/255, blue: 185/255, alpha: 1.0) // Custom color for old book paper background
    }
}

//
//  Page2ViewController.swift
//  TEST
//
//  Created by Gustaf Hallberg on 2023-06-18.
//
//  Page2ViewController.swift
//  MENYVAL
//
//  Created by Gustaf Hallberg on 2023-06-18.
import UIKit

class Page2ViewController: UIViewController {

    // Outlets for buttons
  
    @IBOutlet var SPARADERECEPT: UIButton!
    @IBOutlet var BLÄDDRARECEPT: UIButton!
    @IBOutlet var SÖKRECEPT: UIButton!
    @IBOutlet var OMRECEPTBOKEN: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           // Custom initialization code if needed
       }

       override func viewDidLoad() {
           super.viewDidLoad()

           // Set up button styles
           configureButton(BLÄDDRARECEPT, withText: "BLÄDDRA RECEPT")
           configureButton(SPARADERECEPT, withText: "MINA BOKMÄRKEN")
           configureButton(OMRECEPTBOKEN, withText: "OM RECEPTBOKEN")
           configureButton(SÖKRECEPT, withText: "SÖK RECEPT")
       }

       // Method to configure button styles
       private func configureButton(_ button: UIButton, withText text: String) {
           button.setTitle(text, for: .normal)
           button.titleLabel?.font = UIFont(name: "Kefa-Regular", size: 24)
           button.setTitleColor(.black, for: .normal)
           button.contentEdgeInsets = UIEdgeInsets(top: 14, left: 28, bottom: 14, right: 28)
           button.layer.cornerRadius = 8
           button.layer.borderWidth = 1.5
           button.layer.borderColor = UIColor.black.cgColor
           button.layer.shadowColor = UIColor.black.cgColor
           button.layer.shadowOpacity = 0.2; button.layer.shadowRadius = 4
           button.layer.shadowOffset = CGSize(width: 0, height: 4)
       }

    // IBAction for "BLÄDDRA RECEPT" button
       @IBAction func BLÄDDRARECEPTButtonTapped(_ sender: UIButton) {
           let page3ViewController = Page3ViewController(pageIndex: 3)
           navigationController?.pushViewController(page3ViewController, animated: true)
       }
    // IBAction for "MINA BOKMÄRKEN" button
    @IBAction func SPARADERECEPTButtonTapped(_ sender: UIButton) {
        let nextPageViewController = Page4ViewController(pageIndex: 4); navigationController?.pushViewController(nextPageViewController, animated: true)}

       // IBAction for "OM RECEPTBOKEN" button
       @IBAction func OMRECEPTBOKENButtonTapped(_ sender: UIButton) {
           let nextPageViewController = Page6ViewController(pageIndex: 6)
           navigationController?.pushViewController(nextPageViewController, animated: true)
       }

       // IBAction for "SÖK RECEPT" button
       @IBAction func SÖKRECEPTButtonTapped(_ sender: UIButton) {
           let nextPageViewController = Page5ViewController(pageIndex: 5)
           navigationController?.pushViewController(nextPageViewController, animated: true)
       }
   }

//
//  ViewController.swift
//  CA_Animatio_Demo
//
//  Created by Apps WeLove on 10/04/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tblVw: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblVw.delegate = self
        tblVw.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
              self.animateTableView()
      }
    func animateTableView() {
        tblVw.reloadData()
           
        let cells = tblVw.visibleCells
        let tableViewHeight = tblVw.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: -tableViewHeight - 30)
        }
        
        var delayCounter = 0
        
        for cell in cells {
            UIView.animate(withDuration: 2.0, delay: Double(delayCounter) * 0.10, options: .transitionFlipFromTop, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            
            delayCounter += 1
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}



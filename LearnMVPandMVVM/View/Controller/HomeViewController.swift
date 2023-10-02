//
//  HomeViewController.swift
//  LearnMVPandMVVM
//
//  Created by Ly Chenghav on 2/10/23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UIScrollViewDelegate, UITableViewDataSource {


    var dataSourceArr = Array<String>()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        dataSourceArr =
               ["Python","JavaScript","Java","Swift","GoLang","C#","C++","Scala"]
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        cell.textLabel?.text = dataSourceArr[indexPath.row]
        cell.selectionStyle = .none
           return cell
    }

    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let tabBarVisibleThreshold: CGFloat = 50 // Adjust this value as needed
        let tabBarAnimationDuration: TimeInterval = 0.8 // Adjust the duration of the animation
        
        if scrollView.panGestureRecognizer.translation(in: scrollView.superview).y > tabBarVisibleThreshold {
            
            if let tabBar = tabBarController?.tabBar, !tabBar.isHidden {
                UIView.animate(withDuration: tabBarAnimationDuration) {
                    tabBar.isHidden = true
                }
            }
        } else {
            
            if let tabBar = tabBarController?.tabBar, tabBar.isHidden {
                UIView.animate(withDuration: tabBarAnimationDuration) {
                    tabBar.isHidden = false
                }
            }
        }
    }


}

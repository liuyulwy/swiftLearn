//
//  NewsViewController.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/6/17.
//  Copyright © 2020 liuyu. All rights reserved.
//

import UIKit

class NewsViewController: BaseViewController {
    var tabview : UITableView! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitle = "news"
        tabview = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), style: .plain)
        view.addSubview(tabview)
        tabview.backgroundColor = .red
        tabview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tabview.delegate = self
        tabview.dataSource = self
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(tabview as Any)
        print(self.automaticallyAdjustsScrollViewInsets)
    }

}

extension NewsViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "hhhhh"
        cell.detailTextLabel?.text = "fodjfo"
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

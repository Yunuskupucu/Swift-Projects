//
//  ViewController.swift
//  HaberProjesi
//
//  Created by Yunus Emre KÜPÜCÜ on 23.02.2024.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var newsTableViewModel : NewsTableViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        
        veriAl()
        
    }

    func veriAl() {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/BTK-%C4%B0OSDataSet/master/dataset.json")
        
        WebService().haberleriIndir(url: url!) { (haberler) in
            if let haberler = haberler {
                self.newsTableViewModel = NewsTableViewModel(newsList: haberler)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableViewModel == nil ? 0 : self.newsTableViewModel.numberOfRowsInsection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsCell
        let newsViewModel = self.newsTableViewModel.newsAtIndexPath(indexPath.row)
        cell.titleLabel.text = newsViewModel.news.title
        cell.storyLabel.text = newsViewModel.news.story
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}


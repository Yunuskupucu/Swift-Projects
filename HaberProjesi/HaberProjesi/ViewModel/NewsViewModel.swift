//
//  NewsViewModel.swift
//  HaberProjesi
//
//  Created by Yunus Emre KÜPÜCÜ on 24.02.2024.
//

import Foundation

struct NewsTableViewModel {
    
    let newsList : [News]
}

extension NewsTableViewModel {
    
    func numberOfRowsInsection() -> Int {
        return self.newsList.count
         
    }
    
    func newsAtIndexPath(_ index : Int) -> NewsViewModel {
        let news = self.newsList[index]
        return NewsViewModel(news: news)
    }
}

struct NewsViewModel {
    let news : News
    
    
}

//
//  ViewModel.swift
//  TemplateOfDealsViewer
//
//  Created by Александр Головин on 07.06.2023.
//

import Foundation

protocol ViewModelOutputs: AnyObject {
    
    func changeSortType(_ type: SortType, callback: @escaping ()->())
}

protocol ViewModelInputs: AnyObject {
    
    func fetchData(callback: @escaping () -> Void)
    func getDeals() -> [Deal]
    func nextDeals()
}



class ViewModel {
    
    var server: Server
    
    let queue = DispatchQueue(label: "MakeQueue")
    
    let secondQueue = DispatchQueue(label: "Queue")
    
    private var model: [Deal] = []
    private var modelForUser: [Deal] = []
    
    private var sortType: SortType = .date
    private var prefix = 20
    
    let group: DispatchSemaphore = .init(value: 1)
    
    init(server: Server) {
        self.server = server
    }
    
    func performInMainThread(_ block: @escaping () -> ()) {
        if Thread.isMainThread {
            block()
        } else {
            DispatchQueue.main.async {
                block()
            }
        }
    }
}

extension ViewModel: ViewModelInputs {
    
    func fetchData(callback: @escaping () -> Void) {
        self.server.subscribeToDeals { [weak self] deals in
            self?.queue.async {
                self?.model.append(contentsOf: deals)
                self?.model.sort { $0.price < $1.price }
                guard let twentyDeals = self?.model.prefix(self?.prefix ?? 0) else {
                        return
                    }
                    if self?.modelForUser.count == 0 {
                        self?.modelForUser.append(contentsOf: twentyDeals)
                        DispatchQueue.main.async {
                            callback()
                        }
                    }
                var a: [Deal] = []
                    for i in twentyDeals {
                        a.append(i)
                    }
                    if a != self?.modelForUser {
                        self?.modelForUser = []
                        self?.modelForUser.append(contentsOf: twentyDeals)
                        DispatchQueue.main.async {
                            callback()

                    }
                }
            }
        }
    }
    
    func nextDeals() {
        if prefix < model.count {
            prefix += 20
        }
    }
    
    func getDeals() -> [Deal] {
        modelForUser
    }
}

extension ViewModel: ViewModelOutputs {
    
    func changeSortType(_ type: SortType, callback: @escaping () -> Void) {
        
    }
}

enum SortType {
    case date
    case name
    case price
    case amount
}

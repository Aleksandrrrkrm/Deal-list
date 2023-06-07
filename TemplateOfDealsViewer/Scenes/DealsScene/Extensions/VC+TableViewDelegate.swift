//
//  VC+TableViewDelegate.swift
//  TemplateOfDealsViewer
//
//  Created by Александр Головин on 07.06.2023.
//

import UIKit

extension ViewControllerImp: UITableViewDataSource, UITableViewDelegate {
    
  func numberOfSections(in tableView: UITableView) -> Int {
      1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      inputs?.getDeals().count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: DealCell.reuseIidentifier, for: indexPath) as? DealCell else {
          return UITableViewCell()
      }
      guard let data = inputs?.getDeals() else {
          return UITableViewCell()
      }
      if data.count - 1 >= indexPath.row {
          cell.setupCell(data[indexPath.row])
      }
    return cell
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      guard let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderCell.reuseIidentifier) as? HeaderCell else {
          return UIView()
      }
    return cell
  }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let deals = inputs?.getDeals() else { return }
        if deals.count - 1 == indexPath.row {
            inputs?.nextDeals()
        }
    }
//  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    return 60
//  }
}

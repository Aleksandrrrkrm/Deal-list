import UIKit

class ViewControllerImp: UIViewController {
    
    var inputs: ViewModelInputs?
    var outputs: ViewModelOutputs?
    
    var tableView = UITableView()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewFactoryImp.makeViewScene(self)
        setupAllView()
        inputs?.fetchData(callback: { [weak self] in
                self?.tableView.reloadData()
        })
    }
}


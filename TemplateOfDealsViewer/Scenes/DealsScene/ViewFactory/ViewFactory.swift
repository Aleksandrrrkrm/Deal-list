//
//  ViewFactory.swift
//  TemplateOfDealsViewer
//
//  Created by Александр Головин on 07.06.2023.
//

import UIKit

enum ViewFactoryImp {
    
    static func makeViewScene(_ view: ViewControllerImp) {
        let server = Server()
        let viewModel = ViewModel(server: server)
        view.inputs = viewModel
        view.outputs = viewModel
    }
}

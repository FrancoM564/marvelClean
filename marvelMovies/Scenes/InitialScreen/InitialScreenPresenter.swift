//
//  InitialScreenPresenter.swift
//  marvelMovies
//
//  Created by Franco Marquez on 23/08/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the StartApps CleanSwift Xcode Templates. V2.0
//  By Gabriel Lanata (http://StartApps.pe) with credit to http://clean-swift.com
//

import Foundation

class InitialScreenPresenter {

    weak var viewController: InitialScreenViewController?

    // MARK: - Presentation logic
    
    func presentInitialScreen(response: InitialScreenScene.InitialScreen.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        // NOTE: Remember to use workers if complex processing is required
        viewController?.displayInitialScreen(viewModel: InitialScreenScene.InitialScreen.ViewModel())
    }
    
    func presentAlertError(response: InitialScreenScene.AlertError.Response) {
        viewController?.displayAlertError(viewModel: InitialScreenScene.AlertError.ViewModel(
            message: response.error.localizedDescription
        ))
    }

}

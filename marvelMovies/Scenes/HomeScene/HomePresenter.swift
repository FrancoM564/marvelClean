//
//  HomePresenter.swift
//  marvelMovies
//
//  Created by Franco Marquez on 23/08/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the StartApps CleanSwift Xcode Templates. V2.0
//  By Gabriel Lanata (http://StartApps.pe) with credit to http://clean-swift.com
//

import Foundation

class HomePresenter {

    weak var viewController: HomeViewController?

    // MARK: - Presentation logic
    
    func presentinitialLoad(response: HomeScene.initialLoad.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        // NOTE: Remember to use workers if complex processing is required
        
        var heros : [HomeScene.initialLoad.ViewModel.HeroProfileInitialDataLoad.HeroProfileData] = []
        
        for result in response.characterResponse.data.results{
            
            heros.append(HomeScene.initialLoad.ViewModel.HeroProfileInitialDataLoad.HeroProfileData(
                name: result.name,
                photoURL: result.thumbnail.path + "." + result.thumbnail.thumbnailExtension.rawValue,
                heroId: result.id))
        }
        
        viewController?.displayinitialLoad(viewModel: HomeScene.initialLoad.ViewModel.HeroProfileInitialDataLoad(heros: heros))
    }
    
    func presentAlertError(response: HomeScene.AlertError.Response) {
        viewController?.displayAlertError(viewModel: HomeScene.AlertError.ViewModel(
            message: response.error.localizedDescription
        ))
    }

}

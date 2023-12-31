//
//  HeroDetailInteractor.swift
//  marvelMovies
//
//  Created by Franco Marquez on 28/08/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the StartApps CleanSwift Xcode Templates. V2.0
//  By Gabriel Lanata (http://StartApps.pe) with credit to http://clean-swift.com
//

import Foundation

class HeroDetailInteractor {

    var presenter: HeroDetailPresenter?

    // MARK: - Object variables

    // var loadAction: loadAction!

    // MARK: - Business logic

    func doInitialDataLoad(request: HeroDetailScene.InitialDataLoad.Request) {
        // NOTE: Pass the result to the Presenter
        
        let heroId = request.heroId
        
        do {
            CharactersWebService.shared.getCharacterById(heroId: heroId) { response in
                switch response.result {
                    
                case .success(let success):
                    
                    do {
                        let finalData = try JSONDecoder().decode(ResponseCharacters.self, from: success)
                        self.presenter?.presentInitialDataLoad(response: HeroDetailScene.InitialDataLoad.Response(heroResponse: finalData))
                        
                    } catch{
                        self.presenter?.presentAlertError(response: HeroDetailScene.AlertError.Response(error: error))
                    }
                    
                case .failure(let error):
                    self.presenter?.presentAlertError(response: HeroDetailScene.AlertError.Response(error: error))
                }
            }
        } 
    }

}

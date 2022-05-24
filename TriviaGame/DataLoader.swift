//
//  DataLoader.swift
//  TriviaGame
//
//  Created by Or Zino on 23/05/2022.
//

import Foundation

public class DataLoader {
    
    var userData = [UserData]()
    
    init(){
        load()
        //sort()
    }
    
    func load(){
        
        if let fileLocation = Bundle.main.url(forResource: "myData", withExtension: "json"){
            
            do{
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([UserData].self, from: data)
                
                self.userData = dataFromJson
            } catch {
                print(error)
            }
        }
        
    }
    
    func sort() {
        
        self.userData = self.userData.sorted(by: { $0.correct < $1.correct })
        
    }
}

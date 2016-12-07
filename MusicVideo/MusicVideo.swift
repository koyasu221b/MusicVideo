//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by will on 07/12/2016.
//  Copyright © 2016 will. All rights reserved.
//

import Foundation

class Videos{
    private var _vName:String
    private var _vImageUrl:String
    private var _vVideoUrl:String
    
    var vName: String {
        return _vName
    }
    
    var vImageUrl: String {
        return _vImageUrl
    }
    
    var vVideoUrl: String {
        return _vVideoUrl
    }
    
    init(data: JSONDictionary){
        
        
        if let name = data["im:name"] as? JSONDictionary, let vName = name["label"] as? String {
            self._vName = vName
        }else{
            _vName = ""
        }
        
        if let img = data["im:image"] as? JSONArray,
        let image = img[2] as? JSONDictionary,
            let immage = image["label"] as? String {
            _vImageUrl = immage.replacingOccurrences(of: "100x100", with: "600x600")
        }
        else{
            _vImageUrl = ""
        }
        
        if let video = data["link"] as? JSONArray,
            let vUrl = video[1] as? JSONDictionary,
            let vHref = vUrl["attributes"] as? JSONDictionary,
            let vVideoUrl = vHref["href"] as? String {
    
            self._vVideoUrl = vVideoUrl
        }else{
            _vVideoUrl = ""
        }
    }
}

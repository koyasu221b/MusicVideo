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
    private var _vRights:String
    private var _vPrice:String
    private var _vImageUrl:String
    private var _vArtList:String
    private var _vVideoUrl:String
    private var _vImid:String
    private var _vGenre:String
    private var _vLinkToiTunes:String
    private var _vReleaseDte:String
    
    var vImageData: NSData?
    
    var vName: String {
        return _vName
    }
    
    var vRights: String {
        return _vRights
    }
    
    var vPrice: String {
        return _vPrice
    }
    
    var vImageUrl: String {
        return _vImageUrl
    }
    
    var vArtist: String{
        return _vArtList
    }
    
    var vVideoUrl: String {
        return _vVideoUrl
    }
    
    var vImid: String{
        return _vImid
    }
    
    var vGenre: String {
        return _vGenre
    }
    
    var vLinkToiTunes:String {
        return _vLinkToiTunes
    }
    
    var vReleaseDte:String{
        return _vReleaseDte
    }
    
   
  
    
    
    init(data: JSONDictionary){
        
        
        if let name = data["im:name"] as? JSONDictionary, let vName = name["label"] as? String {
            self._vName = vName
        }else{
            self._vName = ""
        }
        
        if let rights = data["rights"] as? JSONDictionary, let vRights = rights["label"] as? String {
            self._vRights = vRights;
        }
        else{
            self._vRights = ""
        }
        
        if let price = data["im:price"] as? JSONDictionary,
            let vPrice = price["label"] as? String{
            self._vPrice = vPrice
        }
        else{
            self._vPrice = ""
        }
        
        if let img = data["im:image"] as? JSONArray,
        let image = img[2] as? JSONDictionary,
            let immage = image["label"] as? String {
            self._vImageUrl = immage.replacingOccurrences(of: "100x100", with: "600x600")
        }
        else{
            self._vImageUrl = ""
        }
        
        if let artist = data["im:artist"] as? JSONDictionary, let vArtist = artist["label"] as? String {
            self._vArtList = vArtist
        }
        else{
            self._vArtList = ""
        }
        
        if let video = data["link"] as? JSONArray,
            let vUrl = video[1] as? JSONDictionary,
            let vHref = vUrl["attributes"] as? JSONDictionary,
            let vVideoUrl = vHref["href"] as? String {
    
            self._vVideoUrl = vVideoUrl
        }else{
            self._vVideoUrl = ""
        }
        
        if let imid = data["id"] as? JSONDictionary,
            let vid = imid["attributes"] as? JSONDictionary, let vImid = vid["im:id"] as? String {
            self._vImid = vImid
        }
        else{
            self._vImid = ""
        }
        
        if let genre = data["category"] as? JSONDictionary, let rel2 = genre["attributes"] as? JSONDictionary,
            let vGenre = rel2["term"] as? String {
            self._vGenre = vGenre
        }
        else{
            self._vGenre = ""
        }
        
        if let release2 = data["id"] as? JSONDictionary,
            let vLinkToiTunes = release2["label"] as? String {
            self._vLinkToiTunes = vLinkToiTunes
        }else{
            self._vLinkToiTunes = ""
        }
        
        if let release2 = data["im:releaseDate"] as? JSONDictionary,
            let rel2 = release2["attributes"] as? JSONDictionary,
            let vReleaseDte = rel2["attributes"] as? String {
            self._vReleaseDte = vReleaseDte
        }else{
            self._vReleaseDte = ""
        }

        
    }
}

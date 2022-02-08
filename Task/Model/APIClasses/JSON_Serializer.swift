//
//  JSON_Serializer.swift
//  Task
//
//  Created by Sara Babaei on 2/8/22.
//

import Foundation

class JSON_Serializer {
    //MARK: Decoding
    func decodeData(data: Data) -> NSDictionary? {
        if let result = try? JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
            return result
        }
        print("Could not save new data")
        return nil
    }
    
    func decodeDataToArray(data: Data) -> NSArray? {
        if let result = try? JSONSerialization.jsonObject(with: data, options: []) as? NSArray {
            return result
        }
        print("Could not save new data")
        return nil
    }
}

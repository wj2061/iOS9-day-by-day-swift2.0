//
//  Destination.swift
//  MapKitTransit
//
//  Created by WJ on 15/11/12.
//  Copyright © 2015年 wj. All rights reserved.
//

import Foundation
import MapKit

class Destination{
    let coordinate:CLLocationCoordinate2D
    private var addressDictionary: [String:AnyObject]
    let name :String
    
    init(withName placeName: String,
        latitude: CLLocationDegrees,
        longitude: CLLocationDegrees,
        address:[String:AnyObject])
    {
        name = placeName
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        addressDictionary = address
    }
    
    var mapItem:MKMapItem{
        get{
            let placeMark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
            let  item = MKMapItem(placemark: placeMark)
            return  item
        }
    }
}

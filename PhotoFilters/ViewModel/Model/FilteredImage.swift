//
//  FilteredImage.swift
//  PhotoFilters
//
//  Created by blaze  on 12/23/22.
//

import SwiftUI

struct FilteredImage : Identifiable {
    
    var id = UUID().uuidString
    var image: UIImage
    var filter: CIFilter
    var isEditable : Bool
    
    
    
}

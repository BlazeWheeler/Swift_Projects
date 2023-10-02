//
//  HomeViewModel.swift
//  PhotoFilters
//
//  Created by blaze  on 12/23/22.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

class HomeViewModel : ObservableObject {
    
    
    @Published var imagePicker = false
    @Published var imageData = Data(count: 0)
    
    @Published var allImages: [FilteredImage] = []
    
    // Main Editing Image
    @Published var mainView : FilteredImage!
    
    // Slider for Intensity ETC
    // Since didnt set while reading image
    // So all will be full value
    @Published var value : CGFloat = 1.0
    
    // Loading Filter Option When Ever Image is Selected
    
        // Use your own filters HERE:
    let filters : [CIFilter] = [
        CIFilter.sepiaTone(), CIFilter.comicEffect(), CIFilter.colorInvert(),CIFilter.photoEffectFade(), CIFilter.colorMonochrome(), CIFilter.photoEffectChrome(), CIFilter.gaussianBlur(), CIFilter.bloom()
    ]
    
    func loadFilter() {
        
        let context = CIContext()
    
        filters.forEach { (filter) in
            
            // To avoid Lag do it in the background
            DispatchQueue.global(qos: .userInteractive).async {
                
                // Loading image into filter
                
                let ciImage = CIImage(data: self.imageData)
                
                filter.setValue(ciImage!, forKey: kCIInputImageKey)
                
                    // retreving Image
                guard let newImage = filter.outputImage else {return}
                
                    // Creating UIImage
                let cgimage = context.createCGImage(newImage, from: newImage.extent)
                
                let isEditable = filter.inputKeys.count > 1
                
                let filteredData = FilteredImage(image: UIImage(cgImage: cgimage!), filter: filter, isEditable: isEditable)
                
                
                DispatchQueue.main.async {
                    self.allImages.append(filteredData)
                    
                    // default is the first Filter
                    if self.mainView == nil{self.mainView = self.allImages.first}
                }
            }
        }
    }
    
    
    func updateEffect() {
        
        let context = CIContext()
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            // Loading image into filter
            
            let ciImage = CIImage(data: self.imageData)
            let filter = self.mainView.filter
            
            
            filter.setValue(ciImage, forKey: kCIInputImageKey)
            
                // retreving Image
                //print(filter.inputKeys)
            
                // There are a lot of custom options
                // Only using radius and intensity
                // Use your own as fit
          
            
            // Radius
            // Radius Range up to 100
            if filter.inputKeys.contains("inputRadius") {
                filter.setValue(self.value * 10, forKey: kCIInputRadiusKey)
            }
            // Radius
            if filter.inputKeys.contains("inputIntensity") {
                filter.setValue(self.value * 10 , forKey: kCIInputIntensityKey)
            }
            
            
            guard let newImage = filter.outputImage else {return}
            
                // Creating UIImage
            let cgimage = context.createCGImage(newImage, from: newImage.extent)
            
            DispatchQueue.main.async {
              
                // Updating Image
                self.mainView.image = UIImage(cgImage: cgimage!)
            }
        }
    }
}

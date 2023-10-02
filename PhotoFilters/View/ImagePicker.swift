//
//  ImagePicker.swift
//  PhotoFilters
//
//  Created by blaze  on 12/23/22.
//

import SwiftUI
import PhotosUI

struct ImagePicker : UIViewControllerRepresentable {
    
    
    @Binding var picker : Bool
    @Binding var imageData : Data
    
    
    
    func makeCoordinator() -> Coordinator {
        
        return ImagePicker.Coordinator(parent: self)
    }
    

    func makeUIViewController(context: Context) -> PHPickerViewController {
        
        let picker = PHPickerViewController(configuration: PHPickerConfiguration())
        picker.delegate = context.coordinator
        
        return picker
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class Coordinator : NSObject, PHPickerViewControllerDelegate {
        
        var parent : ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            
            // Checking image is selected or cancelled..
            
            if !results.isEmpty{
                
                if results.first!.itemProvider.canLoadObject(ofClass: UIImage.self){
                    
                    results.first!.itemProvider.loadObject(ofClass: UIImage.self) {
                        (image, err ) in
                        
                        DispatchQueue.main.sync {
                            self.parent.imageData = (image as! UIImage).pngData()!
                            self.parent.picker.toggle()
                        }
                    }
                }
            }
            else {
                self.parent.picker.toggle()
            }
        }
    }
}


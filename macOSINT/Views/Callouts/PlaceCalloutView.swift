//
//  PlaceCalloutView.swift
//  macOSINT
//
//  Created by BLSEC on 5/22/22.
//

import Foundation
import AppKit
import MapKit

class PlaceCalloutView: NSView {
    private var annotation: PlaceAnnotation
    
    private var selectShowDirections: (PlaceAnnotation) -> Void
    
    lazy var directionsButton: NSButton = {
        let directionsButton = NSButton(frame: NSRect(x: 0, y: 0, width: 100, height: 100))
        directionsButton.title = "Get Directions"
        directionsButton.wantsLayer = true
        directionsButton.isBordered = false
        directionsButton.target = self
        directionsButton.action = #selector(handleShowDirections)
        return directionsButton
    }()
    
    lazy var phoneTextField: NSTextField = {
        let phoneTextField = NSTextField(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        phoneTextField.stringValue = "Phone \n \(annotation.phone)"
        phoneTextField.isEditable = false
        phoneTextField.isBezeled = false
        
        return phoneTextField
    }()
    
    lazy var addressTextField: NSTextField = {
        let addressTextField = NSTextField()
        addressTextField.stringValue = annotation.address
        addressTextField.isEditable = false
        addressTextField.isBezeled = false
        
        return addressTextField
    }()
    
    @objc func handleShowDirections() {
        selectShowDirections(annotation)
    }
    
    init(annotation: PlaceAnnotation, frame: CGRect = CGRect(x: 0, y: 0, width: 400, height: 400),
         selectShowDirections: @escaping (PlaceAnnotation) -> Void) {
        self.annotation = annotation
        self.selectShowDirections = selectShowDirections
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not Implemented")
    }
    
    private func configure() {
        let stackView = NSStackView(frame: frame)
        stackView.alignment = .left
        stackView.orientation = .vertical
        stackView.edgeInsets = .init(top: 0, left: 20, bottom: 0, right: 20)
        
        let options = MKMapSnapshotter.Options()
        options.size = CGSize(width: frame.width, height: frame.height/2)
        options.mapType = .standard
        
        options.camera = MKMapCamera(lookingAtCenter: annotation.coordinate, fromDistance: 250, pitch: 65, heading: 0)
        
        let snapshotter = MKMapSnapshotter(options: options)
        
        snapshotter.start { snapshot, error in
            guard let snapshot = snapshot, error == nil else { return }
            
            DispatchQueue.main.async {
                let imageView = NSImageView(frame: NSRect(x: 0, y: 0, width: 100, height: 100))
                imageView.image = snapshot.image
                stackView.insertView(imageView, at: 0, in: .top)
            }
        }
        
        stackView.addArrangedSubview(directionsButton)
        stackView.addArrangedSubview(phoneTextField)
        stackView.addArrangedSubview(addressTextField)
        
        let scrollView = NSScrollView(frame: frame)
        scrollView.hasVerticalScroller = true
        scrollView.documentView = stackView
        
        self.addSubview(scrollView)
    }
}

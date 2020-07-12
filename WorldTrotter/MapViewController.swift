//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by USER on 11/07/2020.
//  Copyright © 2020 USER. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var mapView: MKMapView!

    
    
    override func loadView(){
        //지도 뷰 생성
        mapView = MKMapView()
//        //지도 뷰를 이 뷰 컨트롤러의 view로 설정
        view = mapView

        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid","Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: Selector("mapTypeChanged:"), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let margins = view.layoutMarginsGuide

        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }

    func mapTypeChanged(segControl: UISegmentedControl){
              switch segControl.selectedSegmentIndex{
              case 0:
                  mapView.mapType = .standard
              case 1:
                  mapView.mapType = .hybrid
              case 2:
                  mapView.mapType = .satellite
              default:
                  break
              }
          }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view")
    }
    
}

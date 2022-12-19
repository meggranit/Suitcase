//
//  SelectedTripMapRepresentable.swift
//  Suitcase
//
//  Created by meg on 12/18/22.
//

import SwiftUI
import MapKit

struct SelectedTripMapRepresentable: UIViewRepresentable {
    let mapView = MKMapView()
    let locationManager = LocationManager()
    @EnvironmentObject var locationViewModel: LocationViewModel
    @Binding var trip: Trip
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        let coordinate = CLLocationCoordinate2DMake(Double(trip.latitude)!,Double(trip.longitude)!)
        context.coordinator.addAndSelectAnnotation(withCoordinate: coordinate)
        
        //if let coordinate = locationViewModel.selectedLocationCoordinate {
            //context.coordinator.addAndSelectAnnotation(withCoordinate: coordinate)
        
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension SelectedTripMapRepresentable {
    class MapCoordinator: NSObject, MKMapViewDelegate {
        let parent: SelectedTripMapRepresentable
        
        init(parent: SelectedTripMapRepresentable) {
            self.parent = parent
            super.init()
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            
            //parent.mapView.setRegion(region, animated: true)
        }
        
        func addAndSelectAnnotation(withCoordinate coordinate: CLLocationCoordinate2D){
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            let anno = MKPointAnnotation()
            anno.coordinate = coordinate
            self.parent.mapView.addAnnotation(anno)
            self.parent.mapView.selectAnnotation(anno, animated: true)
            
            parent.mapView.showAnnotations(parent.mapView.annotations, animated: true)
        }
        
        
        
    }
}

//
//  MapViewController.swift
//  Cafegram2EN
//
//  Created by Farukh IQBAL on 23/06/2018.
//  Copyright © 2018 Farukh IQBAL. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    var cafe = Cafe()
    // camera region
    let regionRadius: CLLocationDistance = 1000

    // handling user location
    let locationManager = CLLocationManager()
    
    var currentUserLocation: CLLocation? {
        didSet{
            if let userLocation = currentUserLocation, oldValue == nil {
                   centerMapOnLocation(location: userLocation)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the mapView
        mapView.delegate = self
        mapView.showsTraffic = true
        mapView.showsScale = true
        mapView.showsCompass = true

        mapView.showsUserLocation = true
        
        // Check for Location Services
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()

        
        for hospital in SharedHospitals.hospitals{
            if let hospitallat = hospital.lat, let hospitallong = hospital.long{
                let location = CLLocationCoordinate2DMake(hospitallat, hospitallong)
                let marker = MKPointAnnotation()
                marker.coordinate = location
                marker.title = hospital.name
                mapView.addAnnotation(marker)
            }
        }
        // Convert address to coordinate and annotate it on map
      
      
        // *** use marker
     //     let location = CLLocationCoordinate2DMake(3.23113, 1.13297)
    //    let marker = MKPointAnnotation()
     //   marker.coordinate = location
        
/*
           let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(cafe.location) { (placemarks, error) in
            if let error = error {
                print(error)
                return
            }
            
            if let placemarks = placemarks {
                // Get the first placemark
                let placemark = placemarks[0]
                
                // Add annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.cafe.name
                annotation.subtitle = self.cafe.type
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    
                    // Display the annotation
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
        }
 */
      //  let locationnnn = CLLocation(latitude: CLLocationDegrees(exactly: 36.773095
    //        )!, longitude: CLLocationDegrees(exactly: 10.230046)!)
     //   centerMapOnLocation(location: locationnnn)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    // MARK: - Customizing the annotation
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyMarker"
        
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        // Reuse the annotation if possible
        var annotationView: MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        
        annotationView?.glyphText = "😍"
        annotationView?.markerTintColor = .red
        
        return annotationView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension MapViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentUserLocation = locations.first
        print("current location ", locations.first ?? "nil")
    }
}

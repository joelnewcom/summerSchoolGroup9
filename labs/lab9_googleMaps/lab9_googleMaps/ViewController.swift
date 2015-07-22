//
//  ViewController.swift
//  lab9_googleMaps
//
//  Created by X Code User on 7/21/15.
//  Copyright (c) 2015 gvsu.edu. All rights reserved.
//

import UIKit
import GoogleMaps


class ViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.delegate = self
        //self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        //self.locationManager.distanceFilter = 500
        self.locationManager.requestWhenInUseAuthorization()
        
        var camera = GMSCameraPosition.cameraWithLatitude(43.774667, longitude: -114.185137, zoom: 4)
        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.settings.compassButton = true
        self.view = mapView
        mapView.delegate = self
        
        
        readData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func readData(){
        // open and parse a file named data.json dragged into my iOS project
        var filePath = NSBundle.mainBundle().pathForResource("locations", ofType:"json")
        var data = NSData(contentsOfFile:filePath!)
        var parseError: NSError?
        let parsedObject: AnyObject? = NSJSONSerialization.JSONObjectWithData(data!,
            options: NSJSONReadingOptions.AllowFragments,
            error:&parseError)
        if let topLevelObj = parsedObject as? NSDictionary {
            if let data = topLevelObj["data"] as? NSArray{
                for locationItem in data{
                    var location = Location(
                        company: String(stringInterpolationSegment: locationItem[0]),
                        phone: String(stringInterpolationSegment: locationItem[1]),
                        location: String(stringInterpolationSegment: locationItem[2]))
                    setPin(location)
                }
            }
        }
    }
    
    func setPin(location: Location){
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(location.latitude, location.longitude)
        marker.title = location.company
        marker.snippet  = location.phone
        marker.appearAnimation = kGMSMarkerAnimationPop
        marker.userData = location
        marker.map = self.view as! GMSMapView
    }
    
    func mapView(mapView: GMSMapView!, didTapInfoWindowOfMarker marker: GMSMarker!) {
        if let location = marker.userData as? Location {
            let message = "Phone number is: \(location.phone)"
            let alertController = UIAlertController(title: "Contact", message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: { (mp: UIAlertAction!) -> Void in
            }))
            self.presentViewController(alertController, animated: true) { () -> Void in
                
            }
        }
    }
    
    func mapView(mapView: GMSMapView!, markerInfoWindow marker: GMSMarker!) -> UIView! {
        if let location = marker.userData as? Location {
            var infoWindow = NSBundle.mainBundle().loadNibNamed("InfoPopup", owner: self, options: nil).first! as! InfoPopup
            infoWindow.companyLabel.text = location.company
            infoWindow.phoneLabel.text = location.phone
            return infoWindow
        }
        return nil
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        updateLocation(false)
        updateLocation(true)
    }
    
    func updateLocation(running: Bool) {
        let mapView = self.view as! GMSMapView
        let status = CLLocationManager.authorizationStatus()
        if running {
            if (CLAuthorizationStatus.AuthorizedWhenInUse == status) {
                locationManager.startUpdatingLocation()
                mapView.myLocationEnabled = true
                mapView.settings.myLocationButton = true
            }
        } else {
            locationManager.stopUpdatingLocation()
            mapView.settings.myLocationButton = false
            mapView.myLocationEnabled = false
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        updateLocation(true)
    }
}


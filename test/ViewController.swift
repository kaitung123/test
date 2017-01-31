//
//  ViewController.swift
//  test
//
//  Created by Tom Cheung on 2017-01-30.
//  Copyright © 2017 Tom Cheung. All rights reserved.
//

import UIKit
import MoPub


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MPTableViewAdPlacerDelegate {

    @IBOutlet weak var tableView: UITableView!
    let adUnitID = "150d6ea246dc4536b165dd466c9a7215"
    var placer:MPTableViewAdPlacer?
    
    var dataSource:[String]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.mp_setDelegate(self)
        self.tableView.mp_setDataSource(self)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.setupDataSource()
        self.setupAdPlacer()
        
        self.tableView.mp_reloadData()
        
    }
    
    func setupDataSource(){
        
        self.dataSource = [String]()
        
        for index in 0...20{
            self.dataSource?.append("My Index: \(index)")
        }
    }
    
    func setupAdPlacer(){
        
        let targeting: MPNativeAdRequestTargeting! = MPNativeAdRequestTargeting()
        targeting.desiredAssets = Set([kAdIconImageKey, kAdCTATextKey, kAdTextKey, kAdTitleKey])
        targeting.location = CLLocation(latitude: 37.1, longitude: -122.2)
        
        let positioning:MPAdPositioning = MPAdPositioning()
        
        let settings:MPStaticNativeAdRendererSettings = MPStaticNativeAdRendererSettings()
        
        settings.renderingViewClass = MPTableViewAdPlacerView.self
        settings.viewSizeHandler = {(maximumWidth: CGFloat) -> CGSize in
            let size:CGSize = CGSize(width: maximumWidth, height: 333)
            return size
        }
        
        let config:MPNativeAdRendererConfiguration = MPStaticNativeAdRenderer.rendererConfiguration(with: settings)
        config.supportedCustomEvents = ["MPMoPubNativeCustomEvent"]
        
        self.placer = MPTableViewAdPlacer(tableView: self.tableView, viewController: self, adPositioning: positioning, rendererConfigurations: [config])
        self.placer?.delegate = self
        self.placer?.loadAds(forAdUnitID: adUnitID, targeting: targeting)
    }
    
    func nativeAdWillPresentModal(for placer: MPTableViewAdPlacer!) {
        print("tableview ad place will present modal")
    }
    
    func nativeAdDidDismissModal(for placer: MPTableViewAdPlacer!) {
        print("table view ad placer did dismiss modal")
    }
    
    func nativeAdWillLeaveApplication(from placer: MPTableViewAdPlacer!) {
        print("table view add place will elave application")
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.dataSource?.count)
        return (self.dataSource?.count)!
        
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell? = tableView.mp_dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell?
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        let data = self.dataSource?[indexPath.row]
        
        
        cell?.textLabel?.text = data

        return cell! 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .mp_deselectRow(at: indexPath, animated: true)
    }

}


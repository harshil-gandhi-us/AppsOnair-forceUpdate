 //
 //  UpdateManager.swift
 //  AppUpdateManager
 //
 //  Created by lw-66 on 29/09/22.
 //

 import Foundation
 import UIKit
 import AVFoundation
 import AppsOnAirIOSCore

 public class AppsOnAirServices : NSObject {
     private var appId: String = ""
     private var window: UIWindow?
     let appUpdateManager = AppsOnAirCoreServices.shared
     
     public func checkForAppUpdate(_ completion : @escaping (NSDictionary) -> (),_ showNativeUI: Bool = false) {
         self.appId = appUpdateManager.getAppId();
         print("appID \(self.appId)")
         if self.appId != "" {
             appUpdateManager.networkStatusListenerHandler { isConnected in
                 if(showNativeUI) {
                     AppUpdateRequest.fetchAppUpdate(self.appId) { (appUpdateInfo) in
                         if (appUpdateInfo.count > 0 || appUpdateInfo["error"] != nil) {
                             self.presentAppUpdate(appUpdateInfo: appUpdateInfo)
                         }
                     }
                 } else {
                     AppUpdateRequest.fetchAppUpdate(self.appId) { (appUpdateData) in
                         completion(appUpdateData)
                     }
                 }
             }
         }   
     }
     func presentAppUpdate(appUpdateInfo: NSDictionary) {
         if (appUpdateInfo.count > 0) {
             DispatchQueue.main.sync {
                 let bundle = Bundle(for: type(of: self))
                 let storyboard = UIStoryboard(name: "AppUpdate", bundle: bundle)
                 let modalVc = storyboard.instantiateViewController(withIdentifier: "MaintenanceViewController") as! MaintenanceViewController
                 modalVc.updateDataDictionary = appUpdateInfo
                 
                 if let topController = UIApplication.topMostViewController(), !(topController is MaintenanceViewController) {
                     let navController = UINavigationController(rootViewController: modalVc)
                     navController.modalPresentationStyle = .overCurrentContext
                     let topController = UIApplication.topMostViewController()
                     topController?.present(navController, animated: true) {
                         // This code snippet is for fixing one UI accessability related bug for our other cross platform plugin
                         NotificationCenter.default.post(name: NSNotification.Name("visibilityChanges"), object: nil, userInfo: ["isPresented": true])
                     }
                 }
                 
             }
         }
     
     }
 }



import UIKit
import AVFoundation
//
public class AppsOnAirCoreServices : NSObject, NetworkServiceDelegate {
    public static let shared = AppsOnAirCoreServices()
    private var appId: String = ""
    public var isNetworkConnected: Bool = false
    private var window: UIWindow?
    private var errorMessage:String = "AppsOnAir AppId is missing for more details: \n https://documentation.appsonair.com"
    var networkService: NetworkService = ReachabilityNetworkService()

    public func getAppId() -> (String) {
        self.appId = Bundle.main.infoDictionary?["appId"] as? String ?? "";
        if self.appId == "" {
            #if DEBUG
                fatalError(errorMessage)
            #else
                print(errorMessage)
            #endif
        }
        else{
            return appId
        }

    }
    
    public func isConnectedNetwork()-> Bool{
        return isNetworkConnected
    }
    
    func networkStatusDidChange(status: Bool) {
        isNetworkConnected = status
        networkStatusChangeHandler?(status)
    }
    // Closure type for network status change handler
    public typealias NetworkStatusChangeHandler = (Bool) -> Void
    private var networkStatusChangeHandler: NetworkStatusChangeHandler?
      
      // Method to set the network status change handler
    public func networkStatusListnerHandler(_ handler: @escaping NetworkStatusChangeHandler) {
        networkService.delegate = self
        networkService.startMonitoring()
        networkStatusChangeHandler = handler
      }
    
}

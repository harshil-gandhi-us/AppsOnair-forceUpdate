

import UIKit
import AVFoundation

public class AppsOnAirCoreServices : NSObject, NetworkServiceDelegate {
    
    private var appId: String = ""
    public var isNetworkConnected: Bool = false
    private var window: UIWindow?
    var networkService: NetworkService = ReachabilityNetworkService()

    public func getAppId() -> (String) {
        networkService.delegate = self
        networkService.startMonitoring()
        let appId = Bundle.main.infoDictionary?["appId"] as? String ?? ""
        self.appId = appId;
        return appId
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
          networkStatusChangeHandler = handler
      }
    
}

//
//  Extension+AVPlayer.swift
//  
//
//  Created by Pavel Moslienko on 19.09.2020.
//

import AVFoundation
import AVKit

public extension AVPlayer {
    
    var isPlaying: Bool {
        return rate != 0 && error == nil
    }
    
}

#if canImport(UIKit)
import UIKit
class CustomPlayerViewController: AVPlayerViewController {
    
    typealias DissmissBlock = () -> Void
    var onDismiss: DissmissBlock?
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isBeingDismissed {
            onDismiss?()
        }
    }
}

#endif

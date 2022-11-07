import Foundation
import UIKit
import AsyncDisplayKit
import Lottie

public final class AnimationNode : ASDisplayNode {
    public init(animation: Animation) {
        super.init()
        
        self.setViewBlock({
            let view = AnimationView(animation: animation)
            view.backgroundColor = .clear
            view.isOpaque = true
            return view
        })
    }
    
    private func animationView() -> AnimationView? {
        return self.view as? AnimationView
    }
    
    public func loop() {
        if let animationView = self.animationView() {
            animationView.loopMode = .loop
            animationView.play()
        }
    }
    
    public func stop() {
        if let animationView = self.animationView() {
            animationView.stop()
        }
    }
}

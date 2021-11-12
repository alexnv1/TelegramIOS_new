import Foundation
import UIKit

import LottieMeshSwift

public final class ViewController: UIViewController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        let path = Bundle.main.path(forResource: "Fireworks", ofType: "json")!
        //let path = Bundle.main.path(forResource: "Cat", ofType: "json")!
        /*for _ in 0 ..< 100 {
            let _ = generateMeshAnimation(data: try! Data(contentsOf: URL(fileURLWithPath: path)))!
        }*/
        
        if #available(iOS 13.0, *) {
            let animation = generateMeshAnimation(data: try! Data(contentsOf: URL(fileURLWithPath: path)))!
            let renderer = MeshRenderer(wireframe: true)!
            
            renderer.frame = CGRect(origin: CGPoint(x: 0.0, y: 50.0), size: CGSize(width: 300.0, height: 300.0))
            self.view.addSubview(renderer)
            
            renderer.add(mesh: animation, offset: CGPoint(), loop: true)
        }
    }
}

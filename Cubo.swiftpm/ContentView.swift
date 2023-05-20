import SwiftUI
import SceneKit

struct MySceneView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> SCNViewController {
        let viewController = SCNViewController()
        return viewController
    }
    
    func updateUIViewController(_ viewController: SCNViewController, context: Context) {}
}

class SCNViewController: UIViewController {
    var view3d: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Crea una vista de SceneKit
        view3d = SCNView(frame: view.bounds)
        
        // Configura la vista
        view3d.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view3d.allowsCameraControl = true
        view3d.backgroundColor = UIColor.gray
        
        // Crea una escena vacía
        let scene = SCNScene()
        
        // Crea un nodo para el cubo
        let cubeNode = SCNNode()
        
        // Crea una geometría de cubo
        let cubeGeometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
        
        // Crea un material para el cubo
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.red
        
        // Aplica el material a la geometría del cubo
        cubeGeometry.materials = [material]
        
        // Asigna la geometría al nodo del cubo
        cubeNode.geometry = cubeGeometry
        
        // Agrega el nodo del cubo a la escena
        scene.rootNode.addChildNode(cubeNode)
        
        // Asigna la escena a la vista
        view3d.scene = scene
        view3d.backgroundColor = .clear
        
        // Agrega la vista a la vista principal
        view.addSubview(view3d)
    }
}

struct ContentView: View {
    var body: some View {
        MySceneView()
    }
}

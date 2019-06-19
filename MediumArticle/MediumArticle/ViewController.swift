//
//  ViewController.swift
//  MediumArticle
//
//  Created by Felipe Petersen on 18/06/19.
//  Copyright © 2019 Felipe Petersen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var view1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.animateView()
    }
    
    //Animação simples da constraint do top da view1 (azul)
    func animateView() {
        self.topConstraint.constant = 0
        UIView.animate(withDuration: 3) {
            self.view.layoutIfNeeded()
        }
    }
    
    //Printar as constraints da view1 (azul)
    func printConstraints() {
        let consts = self.view1.getAllConstraints()
        for const in consts {
            print(const)
        }
    }
    
    func getConstraintFromIdentifier() {
        let topConstraint = self.view1.getAllConstraints().first { $0.identifier == "top"}
    }


}

extension UIView {
    func getAllConstraints() -> [NSLayoutConstraint] {
        
        // Criamos um array onde estarão a nossa view e suas superviews.
        var views = [self]
        
        // pegar a superview dela mesma até chegar na mais externa.
        var view = self
        while let superview = view.superview {
            views.append(superview)
            view = superview
        }
        
        //retornar todas as constraints das views e retornar todas aquelas
        //que fazem alguma referencia a nossa view (self)
        return views.flatMap({ $0.constraints }).filter { constraint in
            return constraint.firstItem as? UIView == self ||
                constraint.secondItem as? UIView == self
        }
    }
    
}

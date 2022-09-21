//
//  UIView + Extension.swift
//  Cup Champions
//
//  Created by Ricardo Santos on 16/09/22.
//

import UIKit

//MARK: Design System View Extension
extension UIView {
    static func contentView() -> UIView{
        let view = UIView()
        view.backgroundColor = .white
        return view.useConstraint()
    }
}

//MARK: View manipulation
extension UIView {
    func sv(_ views: [UIView]) {
        views.forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        })
    }
    
    func sv(_ views: UIView?...) {
        sv(views.compactMap({$0}))
    }
    
    public func checkTranslatesAutoresizingMaskIntoConstraints() {
        if translatesAutoresizingMaskIntoConstraints {
            translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    @discardableResult
    func useConstraint() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    @discardableResult
    public func top(equalTo: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> Self {
        checkTranslatesAutoresizingMaskIntoConstraints()
        self.topAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func top(equalTo view: UIView, constant: CGFloat = 0) -> Self {
        return top(equalTo: view.topAnchor, constant: constant)
    }
    
    @discardableResult
    public func topToBottom(of view: UIView, constant: CGFloat = 0) -> Self {
        checkTranslatesAutoresizingMaskIntoConstraints()
        self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func leading(equalTo: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> Self {
        checkTranslatesAutoresizingMaskIntoConstraints()
        self.leadingAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func leading(equalTo view: UIView, constant: CGFloat = 0) -> Self {
        return leading(equalTo: view.leadingAnchor, constant: constant)
    }
    
    @discardableResult
    public func trailing(equalTo: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> Self {
        checkTranslatesAutoresizingMaskIntoConstraints()
        self.trailingAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func trailing(greaterThanOrEqualTo: NSLayoutXAxisAnchor, constant: CGFloat = 0,
                      priority: UILayoutPriority = .required) -> Self {
        checkTranslatesAutoresizingMaskIntoConstraints()
        let constraint = self.trailingAnchor.constraint(greaterThanOrEqualTo: greaterThanOrEqualTo,
                                                     constant: constant)
        constraint.isActive = true
        constraint.priority = priority
        return self
    }
    
    @discardableResult
    public func trailing(equalTo view: UIView, constant: CGFloat = 0) -> Self {
        return trailing(equalTo: view.trailingAnchor, constant: constant)
    }
    
    @discardableResult
    public func bottom(equalTo: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> Self {
        checkTranslatesAutoresizingMaskIntoConstraints()
        self.bottomAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func bottom(equalTo view: UIView, constant: CGFloat = 0) -> Self {
        return bottom(equalTo: view.bottomAnchor, constant: constant)
    }
    
    @discardableResult
    public func centerX(equalTo: UIView, constant: CGFloat = 0) -> Self {
        checkTranslatesAutoresizingMaskIntoConstraints()
        self.centerXAnchor.constraint(equalTo: equalTo.centerXAnchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func centerY(equalTo: UIView, constant: CGFloat = 0) -> Self {
        checkTranslatesAutoresizingMaskIntoConstraints()
        self.centerYAnchor.constraint(equalTo: equalTo.centerYAnchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func center(in view:UIView) -> Self {
        checkTranslatesAutoresizingMaskIntoConstraints()
        self.centerY(equalTo: view)
        self.centerX(equalTo: view)
        return self
    }
    
    @discardableResult
    public func width(constant: CGFloat) -> Self {
        checkTranslatesAutoresizingMaskIntoConstraints()
        self.widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func width(equalTo view: UIView, multiplier: CGFloat = 1) -> Self {
        checkTranslatesAutoresizingMaskIntoConstraints()
        self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier).isActive = true
        return self
    }
    
    @discardableResult
    public func height(constant: CGFloat) -> Self {
        checkTranslatesAutoresizingMaskIntoConstraints()
        self.heightAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func heightGreaterThanOrEqualTo(constant: CGFloat = 0) -> Self {
        checkTranslatesAutoresizingMaskIntoConstraints()
        let constraint = self.heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
        constraint.isActive = true
        return self
    }
    
    @discardableResult
    public func height(equalTo view: UIView, multiplier: CGFloat = 1, priority: Float = 1000) -> Self {
        checkTranslatesAutoresizingMaskIntoConstraints()
        let constraint = self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier)
        constraint.priority = UILayoutPriority(rawValue: priority)
        constraint.isActive = true
        
        return self
    }
    
    @discardableResult
    public func size(constant: CGFloat) -> Self {
        checkTranslatesAutoresizingMaskIntoConstraints()
        self.heightAnchor.constraint(equalToConstant: constant).isActive = true
        self.widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func size(width: CGFloat, height:CGFloat) -> Self {
        checkTranslatesAutoresizingMaskIntoConstraints()
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult
    public func fillTo(view: UIView, constant: CGFloat = 0, safeArea: Bool = true) -> Self {
        if #available(iOS 11.0, *) {
            top(equalTo: safeArea ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor, constant: constant)
                .bottom(equalTo: safeArea ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor, constant: -constant)
                .leading(equalTo: view.leadingAnchor, constant: constant)
                .trailing(equalTo: view.trailingAnchor, constant: -constant)
        } else {
            top(equalTo: view.topAnchor, constant: constant)
                .bottom(equalTo: view.bottomAnchor, constant: -constant)
                .leading(equalTo: view.leadingAnchor, constant: constant)
                .trailing(equalTo: view.trailingAnchor, constant: -constant)
        }
        return self
    }
    
    @discardableResult
    public func fillParent(constant: CGFloat = 0, safeArea: Bool = true) -> Self {
        if let parent = self.superview {
            fillTo(view: parent)
        }
        return self
    }
    
    @discardableResult
    public func fillToHorizontal(view: UIView, constant: CGFloat = 0) -> Self {
        leading(equalTo: view.leadingAnchor, constant: constant)
            .trailing(equalTo: view.trailingAnchor, constant: -constant)
        return self
    }
    
    @discardableResult
    public func fillToVertical(view: UIView, constant: CGFloat = 0) -> Self {
        top(equalTo: view.topAnchor, constant: constant)
            .bottom(equalTo: view.bottomAnchor, constant: -constant)
        return self
    }
}

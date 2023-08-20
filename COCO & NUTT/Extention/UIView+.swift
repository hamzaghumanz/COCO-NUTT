//
//  UIView+.swift
//  COCO & NUTT
//
//  Created by MacBook Pro on 20/08/2023.
//
import UIKit

extension UIView{
    func safeAreaInsets() -> UIEdgeInsets {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        return windowScene?.windows.first?.safeAreaInsets ?? .zero
    }
}

//
//  OnBoardVC.swift
//  ShoppingListApp
//
//  Created by Kaan Uzman on 30/11/23.
//
import Lottie
import SnapKit
import UIKit

final class OnBoardVC: UIViewController {
    override func loadView() {
        let onBoardView = OnBoardView()
        view = onBoardView
        onBoardView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension OnBoardVC: OnBoardViewProtocol {
    func onTappedStartButton() {
        print("Start Button Tapped")
    }
}

#Preview {
    OnBoardVC()
}

//
//  LaunchView.swift
//  CornFarmer
//
//  Created by 이상현 on 2022/04/28.
//

import UIKit
import Then
import SnapKit

class LaunchView: BaseView {
    
    let loadingView = UIImageView().then {
        $0.image = R.image.cornfarmerProfile()
        $0.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        $0.contentMode = .scaleAspectFit
    }
    
    override func setup() {
        addSubview(loadingView)
    }
    
    override func bindConstraints() {
        self.loadingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func startAnimation(completion: @escaping (() -> Void)) {
        UIView.animate(
            withDuration: 0.5,
            animations: { [weak self] in
                self?.alpha = 0
            }) { _ in
                completion()
            }
    }
}

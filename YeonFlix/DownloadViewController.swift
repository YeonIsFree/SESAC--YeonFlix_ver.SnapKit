//
//  DownloadViewController.swift
//  YeonFlix
//
//  Created by Seryun Chun on 2023/12/27.
//

import UIKit

class DownloadViewController: UIViewController {
    
     // MARK: - UI Properties
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "'나만의 자동 저장' 기능"
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .white
        return label
    }()
    
    let subLabel: UILabel = {
        let label = UILabel()
        label.text = "취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다. 디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요!"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    let mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .dummy)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("설정하기", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemIndigo
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        return button
    }()
    
    let subButton: UIButton = {
        let button = UIButton()
        button.setTitle("저장 가능한 콘텐츠 살펴보기", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        return button
    }()

     // MARK: - Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        render()
    }
    
     // MARK: - UI Configure Method
    
    func render() {
        view.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(100)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(subLabel)
        subLabel.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(100)
        }
        
        view.addSubview(mainImage)
        mainImage.snp.makeConstraints { make in
            make.top.lessThanOrEqualTo(subLabel.snp.bottom).inset(20)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(40)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
        
        view.addSubview(subButton)
        subButton.snp.makeConstraints { make in
            make.top.equalTo(button.snp.bottom).offset(20)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }
    }
}

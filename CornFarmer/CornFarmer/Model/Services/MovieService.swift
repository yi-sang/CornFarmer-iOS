//
//  MovieService.swift
//  CornFarmer
//
//  Created by 이상현 on 2022/05/07.
//

import Alamofire
import RxSwift

protocol MovieProtocol {
  func getTodayMovie() -> Observable<TodayMovieResponse>
}

struct MovieService: MovieProtocol {
    func getTodayMovie() -> Observable<TodayMovieResponse> {
        return Observable.create { observer -> Disposable in
            let urlString = HTTPUtils.url + "/movies/today"
            let headers = HTTPUtils.jsonHeader()
            HTTPUtils.defaultSession.request(
                urlString,
                method: .get,
                parameters: nil,
                headers: headers
            ).responseDecodable(of: TodayMovieResponse.self) { response in
                switch response.result {
                case .success(let response):
                    observer.onNext(response)
                    observer.onCompleted()

                case .failure:
                    let error = CommonError(description: "데이터를 파싱할 수 없습니다.")
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}

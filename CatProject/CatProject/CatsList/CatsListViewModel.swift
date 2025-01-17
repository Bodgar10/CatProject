//
//  CatsListViewModel.swift
//  CatProject
//
//  Created by Bodgar Espinosa Miranda on 17/01/25.
//

import Foundation
import Switchboard
import SwiftUI
import Common
import Combine

struct CatModel: Identifiable, Hashable {
    let id: String
    let size: String
    let tags: String
}

final class CatsListViewModel: ObservableObject {
    
    @Published var cats: [CatModel] = []
    @Published var images: [String: Image] = [:]
    
    @Dependency var catsService: CuteCatsService
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        catsService.catListPublisher
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] result in
                switch result {
                case .failure(_):
                    break
                case .success(let cats):
                    self?.cats = cats.map { cat in
                        CatModel(
                            id: cat.id,
                            size: String(cat.size),
                            tags: cat.tags.joined(separator: ", ")
                        )
                    }
                    self?.loadImages()
                }
            }).store(in: &cancellables)
        
        catsService.refresh()
    }
    
    private func loadImages() {
        Task {
            for cat in cats {
                if let image = await getImage(for: cat.id) {
                    DispatchQueue.main.async {
                        self.images[cat.id] = image
                    }
                }
            }
        }
    }
    
    private func getImage(for id: String) async -> Image? {
        let imageCache = NSCache<AnyObject, AnyObject>()
        if let cachedImage = imageCache.object(forKey: id as AnyObject) as? UIImage {
            return Image(uiImage: cachedImage)
        }
        
        guard let url = URL(string: "https://cataas.com/cat/\(id)") else {
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let uiImage = UIImage(data: data) else {
                return nil
            }
            
            imageCache.setObject(uiImage, forKey: id as AnyObject)
            return Image(uiImage: uiImage)
        } catch {
            return nil
        }
    }
}

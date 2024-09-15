//
//  FeaturedList.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 13/09/24.
//

import Foundation

public let featuredList: [FeaturedModel] = [
    FeaturedModel(
        id: 1,
        name: "TV 100% online",
        description: "Sua TV por streaming, sem fidelidade, taxas e instalação! Aproveite seus canais por assinatura onde e como quiser.",
        price: 40.0,
        image: "banner-tv-online" // Replace with actual image name
    ),
    FeaturedModel(
        id: 2,
        name: "Netflix",
        description: "Filmes, séries e muito mais, sem limites. Assista onde quiser.",
        price: 20.90,
        image: "banner-netflix" // Replace with actual image name
    ),
    FeaturedModel(
        id: 3,
        name: "Spotify Premium",
        description: "Músicas, podcasts, vídeos e mais. Tudo isso sem anúncio, com saltos ilimitados e download para ouvir offline.",
        price: 21.90,
        image: "banner-spotify" // Replace with actual image name
    ),
    FeaturedModel(
        id: 4,
        name: "Familhão",
        description: "Milhões de boas notícias e a chance de ganhar R$ 1 milhão.",
        price: 10.0,
        image: "banner-familhao" // Replace with actual image name
    ),
    FeaturedModel(
            id: 5,
            name: "Globoplay",
            description: "Confira o catálogo repleto de séries, novelas, realities e novidades.",
            price: 27.90,
            image: "banner-globoplay" // Replace with actual image name
        ),
        FeaturedModel(
            id: 6,
            name: "Amazon Prime",
            description: "Filmes e séries com Prime Video, frete GRÁTIS, músicas sem anúncios, jogos gratuitos e muito mais.",
            price: 19.90, // Initial price after one year of free service
            image: "banner-amazon" // Replace with actual image name
        ),
        FeaturedModel(
            id: 7,
            name: "Max",
            description: "Tenha acesso a esportes ao vivo, filmes, séries e muito mais.",
            price: 39.90,
            image: "banner-hbo" // Replace with actual image name
        )
]


public struct FeaturedModel: Identifiable {
    public let id: Int
    public let name: String
    public let description: String
    public let price: Double
    public let image: String
}

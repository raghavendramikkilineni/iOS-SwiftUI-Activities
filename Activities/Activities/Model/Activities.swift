//
//  Activities.swift
//  Activities
//
//  Created by Raghavendra Mikkilineni on 09/05/21.
//

import Foundation

// MARK: - Activities
struct Activities: Codable {
    let editorial: Editorial
    let collections: [ActivityCollection]
    let categories: [Category]
}

// MARK: - Category
struct Category: Codable {
    let name: String
    let rank: Int
    let id: String
}

// MARK: - ActivityCollection
struct ActivityCollection: Codable {
    let vibrantColor, countText, imageName: String
    let count: Int
    let rank: String
    let id: Int
    let collectionName: String
    let desc: String?
    let categories: [String]?

    enum CodingKeys: String, CodingKey {
        case vibrantColor = "vibrant_color"
        case countText = "count_text"
        case imageName = "image"
        case count, rank, id
        case collectionName = "collection_name"
        case desc
        case categories
    }
}

// MARK: - Editorial
struct Editorial: Codable {
    let ttd: Ttd
    let carousel: [Carousel]
}

// MARK: - Carousel
struct Carousel: Codable {
    let seqNo: Int
    let product: Product
    let subTitle, callback: String
    let tagText: TagText
    let carouselId: Int
    let title: String
    let type: TypeEnum
    let images: [CarouselImage]
    
    enum CodingKeys: String, CodingKey {
        case seqNo = "seq_no"
        case product
        case subTitle = "sub_title"
        case callback
        case tagText = "tag_text"
        case carouselId = "id"
        case title, type
        case images
    }
}

extension Carousel: Identifiable {
    var id: String { UUID().uuidString }
}

extension Carousel: Hashable {
    static func == (lhs: Carousel, rhs: Carousel) -> Bool {
        lhs.carouselId == rhs.carouselId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(carouselId)
    }
}

struct CarouselImage: Codable {
    let img: String
    enum CodingKeys: String, CodingKey {
        case img
    }
}

//MARK: Color
enum VibrantColor: String, Codable {
    case the000000 = "#000000"
}

enum Product: String, Codable {
    case fnb = "FNB"
    case ttd = "TTD"
}

enum TagText: String, Codable {
    case deal = "deal"
    case featured = "featured"
    case trending = "trending"
}

enum TypeEnum: String, Codable {
    case activities = "activities"
    case collection = "collection"
}

// MARK: - Ttd
struct Ttd: Codable {
    let p: P
    let cp: [Int]
}

// MARK: - P
struct P: Codable {
    let subTitle, tagText: String
    let id: Int
    let collection: [PCollection]
    let title: String

    enum CodingKeys: String, CodingKey {
        case subTitle = "sub_title"
        case tagText = "tag_text"
        case id, collection, title
    }
}

// MARK: - PCollection
struct PCollection: Codable {
    let vibrantColor: String
    let orderNo: Int
    let imageName: String
    let id: Int
    let collectionName: String
    let desc: String?

    enum CodingKeys: String, CodingKey {
        case vibrantColor = "vibrant_color"
        case orderNo = "order_no"
        case imageName = "image"
        case id
        case collectionName = "collection_name"
        case desc
    }
}


// MARK: - Encode/decode helpers
class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    func hash(into hasher: inout Hasher) {
        
    }
    
    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: ItemSimilarityRecommender.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

// Copyright (c) 2017, Apple Inc. All rights reserved.
//
// Use of this source code is governed by a BSD-3-clause license that can be
// found in LICENSE.txt or at https://opensource.org/licenses/BSD-3-Clause

// *
// Each tree is a collection of nodes,
// each of which is identified by a unique identifier.
//
// Each node is either a branch or a leaf node.
// A branch node evaluates a value according to a behavior;
// if true, the node identified by ``true_child_node_id`` is evaluated next,
// if false, the node identified by ``false_child_node_id`` is evaluated next.
// A leaf node adds the evaluation value to the base prediction value
// to get the final prediction.
//
// A tree must have exactly one root node,
// which has no parent node.
// A tree must not terminate on a branch node.
// All leaf nodes must be accessible
// by evaluating one or more branch nodes in sequence,
// starting from the root node.

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
private struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
    struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
    typealias Version = _2
}

/// *
/// Item Similarity Recommender
///
///  The Item Similarity recommender takes as input a list of items and scores,
///  then uses that information and a table of item similarities to predict similarity
///  scores for all items.  By default, the items predicted are most similar to the given
///  items but not part of that item set.
///
///  The predicted score for a given item k is
///    sum_(i in observed items)   sim_(k,i) * (score_i - shift_k)
///
///  Because only the most similar scores for each item i are stored,
///  sim_(k,i) is often zero.
///
///  For many models, the score adjustment parameter shift_j is zero -- it's occasionally used
///  to counteract global biases for popular items.
///
///
///  References:
public struct CoreML_Specification_ItemSimilarityRecommender {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var itemItemSimilarities: [CoreML_Specification_ItemSimilarityRecommender.SimilarItems] = []

    /// * One or none of these are given.  If none are given, then the items must number 0, 1, ..., num_items - 1.
    ///  If either is given, the length must be exactly num_items.
    var itemStringIds: CoreML_Specification_StringVector {
        get { return _itemStringIds ?? CoreML_Specification_StringVector() }
        set { _itemStringIds = newValue }
    }

    /// Returns true if `itemStringIds` has been explicitly set.
    var hasItemStringIds: Bool { return self._itemStringIds != nil }
    /// Clears the value of `itemStringIds`. Subsequent reads from it will return its default value.
    mutating func clearItemStringIds() { _itemStringIds = nil }

    var itemInt64Ids: CoreML_Specification_Int64Vector {
        get { return _itemInt64Ids ?? CoreML_Specification_Int64Vector() }
        set { _itemInt64Ids = newValue }
    }

    /// Returns true if `itemInt64Ids` has been explicitly set.
    var hasItemInt64Ids: Bool { return self._itemInt64Ids != nil }
    /// Clears the value of `itemInt64Ids`. Subsequent reads from it will return its default value.
    mutating func clearItemInt64Ids() { _itemInt64Ids = nil }

    /// * Input parameter names specifying different possible inputs to the recommender.
    var itemInputFeatureName: String = .init()

    /// Optional; defaults to all items if not given.
    var numRecommendationsInputFeatureName: String = .init()

    /// Optional.
    var itemRestrictionInputFeatureName: String = .init()

    /// Optional; defaults to input item list if not given.
    var itemExclusionInputFeatureName: String = .init()

    /// * The predicted outputs.  At least one of these must be specified.
    var recommendedItemListOutputFeatureName: String = .init()

    var recommendedItemScoreOutputFeatureName: String = .init()

    var unknownFields = SwiftProtobuf.UnknownStorage()

    /// * The items similar to a given base item.
    struct ConnectedItem {
        // SwiftProtobuf.Message conformance is added in an extension below. See the
        // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
        // methods supported on all messages.

        var itemID: UInt64 = 0

        var similarityScore: Double = 0

        var unknownFields = SwiftProtobuf.UnknownStorage()

        init() {}
    }

    /// *  The formula for the score of a given model as given above, with shift_k
    ///   parameter given by itemScoreAdjustment, and the similar item list filling in
    ///   all the known sim(k,i) scores for i given by itemID and k given by the itemID parameter in
    ///   the similarItemList.
    struct SimilarItems {
        // SwiftProtobuf.Message conformance is added in an extension below. See the
        // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
        // methods supported on all messages.

        var itemID: UInt64 = 0

        var similarItemList: [CoreML_Specification_ItemSimilarityRecommender.ConnectedItem] = []

        var itemScoreAdjustment: Double = 0

        var unknownFields = SwiftProtobuf.UnknownStorage()

        init() {}
    }

    init() {}

    fileprivate var _itemStringIds: CoreML_Specification_StringVector?
    fileprivate var _itemInt64Ids: CoreML_Specification_Int64Vector?
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

private let _protobuf_package = "CoreML.Specification"

extension CoreML_Specification_ItemSimilarityRecommender: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".ItemSimilarityRecommender"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "itemItemSimilarities"),
        2: .same(proto: "itemStringIds"),
        3: .same(proto: "itemInt64Ids"),
        10: .same(proto: "itemInputFeatureName"),
        11: .same(proto: "numRecommendationsInputFeatureName"),
        12: .same(proto: "itemRestrictionInputFeatureName"),
        13: .same(proto: "itemExclusionInputFeatureName"),
        20: .same(proto: "recommendedItemListOutputFeatureName"),
        21: .same(proto: "recommendedItemScoreOutputFeatureName"),
    ]

    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try try decoder.decodeRepeatedMessageField(value: &itemItemSimilarities)
            case 2: try try decoder.decodeSingularMessageField(value: &_itemStringIds)
            case 3: try try decoder.decodeSingularMessageField(value: &_itemInt64Ids)
            case 10: try try decoder.decodeSingularStringField(value: &itemInputFeatureName)
            case 11: try try decoder.decodeSingularStringField(value: &numRecommendationsInputFeatureName)
            case 12: try try decoder.decodeSingularStringField(value: &itemRestrictionInputFeatureName)
            case 13: try try decoder.decodeSingularStringField(value: &itemExclusionInputFeatureName)
            case 20: try try decoder.decodeSingularStringField(value: &recommendedItemListOutputFeatureName)
            case 21: try try decoder.decodeSingularStringField(value: &recommendedItemScoreOutputFeatureName)
            default: break
            }
        }
    }

    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        // The use of inline closures is to circumvent an issue where the compiler
        // allocates stack space for every if/case branch local when no optimizations
        // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
        // https://github.com/apple/swift-protobuf/issues/1182
        if !itemItemSimilarities.isEmpty {
            try visitor.visitRepeatedMessageField(value: itemItemSimilarities, fieldNumber: 1)
        }
        try { if let v = self._itemStringIds {
            try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
        } }()
        try { if let v = self._itemInt64Ids {
            try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
        } }()
        if !itemInputFeatureName.isEmpty {
            try visitor.visitSingularStringField(value: itemInputFeatureName, fieldNumber: 10)
        }
        if !numRecommendationsInputFeatureName.isEmpty {
            try visitor.visitSingularStringField(value: numRecommendationsInputFeatureName, fieldNumber: 11)
        }
        if !itemRestrictionInputFeatureName.isEmpty {
            try visitor.visitSingularStringField(value: itemRestrictionInputFeatureName, fieldNumber: 12)
        }
        if !itemExclusionInputFeatureName.isEmpty {
            try visitor.visitSingularStringField(value: itemExclusionInputFeatureName, fieldNumber: 13)
        }
        if !recommendedItemListOutputFeatureName.isEmpty {
            try visitor.visitSingularStringField(value: recommendedItemListOutputFeatureName, fieldNumber: 20)
        }
        if !recommendedItemScoreOutputFeatureName.isEmpty {
            try visitor.visitSingularStringField(value: recommendedItemScoreOutputFeatureName, fieldNumber: 21)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: CoreML_Specification_ItemSimilarityRecommender, rhs: CoreML_Specification_ItemSimilarityRecommender) -> Bool {
        if lhs.itemItemSimilarities != rhs.itemItemSimilarities { return false }
        if lhs._itemStringIds != rhs._itemStringIds { return false }
        if lhs._itemInt64Ids != rhs._itemInt64Ids { return false }
        if lhs.itemInputFeatureName != rhs.itemInputFeatureName { return false }
        if lhs.numRecommendationsInputFeatureName != rhs.numRecommendationsInputFeatureName { return false }
        if lhs.itemRestrictionInputFeatureName != rhs.itemRestrictionInputFeatureName { return false }
        if lhs.itemExclusionInputFeatureName != rhs.itemExclusionInputFeatureName { return false }
        if lhs.recommendedItemListOutputFeatureName != rhs.recommendedItemListOutputFeatureName { return false }
        if lhs.recommendedItemScoreOutputFeatureName != rhs.recommendedItemScoreOutputFeatureName { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension CoreML_Specification_ItemSimilarityRecommender.ConnectedItem: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = CoreML_Specification_ItemSimilarityRecommender.protoMessageName + ".ConnectedItem"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "itemId"),
        2: .same(proto: "similarityScore"),
    ]

    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try try decoder.decodeSingularUInt64Field(value: &itemID)
            case 2: try try decoder.decodeSingularDoubleField(value: &similarityScore)
            default: break
            }
        }
    }

    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if itemID != 0 {
            try visitor.visitSingularUInt64Field(value: itemID, fieldNumber: 1)
        }
        if similarityScore != 0 {
            try visitor.visitSingularDoubleField(value: similarityScore, fieldNumber: 2)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: CoreML_Specification_ItemSimilarityRecommender.ConnectedItem, rhs: CoreML_Specification_ItemSimilarityRecommender.ConnectedItem) -> Bool {
        if lhs.itemID != rhs.itemID { return false }
        if lhs.similarityScore != rhs.similarityScore { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension CoreML_Specification_ItemSimilarityRecommender.SimilarItems: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = CoreML_Specification_ItemSimilarityRecommender.protoMessageName + ".SimilarItems"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "itemId"),
        2: .same(proto: "similarItemList"),
        3: .same(proto: "itemScoreAdjustment"),
    ]

    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try try decoder.decodeSingularUInt64Field(value: &itemID)
            case 2: try try decoder.decodeRepeatedMessageField(value: &similarItemList)
            case 3: try try decoder.decodeSingularDoubleField(value: &itemScoreAdjustment)
            default: break
            }
        }
    }

    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if itemID != 0 {
            try visitor.visitSingularUInt64Field(value: itemID, fieldNumber: 1)
        }
        if !similarItemList.isEmpty {
            try visitor.visitRepeatedMessageField(value: similarItemList, fieldNumber: 2)
        }
        if itemScoreAdjustment != 0 {
            try visitor.visitSingularDoubleField(value: itemScoreAdjustment, fieldNumber: 3)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: CoreML_Specification_ItemSimilarityRecommender.SimilarItems, rhs: CoreML_Specification_ItemSimilarityRecommender.SimilarItems) -> Bool {
        if lhs.itemID != rhs.itemID { return false }
        if lhs.similarItemList != rhs.similarItemList { return false }
        if lhs.itemScoreAdjustment != rhs.itemScoreAdjustment { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

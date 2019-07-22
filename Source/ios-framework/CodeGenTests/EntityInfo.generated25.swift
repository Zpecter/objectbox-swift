// Generated using the ObjectBox Swift Generator — https://objectbox.io
// DO NOT EDIT

// swiftlint:disable all
import ObjectBox

// MARK: - Entity metadata


extension TypeTest: ObjectBox.__EntityRelatable {
    internal typealias EntityType = TypeTest

    internal var _id: Id<TypeTest> {
        return self.id
    }
}

extension TypeTest: ObjectBox.EntityInspectable {
    internal typealias EntityBindingType = TypeTestBinding

    /// Generated metadata used by ObjectBox to persist the entity.
    internal static var entityInfo = ObjectBox.EntityInfo(name: "TypeTest", id: 1)

    internal static var entityBinding = EntityBindingType()

    fileprivate static func buildEntity(modelBuilder: ModelBuilder) throws {
        let entityBuilder = try modelBuilder.entityBuilder(for: TypeTest.self, id: 1, uid: 33536)
        try entityBuilder.addProperty(name: "id", type: Id<TypeTest>.entityPropertyType, flags: [.id], id: 1, uid: 14592)
        try entityBuilder.addProperty(name: "intValue", type: Int.entityPropertyType, id: 2, uid: 15616)
        try entityBuilder.addProperty(name: "int8Value", type: Int8.entityPropertyType, id: 3, uid: 16640)
        try entityBuilder.addProperty(name: "int16Value", type: Int16.entityPropertyType, id: 4, uid: 17664)
        try entityBuilder.addProperty(name: "int32Value", type: Int32.entityPropertyType, id: 5, uid: 18688)
        try entityBuilder.addProperty(name: "int64Value", type: Int64.entityPropertyType, id: 6, uid: 19712)
        try entityBuilder.addProperty(name: "uintValue", type: UInt.entityPropertyType, flags: [.unsigned], id: 7, uid: 20736)
        try entityBuilder.addProperty(name: "uint8Value", type: UInt8.entityPropertyType, flags: [.unsigned], id: 8, uid: 21504)
        try entityBuilder.addProperty(name: "uint16Value", type: UInt16.entityPropertyType, flags: [.unsigned], id: 9, uid: 22528)
        try entityBuilder.addProperty(name: "uint32Value", type: UInt32.entityPropertyType, flags: [.unsigned], id: 10, uid: 23552)
        try entityBuilder.addProperty(name: "uint64Value", type: UInt64.entityPropertyType, flags: [.unsigned], id: 11, uid: 24576)
        try entityBuilder.addProperty(name: "boolValue", type: Bool.entityPropertyType, id: 12, uid: 25600)
        try entityBuilder.addProperty(name: "stringValue", type: String.entityPropertyType, id: 13, uid: 26624)
        try entityBuilder.addProperty(name: "byteValue", type: Byte.entityPropertyType, id: 14, uid: 27648)
        try entityBuilder.addProperty(name: "bytes", type: Data.entityPropertyType, id: 15, uid: 28672)
        try entityBuilder.addProperty(name: "byteArray", type: Data.entityPropertyType, id: 16, uid: 29696)
        try entityBuilder.addProperty(name: "floatValue", type: Float.entityPropertyType, id: 17, uid: 30720)
        try entityBuilder.addProperty(name: "doubleValue", type: Double.entityPropertyType, id: 18, uid: 31744)
        try entityBuilder.addProperty(name: "dateValue", type: Date.entityPropertyType, id: 19, uid: 32512)

        try entityBuilder.lastProperty(id: 19, uid: 32512)
    }
}

extension TypeTest {
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { TypeTest.id == myId }
    internal static var id: Property<TypeTest, Id<TypeTest>> { return Property<TypeTest, Id<TypeTest>>(propertyId: 1, isPrimaryKey: true) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { TypeTest.intValue > 1234 }
    internal static var intValue: Property<TypeTest, Int> { return Property<TypeTest, Int>(propertyId: 2, isPrimaryKey: false) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { TypeTest.int8Value > 1234 }
    internal static var int8Value: Property<TypeTest, Int8> { return Property<TypeTest, Int8>(propertyId: 3, isPrimaryKey: false) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { TypeTest.int16Value > 1234 }
    internal static var int16Value: Property<TypeTest, Int16> { return Property<TypeTest, Int16>(propertyId: 4, isPrimaryKey: false) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { TypeTest.int32Value > 1234 }
    internal static var int32Value: Property<TypeTest, Int32> { return Property<TypeTest, Int32>(propertyId: 5, isPrimaryKey: false) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { TypeTest.int64Value > 1234 }
    internal static var int64Value: Property<TypeTest, Int64> { return Property<TypeTest, Int64>(propertyId: 6, isPrimaryKey: false) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { TypeTest.uintValue > 1234 }
    internal static var uintValue: Property<TypeTest, UInt> { return Property<TypeTest, UInt>(propertyId: 7, isPrimaryKey: false) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { TypeTest.uint8Value > 1234 }
    internal static var uint8Value: Property<TypeTest, UInt8> { return Property<TypeTest, UInt8>(propertyId: 8, isPrimaryKey: false) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { TypeTest.uint16Value > 1234 }
    internal static var uint16Value: Property<TypeTest, UInt16> { return Property<TypeTest, UInt16>(propertyId: 9, isPrimaryKey: false) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { TypeTest.uint32Value > 1234 }
    internal static var uint32Value: Property<TypeTest, UInt32> { return Property<TypeTest, UInt32>(propertyId: 10, isPrimaryKey: false) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { TypeTest.uint64Value > 1234 }
    internal static var uint64Value: Property<TypeTest, UInt64> { return Property<TypeTest, UInt64>(propertyId: 11, isPrimaryKey: false) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { TypeTest.boolValue == true }
    internal static var boolValue: Property<TypeTest, Bool> { return Property<TypeTest, Bool>(propertyId: 12, isPrimaryKey: false) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { TypeTest.stringValue.startsWith("X") }
    internal static var stringValue: Property<TypeTest, String> { return Property<TypeTest, String>(propertyId: 13, isPrimaryKey: false) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { TypeTest.byteValue > 1234 }
    internal static var byteValue: Property<TypeTest, Byte> { return Property<TypeTest, Byte>(propertyId: 14, isPrimaryKey: false) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { TypeTest.bytes > 1234 }
    internal static var bytes: Property<TypeTest, Data> { return Property<TypeTest, Data>(propertyId: 15, isPrimaryKey: false) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { TypeTest.byteArray > 1234 }
    internal static var byteArray: Property<TypeTest, Data> { return Property<TypeTest, Data>(propertyId: 16, isPrimaryKey: false) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { TypeTest.floatValue > 1234 }
    internal static var floatValue: Property<TypeTest, Float> { return Property<TypeTest, Float>(propertyId: 17, isPrimaryKey: false) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { TypeTest.doubleValue > 1234 }
    internal static var doubleValue: Property<TypeTest, Double> { return Property<TypeTest, Double>(propertyId: 18, isPrimaryKey: false) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { TypeTest.dateValue > 1234 }
    internal static var dateValue: Property<TypeTest, Date> { return Property<TypeTest, Date>(propertyId: 19, isPrimaryKey: false) }

    fileprivate func __setId(identifier: ObjectBox.EntityId) {
        self.id = Id(identifier)
    }
}

extension ObjectBox.Property where E == TypeTest {
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .id == myId }

    static var id: Property<TypeTest, Id<TypeTest>> { return Property<TypeTest, Id<TypeTest>>(propertyId: 1, isPrimaryKey: true) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .intValue > 1234 }

    static var intValue: Property<TypeTest, Int> { return Property<TypeTest, Int>(propertyId: 2, isPrimaryKey: false) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .int8Value > 1234 }

    static var int8Value: Property<TypeTest, Int8> { return Property<TypeTest, Int8>(propertyId: 3, isPrimaryKey: false) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .int16Value > 1234 }

    static var int16Value: Property<TypeTest, Int16> { return Property<TypeTest, Int16>(propertyId: 4, isPrimaryKey: false) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .int32Value > 1234 }

    static var int32Value: Property<TypeTest, Int32> { return Property<TypeTest, Int32>(propertyId: 5, isPrimaryKey: false) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .int64Value > 1234 }

    static var int64Value: Property<TypeTest, Int64> { return Property<TypeTest, Int64>(propertyId: 6, isPrimaryKey: false) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .uintValue > 1234 }

    static var uintValue: Property<TypeTest, UInt> { return Property<TypeTest, UInt>(propertyId: 7, isPrimaryKey: false) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .uint8Value > 1234 }

    static var uint8Value: Property<TypeTest, UInt8> { return Property<TypeTest, UInt8>(propertyId: 8, isPrimaryKey: false) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .uint16Value > 1234 }

    static var uint16Value: Property<TypeTest, UInt16> { return Property<TypeTest, UInt16>(propertyId: 9, isPrimaryKey: false) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .uint32Value > 1234 }

    static var uint32Value: Property<TypeTest, UInt32> { return Property<TypeTest, UInt32>(propertyId: 10, isPrimaryKey: false) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .uint64Value > 1234 }

    static var uint64Value: Property<TypeTest, UInt64> { return Property<TypeTest, UInt64>(propertyId: 11, isPrimaryKey: false) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .boolValue == true }

    static var boolValue: Property<TypeTest, Bool> { return Property<TypeTest, Bool>(propertyId: 12, isPrimaryKey: false) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .stringValue.startsWith("X") }

    static var stringValue: Property<TypeTest, String> { return Property<TypeTest, String>(propertyId: 13, isPrimaryKey: false) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .byteValue > 1234 }

    static var byteValue: Property<TypeTest, Byte> { return Property<TypeTest, Byte>(propertyId: 14, isPrimaryKey: false) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .bytes > 1234 }

    static var bytes: Property<TypeTest, Data> { return Property<TypeTest, Data>(propertyId: 15, isPrimaryKey: false) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .byteArray > 1234 }

    static var byteArray: Property<TypeTest, Data> { return Property<TypeTest, Data>(propertyId: 16, isPrimaryKey: false) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .floatValue > 1234 }

    static var floatValue: Property<TypeTest, Float> { return Property<TypeTest, Float>(propertyId: 17, isPrimaryKey: false) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .doubleValue > 1234 }

    static var doubleValue: Property<TypeTest, Double> { return Property<TypeTest, Double>(propertyId: 18, isPrimaryKey: false) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .dateValue > 1234 }

    static var dateValue: Property<TypeTest, Date> { return Property<TypeTest, Date>(propertyId: 19, isPrimaryKey: false) }


}


/// Generated service type to handle persisting and reading entity data. Exposed through `TypeTest.EntityBindingType`.
internal class TypeTestBinding: NSObject, ObjectBox.EntityBinding {
    internal typealias EntityType = TypeTest

    override internal required init() {}

    internal func setEntityId(of entity: EntityType, to entityId: ObjectBox.EntityId) {
        entity.__setId(identifier: entityId)
    }

    internal func entityId(of entity: EntityType) -> ObjectBox.EntityId {
        return entity.id.value
    }

    internal func collect(fromEntity entity: EntityType, id: EntityId, propertyCollector: PropertyCollector, store: Store) {

        var offsets: [(offset: OBXDataOffset, index: UInt16)] = []
        offsets.append((propertyCollector.prepare(string: entity.stringValue, at: 2 + 2 * 13), 2 + 2 * 13))
        offsets.append((propertyCollector.prepare(bytes: entity.bytes, at: 2 + 2 * 15), 2 + 2 * 15))
        offsets.append((propertyCollector.prepare(bytes: entity.byteArray, at: 2 + 2 * 16), 2 + 2 * 16))

        propertyCollector.collect(id, at: 2 + 2 * 1)
        propertyCollector.collect(entity.intValue, at: 2 + 2 * 2)
        propertyCollector.collect(entity.int8Value, at: 2 + 2 * 3)
        propertyCollector.collect(entity.int16Value, at: 2 + 2 * 4)
        propertyCollector.collect(entity.int32Value, at: 2 + 2 * 5)
        propertyCollector.collect(entity.int64Value, at: 2 + 2 * 6)
        propertyCollector.collect(entity.uintValue, at: 2 + 2 * 7)
        propertyCollector.collect(entity.uint8Value, at: 2 + 2 * 8)
        propertyCollector.collect(entity.uint16Value, at: 2 + 2 * 9)
        propertyCollector.collect(entity.uint32Value, at: 2 + 2 * 10)
        propertyCollector.collect(entity.uint64Value, at: 2 + 2 * 11)
        propertyCollector.collect(entity.boolValue, at: 2 + 2 * 12)
        propertyCollector.collect(entity.byteValue, at: 2 + 2 * 14)
        propertyCollector.collect(entity.floatValue, at: 2 + 2 * 17)
        propertyCollector.collect(entity.doubleValue, at: 2 + 2 * 18)
        propertyCollector.collect(entity.dateValue, at: 2 + 2 * 19)


        for value in offsets {
            propertyCollector.collect(dataOffset: value.offset, at: value.index)
        }
    }

    internal func createEntity(entityReader: EntityReader, store: Store) -> EntityType {
        let entity = TypeTest()

        entity.id = entityReader.read(at: 2 + 2 * 1)
        entity.intValue = entityReader.read(at: 2 + 2 * 2)
        entity.int8Value = entityReader.read(at: 2 + 2 * 3)
        entity.int16Value = entityReader.read(at: 2 + 2 * 4)
        entity.int32Value = entityReader.read(at: 2 + 2 * 5)
        entity.int64Value = entityReader.read(at: 2 + 2 * 6)
        entity.uintValue = entityReader.read(at: 2 + 2 * 7)
        entity.uint8Value = entityReader.read(at: 2 + 2 * 8)
        entity.uint16Value = entityReader.read(at: 2 + 2 * 9)
        entity.uint32Value = entityReader.read(at: 2 + 2 * 10)
        entity.uint64Value = entityReader.read(at: 2 + 2 * 11)
        entity.boolValue = entityReader.read(at: 2 + 2 * 12)
        entity.stringValue = entityReader.read(at: 2 + 2 * 13)
        entity.byteValue = entityReader.read(at: 2 + 2 * 14)
        entity.bytes = entityReader.read(at: 2 + 2 * 15)
        entity.byteArray = entityReader.read(at: 2 + 2 * 16)
        entity.floatValue = entityReader.read(at: 2 + 2 * 17)
        entity.doubleValue = entityReader.read(at: 2 + 2 * 18)
        entity.dateValue = entityReader.read(at: 2 + 2 * 19)



        return entity
    }
}


/// Helper function that allows calling Enum(rawValue: value) with a nil value, which will return nil.
fileprivate func optConstruct<T: RawRepresentable>(_ type: T.Type, rawValue: T.RawValue?) -> T? {
    guard let rawValue = rawValue else { return nil }
    return T(rawValue: rawValue)
}

// MARK: - Store setup

fileprivate func cModel() throws -> OpaquePointer {
    let modelBuilder = try ModelBuilder()
    try TypeTest.buildEntity(modelBuilder: modelBuilder)
    modelBuilder.lastEntity(id: 1, uid: 33536)
    return modelBuilder.finish()
}

extension ObjectBox.Store {
    /// A store with a fully configured model. Created by the code generator with your model's metadata in place.
    ///
    /// - Parameters:
    ///   - directoryPath: Directory path to store database files in.
    ///   - maxDbSizeInKByte: Limit of on-disk space for the database files. Default is `1024 * 1024` (1 GiB).
    ///   - fileMode: UNIX-style bit mask used for the database files; default is `0o755`.
    ///   - maxReaders: Maximum amount of concurrent readers, tailored to your use case. Default is `0` (unlimited).
    internal convenience init(directoryPath: String, maxDbSizeInKByte: UInt64 = 1024 * 1024, fileMode: UInt32 = 0o755, maxReaders: UInt32 = 0) throws {
        try self.init(
            model: try cModel(),
            directory: directoryPath,
            maxDbSizeInKByte: maxDbSizeInKByte,
            fileMode: fileMode,
            maxReaders: maxReaders)
    }
}

// swiftlint:enable all

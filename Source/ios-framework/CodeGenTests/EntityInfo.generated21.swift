// Generated using the ObjectBox Swift Generator — https://objectbox.io
// DO NOT EDIT

// swiftlint:disable all
import ObjectBox

// MARK: - Entity metadata


extension WashingMachine: ObjectBox.__EntityRelatable {
    internal typealias EntityType = WashingMachine

    internal var _id: Id<WashingMachine> {
        return self.id
    }
}

extension WashingMachine: ObjectBox.EntityInspectable {
    internal typealias EntityBindingType = WashingMachineBinding

    /// Generated metadata used by ObjectBox to persist the entity.
    internal static var entityInfo = ObjectBox.EntityInfo(name: "WashingMachine", id: 1)

    internal static var entityBinding = EntityBindingType()

    fileprivate static func buildEntity(modelBuilder: ModelBuilder) throws {
        let entityBuilder = try modelBuilder.entityBuilder(for: WashingMachine.self, id: 1, uid: 17664)
        try entityBuilder.addProperty(name: "id", type: Id<WashingMachine>.entityPropertyType, flags: [.id], id: 1, uid: 14592)
        try entityBuilder.addProperty(name: "dryerRack", type: String.entityPropertyType, id: 2, uid: 15616)
        try entityBuilder.addProperty(name: "destinationName", type: String.entityPropertyType, id: 3, uid: 16640)

        try entityBuilder.lastProperty(id: 3, uid: 16640)
    }
}

extension WashingMachine {
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { WashingMachine.id == myId }
    internal static var id: Property<WashingMachine, Id<WashingMachine>> { return Property<WashingMachine, Id<WashingMachine>>(propertyId: 1, isPrimaryKey: true) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { WashingMachine.dryerRack.startsWith("X") }
    internal static var dryerRack: Property<WashingMachine, String> { return Property<WashingMachine, String>(propertyId: 2, isPrimaryKey: false) }
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { WashingMachine.destinationName.startsWith("X") }
    internal static var destinationName: Property<WashingMachine, String> { return Property<WashingMachine, String>(propertyId: 3, isPrimaryKey: false) }

    fileprivate func __setId(identifier: ObjectBox.EntityId) {
        self.id = Id(identifier)
    }
}

extension ObjectBox.Property where E == WashingMachine {
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .id == myId }

    static var id: Property<WashingMachine, Id<WashingMachine>> { return Property<WashingMachine, Id<WashingMachine>>(propertyId: 1, isPrimaryKey: true) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .dryerRack.startsWith("X") }

    static var dryerRack: Property<WashingMachine, String> { return Property<WashingMachine, String>(propertyId: 2, isPrimaryKey: false) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { .destinationName.startsWith("X") }

    static var destinationName: Property<WashingMachine, String> { return Property<WashingMachine, String>(propertyId: 3, isPrimaryKey: false) }


}


/// Generated service type to handle persisting and reading entity data. Exposed through `WashingMachine.EntityBindingType`.
internal class WashingMachineBinding: NSObject, ObjectBox.EntityBinding {
    internal typealias EntityType = WashingMachine

    override internal required init() {}

    internal func setEntityId(of entity: EntityType, to entityId: ObjectBox.EntityId) {
        entity.__setId(identifier: entityId)
    }

    internal func entityId(of entity: EntityType) -> ObjectBox.EntityId {
        return entity.id.value
    }

    internal func collect(fromEntity entity: EntityType, id: EntityId, propertyCollector: PropertyCollector, store: Store) {

        var offsets: [(offset: OBXDataOffset, index: UInt16)] = []
        offsets.append((propertyCollector.prepare(string: entity.dryerRack, at: 2 + 2 * 2), 2 + 2 * 2))
        offsets.append((propertyCollector.prepare(string: entity.destinationName, at: 2 + 2 * 3), 2 + 2 * 3))

        propertyCollector.collect(id, at: 2 + 2 * 1)


        for value in offsets {
            propertyCollector.collect(dataOffset: value.offset, at: value.index)
        }
    }

    internal func createEntity(entityReader: EntityReader, store: Store) -> EntityType {
        let entity = WashingMachine()

        entity.id = entityReader.read(at: 2 + 2 * 1)
        entity.dryerRack = entityReader.read(at: 2 + 2 * 2)
        entity.destinationName = entityReader.read(at: 2 + 2 * 3)



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
    try WashingMachine.buildEntity(modelBuilder: modelBuilder)
    modelBuilder.lastEntity(id: 1, uid: 17664)
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

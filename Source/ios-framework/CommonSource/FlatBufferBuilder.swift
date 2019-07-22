//
// Copyright © 2019 ObjectBox Ltd. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation

internal class FlatBufferBuilder {
    private var fbb: OpaquePointer! /*OBX_fbb*/

    internal var isCollecting: Bool {
        get {
            return obx_fbb_is_collecting(fbb)
        }
        set(newValue) {
            obx_fbb_set_collecting(fbb, newValue)
        }
    }

    internal var didStart: Bool {
        return obx_fbb_did_start(fbb)
    }
    
    init() {
        fbb = obx_fbb_create()
    }
    
    deinit {
        if fbb != nil {
            obx_fbb_free(fbb)
        }
    }
    
    static let cachedFlatbuffer = ThreadSpecific<FlatBufferBuilder?>(initialValue: nil)
    
    internal class func dequeue() -> FlatBufferBuilder {
        if let thisThreadsFlatbuffer = cachedFlatbuffer.value {
            cachedFlatbuffer.value = nil
            return thisThreadsFlatbuffer
        } else {
            return FlatBufferBuilder()
        }
    }
    
    internal class func `return`(_ flatBuffer: FlatBufferBuilder) {
        if cachedFlatbuffer.value == nil {
            cachedFlatbuffer.value = flatBuffer
        }
    }
    
    internal func finish() throws -> OBX_bytes {
        var bytes = OBX_bytes()
        obx_fbb_finish(fbb, &bytes)
        return bytes
    }
    
    internal func ensureStarted() {
        obx_fbb_ensure_started(fbb)
    }
    
    internal func clear() {
        obx_fbb_clear(fbb)
    }
}

extension FlatBufferBuilder: PropertyCollector {
    func collect(_ value: Bool, at propertyOffset: UInt16) {
        obx_fbb_collect_bool(fbb, value, propertyOffset)
    }
    
    func collect(_ value: Int8, at propertyOffset: UInt16) {
        obx_fbb_collect_int8(fbb, value, propertyOffset)
    }
    
    func collect(_ value: Int16, at propertyOffset: UInt16) {
        obx_fbb_collect_int16(fbb, value, propertyOffset)
    }
    
    func collect(_ value: Int32, at propertyOffset: UInt16) {
        obx_fbb_collect_int32(fbb, value, propertyOffset)
    }
    
    func collect(_ value: Int64, at propertyOffset: UInt16) {
        obx_fbb_collect_int64(fbb, value, propertyOffset)
    }
    
    func collect(_ value: UInt8, at propertyOffset: UInt16) {
        obx_fbb_collect_uint8(fbb, value, propertyOffset)
    }
    
    func collect(_ value: UInt16, at propertyOffset: UInt16) {
        obx_fbb_collect_uint16(fbb, value, propertyOffset)
    }
    
    func collect(_ value: UInt32, at propertyOffset: UInt16) {
        obx_fbb_collect_uint32(fbb, value, propertyOffset)
    }
    
    func collect(_ value: UInt64, at propertyOffset: UInt16) {
        obx_fbb_collect_uint64(fbb, value, propertyOffset)
    }
    
    func collect(_ value: Float, at propertyOffset: UInt16) {
        obx_fbb_collect_float(fbb, value, propertyOffset)
    }
    
    func collect(_ value: Double, at propertyOffset: UInt16) {
        obx_fbb_collect_double(fbb, value, propertyOffset)
    }
    
    func collect(_ date: Date?, at propertyOffset: UInt16) {
        guard let date = date else { return } // We just don't collect nil values.
        obx_fbb_collect_int64(fbb, date.unixTimestamp, propertyOffset)
    }
    
    /// - Parameter value: Treated as Int64, effectively ignoring 32bit platforms.
    func collect(_ value: Int, at propertyOffset: UInt16) {
        obx_fbb_collect_int64(fbb, Int64(value), propertyOffset)
    }
    
    /// - Parameter value: Treated as UInt64, effectively ignoring 32bit platforms.
    func collect(_ value: UInt, at propertyOffset: UInt16) {
        obx_fbb_collect_uint64(fbb, UInt64(value), propertyOffset)
    }
    
    func collect(dataOffset: OBXDataOffset, at propertyOffset: UInt16) {
        obx_fbb_collect_data_offset(fbb, dataOffset, propertyOffset)
    }
    
    /// - returns: A value > 0 when a string value is prepared; 0 if the property is skipped.
    func prepare(string: String?, at propertyOffset: UInt16) -> OBXDataOffset {
        guard let string = string else { return 0 } // We just don't collect nil values.
        return string.withCString { cString -> OBXDataOffset in
            return obx_fbb_prepare_string(fbb, cString, propertyOffset)
        }
    }
    
    func prepare(bytes data: Data?, at propertyOffset: UInt16) -> OBXDataOffset {
        guard let data = data else { return 0 } // We just don't collect nil values.
        let size = data.count
        return data.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) -> OBXDataOffset in
            return obx_fbb_prepare_bytes(fbb, bytes.baseAddress!, size, propertyOffset)
        }
    }
    
    func prepare(bytes: [UInt8]?, at propertyOffset: UInt16) -> OBXDataOffset {
        guard let bytes = bytes else { return 0 } // We just don't collect nil values.
        let size = bytes.count
        return bytes.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) -> OBXDataOffset in
            return obx_fbb_prepare_bytes(fbb, bytes.baseAddress!, size, propertyOffset)
        }
    }
}

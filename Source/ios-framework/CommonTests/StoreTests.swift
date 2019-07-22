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

// swiftlint:disable identifier_name force_try

import XCTest
@testable import ObjectBox

class StoreTests: XCTestCase {

    enum StoreTestError: Error {
        case generalError
        case generalError2
    }
    
    var store: Store!
    
    override func setUp() {
        super.setUp()
        store = StoreHelper.tempStore(model: createTestModel())
    }
    
    override func tearDown() {
        try! store?.closeAndDeleteAllFiles()
        store = nil
        super.tearDown()
    }
    
    func rethrow(_ error: Error) throws {
        throw error
    }
    
    func testReusesBoxInstances() {
        let testPersonBox1: Box<TestPerson> = store.box(for: TestPerson.self)
        let testPersonBox2: Box<TestPerson> = store.box(for: TestPerson.self)
        XCTAssert(testPersonBox1 === testPersonBox2)
        let allTypesBox1: Box<AllTypesEntity> = store.box(for: AllTypesEntity.self)
        let allTypesBox2: Box<AllTypesEntity> = store.box(for: AllTypesEntity.self)
        XCTAssert(allTypesBox1 === allTypesBox2)
        let testPersonBox3: Box<TestPerson> = store.box(for: TestPerson.self)
        let allTypesBox4: Box<AllTypesEntity> = store.box(for: AllTypesEntity.self)
        XCTAssert(testPersonBox3 !== allTypesBox4)
    }
    
    func testCursorAccessInTransaction() {
        var identifier: UInt64 = 0
        
        XCTAssertNoThrow(try store.obx_runInTransaction { _ in
            let box: Box<TestPerson> = store.box(for: TestPerson.self)
            identifier = try box.put(TestPerson.irrelevant).value
        })
        
        XCTAssertNotEqual(identifier, 0)
    }

    // TODO: This can't happen anymore, can it? Can we do anything else in a similar vein with Box and the C API?
//    func testCursorAccessOutsideTransaction() {
//        var capturedTransaction: ObjectBox.Transaction!
//
//        XCTAssertNoThrow(try store.obx_runInTransaction { transaction in
//            capturedTransaction = transaction
//        })
//
//        if let objCException = ExceptionHelpers.catchExceptionRunning({
//            do {
//                let cursor: SerializationAdapter<TestPerson> = capturedTransaction.adapterForEntity(info: entityInfo)
//                _ = try cursor.put(TestPerson.irrelevant)
//                XCTFail("Expected to throw")
//            } catch {
//                XCTFail("Expected an ObjC exception, got Swift error: \(error)")
//            }
//        }) {
//            print("Caught \(objCException.name): \(String(describing: objCException.reason))")
//            XCTAssert(objCException.reason?.contains("Expected a transaction") == true)
//        }
//    }
//
//    func testSequentialTransactionsClearOutdatedCursors() {
//        XCTAssertNoThrow(try store.obx_runInTransaction { transaction in
//            let cursor: SerializationAdapter<TestPerson> = transaction.adapterForEntity(info: entityInfo)
//            _ = try cursor.put(TestPerson.irrelevant)
//        })
//
//        // TODO: Verify the comment below holds true, we fixed accidental private exception
//        //  inheritance a while ago.
//        // Old cursors have to be cleaned up or else this throws an IllegalStateException
//        // with "State condition failed in putInternal:330: cursor_" that cannot be
//        // caught as std::exception:
//        XCTAssertNoThrow(try store.obx_runInTransaction { transaction in
//            let cursor: SerializationAdapter<TestPerson> = transaction.adapterForEntity(info: entityInfo)
//            _ = try cursor.put(TestPerson.irrelevant)
//        })
//    }
    
    func testParallelTransactions() {
        var expectations = [XCTestExpectation]()
        let count = 20
        
        for i in 0 ..< count {
            let expectation = self.expectation(description: "Execution #\(i)")
            expectations.append(expectation)
            
            Thread.detachNewThread {
                do {
                    try self.store.obx_runInTransaction { _ in
                        let person = TestPerson(name: "\(i)", age: i)
                        let box: Box<TestPerson> = self.store.box(for: TestPerson.self)
                        _ = try box.put(person)
                    }
                } catch {
                    XCTFail("Unexpected error in \(i): \(error)")
                }
                expectation.fulfill()
            }
        }
        
        wait(for: expectations, timeout: 5)
    }
    
    func testNestedReadTransactions() {
        let person = TestPerson(name: "Person", age: 20180621084337)
        let entityId = try! store.box(for: TestPerson.self).put(person)
        
        let result = try! store.obx_runInReadOnlyTransaction { _ -> TestPerson? in
            return try store.obx_runInReadOnlyTransaction({ _ -> TestPerson? in
                let box: Box<TestPerson> = store.box(for: TestPerson.self)
                return box.get(entityId)
            })
        }
        
        XCTAssertEqual(result?.name, person.name)
        XCTAssertEqual(result?.age, person.age)
    }
    
    func testNestedReadTransactions_ErrorsBubbleUp() {
        do {
            try store.obx_runInReadOnlyTransaction { _ in
                try store.obx_runInReadOnlyTransaction({ _ in
                    throw StoreTestError.generalError
                })
            }
            XCTFail("Exception wasn't forwarded.")
        } catch StoreTestError.generalError {
            XCTAssert(true)
        } catch {
            XCTAssertNoThrow(try rethrow(error))
        }
    }
    
    func testNestedReadTransactionsInsideWriteTransaction() {
        let person = TestPerson(name: "Person", age: 20180621084337)
        let entityId = try! store.box(for: TestPerson.self).put(person)
        
        let result = try! store.obx_runInTransaction { _ -> TestPerson? in
            return try store.obx_runInReadOnlyTransaction({ _ -> TestPerson? in
                let box: Box<TestPerson> = store.box(for: TestPerson.self)
                return box.get(entityId)
            })
        }
        
        XCTAssertEqual(result?.name, person.name)
        XCTAssertEqual(result?.age, person.age)
    }
    
    func testNestedWriteTransactions() {
        let result = try! store.obx_runInTransaction { _ -> EntityId in
            return try store.obx_runInTransaction({ _ -> EntityId in
                let box: Box<TestPerson> = store.box(for: TestPerson.self)
                return try box.put(TestPerson.irrelevant).value
            })
        }
        
        XCTAssertNotEqual(result, 0)
    }
    
    func testNestedWriteTransactions_ErrorsBubbleUp() {
        do {
            try store.obx_runInTransaction { _ in
                try store.obx_runInTransaction({ _ in
                    throw StoreTestError.generalError2
                })
            }
            XCTFail("Exception wasn't forwarded.")
        } catch StoreTestError.generalError2 {
            XCTAssert(true)
        } catch {
            XCTAssertNoThrow(try rethrow(error))
        }
    }
    
    func testNestedWriteTransactionInsideReadTransaction_Throws() {
        do {
            try store.obx_runInReadOnlyTransaction { _ in
                try store.obx_runInTransaction({ _ in
                    let box: Box<TestPerson> = store.box(for: TestPerson.self)
                    _ = try box.put(TestPerson.irrelevant)
                })
            }
            XCTFail("Expected exception.")
        } catch ObjectBoxError.cannotWriteWhileReading {
            XCTAssert(true)
        } catch {
            XCTAssertNoThrow(try rethrow(error))
        }
        
        try! Store.threadLocalTransaction.value?.close()
        Store.threadLocalTransaction.value = nil
    }
    
    func testDebugDescription() {
        let debugDescription = "\(store!)"
        XCTAssert(debugDescription.hasPrefix("<ObjectBox.Store"))
        XCTAssert(debugDescription.contains(store.directoryPath))
    }
}
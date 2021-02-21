//  Refactor Small Steps by Jon Reid, https://qualitycoding.org/refactor-small-steps/
//  Copyright 2021 Quality Coding, Inc. See LICENSE.txt

@testable import RefactoringCleanMess
import XCTest

final class ViewControllerTests: XCTestCase {
    private var strings: ScreenStrings!

    override func setUp() {
        super.setUp()
        strings = ScreenStrings(field1Placeholder: "PLACEHOLDER 1", field1Hint: "HINT 1",
                                field2Placeholder: "PLACEHOLDER 2", field2Hint: "HINT 2")
    }

    override func tearDown() {
        strings = nil
        super.tearDown()
    }
    
    func test_loadingView_withNormalStyle_shouldSetTextFieldPlaceholdersToPlaceholderStrings() {
        let viewModel = ViewModel(isAlternateStyle: false)
        let sut = ViewController(strings: strings, viewModel: viewModel)

        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.textField1.placeholder, "PLACEHOLDER 1")
        XCTAssertEqual(sut.textField2.placeholder, "PLACEHOLDER 2")
    }

    func test_loadingView_withAlternativeStyle_shouldSetTextFieldPlaceholdersToHintStrings() {
        let viewModel = ViewModel(isAlternateStyle: true)
        let sut = ViewController(strings: strings, viewModel: viewModel)
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.textField1.placeholder, "HINT 1")
        XCTAssertEqual(sut.textField2.placeholder, "HINT 2")
    }
    
    func test_loadingView_withNormalStyle_shouldSetUpNormalView() {
        let viewModel = ViewModel(isAlternateStyle: false)
        let sut = ViewController(strings: strings, viewModel: viewModel)
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.viewStyle, .normal)
    }

    func test_loadingView_withAlternativeStyle_shouldSetUpAlternativeView() {
        let viewModel = ViewModel(isAlternateStyle: true)
        let sut = ViewController(strings: strings, viewModel: viewModel)
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.viewStyle, .alternative)
    }
}

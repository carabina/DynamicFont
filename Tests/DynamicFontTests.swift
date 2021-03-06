//
//  DynamicFontTests.swift
//  DynamicFontExample
//
//  Created by Yannick LORIOT on 27/09/2016.
//  Copyright © 2016 Yannick Loriot. All rights reserved.
//

import XCTest

class DynamicFontTests: XCTestCase {
  func testInitWithFamily() {
    let font1 = DynamicFont(family: .helveticaNeue, size: 12)

    XCTAssertEqual(font1, DynamicFont(family: .helveticaNeue, weight: .regular, size: 12))
    XCTAssertNotEqual(font1, DynamicFont(family: .arial, weight: .regular, size: 12))
    XCTAssertNotEqual(font1, DynamicFont(family: .helveticaNeue, weight: .light, size: 12))
    XCTAssertNotEqual(font1, DynamicFont(family: .helveticaNeue, weight: .regular, size: 10))

    XCTAssertEqual(font1.family, .helveticaNeue)
    XCTAssertEqual(font1.weight, .regular)
    XCTAssertFalse(font1.isItalic)
    XCTAssertEqual(font1.pointSize, 12)
    XCTAssertEqual(font1.fontName, "HelveticaNeue")

    let font2 = UIFont(family: .appleSDGothicNeo, weight: .semibold, size: 20)

    XCTAssertEqual(font2.family, .appleSDGothicNeo)
    XCTAssertEqual(font2.weight, .semibold)
    XCTAssertFalse(font2.isItalic)
    XCTAssertEqual(font2.pointSize, 20)
    XCTAssertEqual(font2.fontName, "AppleSDGothicNeo-SemiBold")

    let font3 = UIFont(family: .avenir, weight: .heavy, size: -12)

    XCTAssertEqual(font3.family, .avenir)
    XCTAssertEqual(font3.weight, .heavy)
    XCTAssertFalse(font3.isItalic)
    XCTAssertEqual(font3.pointSize, 0)
    XCTAssertEqual(font3.fontName, "Avenir-Heavy")
  }

  func testInitWithFamillyName() {
    let font = DynamicFont(familyName: "WrongFamilyName", size: 12)

    XCTAssertEqual(font.family, .helvetica)
    XCTAssertEqual(font.weight, .regular)
    XCTAssertFalse(font.isItalic)
    XCTAssertEqual(font.pointSize, 12)
    XCTAssertEqual(font.fontName, "Helvetica")
  }

  func testFamilly() {
    let font1 = DynamicFont(family: .helveticaNeue, size: 12)

    XCTAssertEqual(font1.family, .helveticaNeue)

    let font2 = DynamicFont(familyName: "Zapfino", size: 12)

    XCTAssertEqual(font2.family, .zapfino)

    let font3 = DynamicFont(name: "AvenirNext-UltraLightItalic", size: 10)

    XCTAssertNotNil(font3)
    XCTAssertEqual(font3?.family, .avenirNext)

    let font4 = DynamicFont(name: "WrongFontName", size: 10)

    XCTAssertNil(font4)
  }

  func testWeight() {
    let font1 = DynamicFont(family: .helveticaNeue, size: 12)

    XCTAssertEqual(font1.weight, .regular)

    let font2 = DynamicFont(name: "Helvetica-Bold", size: 32)

    XCTAssertNotNil(font2)
    XCTAssertEqual(font2?.weight, .bold)

    let font3 = DynamicFont(name: "AvenirNext-UltraLightItalic", size: 10)

    XCTAssertNotNil(font3)
    XCTAssertEqual(font3?.weight, .ultraLight)
  }

  func testWithWeight() {
    let font = DynamicFont(family: .helveticaNeue, size: 12)

    let font2 = font.withWeight(.ultraLight)

    XCTAssertEqual(font2.family, .helveticaNeue)
    XCTAssertEqual(font2.weight, .ultraLight)
    XCTAssertFalse(font2.isItalic)
    XCTAssertEqual(font2.pointSize, 12)
    XCTAssertEqual(font2.fontName, "HelveticaNeue-UltraLight")

    let font3 = font.withWeight(.thin)

    XCTAssertEqual(font3.family, .helveticaNeue)
    XCTAssertEqual(font3.weight, .thin)
    XCTAssertFalse(font3.isItalic)
    XCTAssertEqual(font3.pointSize, 12)
    XCTAssertEqual(font3.fontName, "HelveticaNeue-Thin")

    let font4 = font.withWeight(.light)

    XCTAssertEqual(font4.family, .helveticaNeue)
    XCTAssertEqual(font4.weight, .light)
    XCTAssertFalse(font4.isItalic)
    XCTAssertEqual(font4.pointSize, 12)
    XCTAssertEqual(font4.fontName, "HelveticaNeue-Light")

    let font5 = font.withWeight(.medium)

    XCTAssertEqual(font5.family, .helveticaNeue)
    XCTAssertEqual(font5.weight, .medium)
    XCTAssertFalse(font5.isItalic)
    XCTAssertEqual(font5.pointSize, 12)
    XCTAssertEqual(font5.fontName, "HelveticaNeue-Medium")

    let font6 = font.withWeight(.semibold)

    XCTAssertEqual(font6.family, .helveticaNeue)
    XCTAssertEqual(font6.weight, .medium)
    XCTAssertFalse(font6.isItalic)
    XCTAssertEqual(font6.pointSize, 12)
    XCTAssertEqual(font6.fontName, "HelveticaNeue-Medium")

    let font7 = font.withWeight(.bold)

    XCTAssertEqual(font7.family, .helveticaNeue)
    XCTAssertEqual(font7.weight, .bold)
    XCTAssertFalse(font7.isItalic)
    XCTAssertEqual(font7.pointSize, 12)
    XCTAssertEqual(font7.fontName, "HelveticaNeue-Bold")

    let font8 = font.withWeight(.heavy)

    XCTAssertEqual(font8.family, .helveticaNeue)
    XCTAssertEqual(font8.weight, .bold)
    XCTAssertFalse(font8.isItalic)
    XCTAssertEqual(font8.pointSize, 12)
    XCTAssertEqual(font8.fontName, "HelveticaNeue-Bold")

    let font9 = font.withWeight(.black)

    XCTAssertEqual(font9.family, .helveticaNeue)
    XCTAssertEqual(font9.weight, .black)
    XCTAssertFalse(font9.isItalic)
    XCTAssertEqual(font9.pointSize, 12)
    XCTAssertEqual(font9.fontName, "HelveticaNeue-CondensedBlack")
  }

  func testIsItalic() {
    let font1 = DynamicFont(family: .helveticaNeue, size: 12)

    XCTAssertFalse(font1.isItalic)

    let font2 = DynamicFont(name: "Helvetica-Bold", size: 32)

    XCTAssertNotNil(font2)
    XCTAssertFalse(font2!.isItalic)

    let font3 = DynamicFont(name: "AvenirNext-UltraLightItalic", size: 10)

    XCTAssertNotNil(font3)
    XCTAssertTrue(font3!.isItalic)
  }

  func testWithItalic() {
    let font1 = DynamicFont(family: .helveticaNeue, size: 12).withItalic()

    XCTAssertTrue(font1.isItalic)
    XCTAssertEqual(font1.fontName, "HelveticaNeue-Italic")
    XCTAssertFalse(font1.withItalic(false).isItalic)
    XCTAssertEqual(font1.withItalic(false).fontName, "HelveticaNeue")

    let font2 = DynamicFont(family: .helvetica, weight: .bold, size: 12).withItalic()

    XCTAssertTrue(font2.isItalic)
    XCTAssertEqual(font2.fontName, "Helvetica-BoldOblique")
    XCTAssertFalse(font2.withItalic(false).isItalic)
    XCTAssertEqual(font2.withItalic(false).fontName, "Helvetica-Bold")

    let font3 = DynamicFont(family: .appleSDGothicNeo, size: 12).withItalic()

    XCTAssertFalse(font3.isItalic)
    XCTAssertEqual(font3.fontName, "AppleSDGothicNeo-Regular")
  }

  func testSymbolicTraits() {
    let font1 = DynamicFont(family: .arial, size: 12)

    XCTAssertNotNil(font1.symbolicTraits)
  }

  func testWithSymbolicTraits() {
    let font1 = DynamicFont(family: .arial, size: 12).withSymbolicTraits(.traitItalic)

    XCTAssertTrue(font1.symbolicTraits.contains(.traitItalic))

    let font2 = DynamicFont(family: .appleSDGothicNeo, size: 12).withSymbolicTraits(.traitItalic)

    XCTAssertFalse(font2.symbolicTraits.contains(.traitItalic))
  }
}

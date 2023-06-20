//
//  Info2.swift
//  Learning2
//
//  Created by Emmet Carey on 19/06/2023.
//

import Foundation

    
struct Info2 {
    
    static let rom: [[String]] = [
            ["a", "i", "u", "e", "o"],
            ["ka", "ki", "ku", "ke", "ko"],
            ["sa", "shi", "su", "se", "so"],
            ["ta", "chi", "tsu", "te", "to"],
            ["na", "ni", "nu", "ne", "no"],
            ["ha", "hi", "hu", "he", "ho"],
            ["ma", "mi", "mu", "me", "mo"],
            ["ya", "yu", "yo"],
            ["ra", "ri", "ru", "re", "ro"],
            ["wa", "wo"],
            ["ga", "gi", "gu", "ge", "go"],
            ["za", "ji", "zu", "ze", "zo"],
            ["da", "dji", "dzu", "de", "do"],
            ["ba", "bi", "bu", "be", "bo"],
            ["pa", "pi", "pu", "pe", "po"],
            ["kya", "kyu", "kyo"],
            ["sha", "shu", "sho"],
            ["cha", "chu", "cho"],
            ["nya", "nyu", "nyo"],
            ["hya", "hyu", "hyo"],
            ["mya", "myu", "myo"],
            ["rya", "ryu", "ryo"],
            ["gya", "gyu", "gyo"],
            ["ja", "ju", "jo"],
            ["dja", "dju", "djo"],
            ["bya", "byu", "byo"],
            ["pya", "pyu", "pyo"]
        ]
    
    static let kat: [[String]] = [
        ["カ", "キ", "ク", "ケ", "コ"],
        ["サ", "シ", "ス", "セ", "ソ"],
        ["タ", "チ", "ツ", "テ", "ト"],
        ["ナ", "ニ", "ヌ", "ネ", "ノ"],
        ["ハ", "ヒ", "フ", "ヘ", "ホ"],
        ["マ", "ミ", "ム", "メ", "モ"],
        ["ヤ", "ユ", "ヨ"],
        ["ラ", "リ", "ル", "レ", "ロ"],
        ["ワ", "ヲ"],
        ["ガ", "ギ", "グ", "ゲ", "ゴ"],
        ["ザ", "ジ", "ズ", "ゼ", "ゾ"],
        ["ダ", "ヂ", "ヅ", "デ", "ド"],
        ["バ", "ビ", "ブ", "ベ", "ボ"],
        ["パ", "ピ", "プ", "ペ", "ポ"],
        ["キャ", "キュ", "キョ"],
        ["シャ", "シュ", "ショ"],
        ["チャ", "チュ", "チョ"],
        ["ニャ", "ニュ", "ニョ"],
        ["ヒャ", "ヒュ", "ヒョ"],
        ["ミャ", "ミュ", "ミョ"],
        ["リャ", "リュ", "リョ"],
        ["ギャ", "ギュ", "ギョ"],
        ["ジャ", "ジュ", "ジョ"],
        ["ヂャ", "ヂュ", "ヂョ"],
        ["ビャ", "ビュ", "ビョ"],
        ["ピャ", "ピュ", "ピョ"]
    ]
    
    static func getKat(for romInput: String) -> String? {
          for (outerIndex, subArray) in rom.enumerated() {
              if let innerIndex = subArray.firstIndex(of: romInput) {
                  return kat[outerIndex-1][innerIndex]
              }
          }
          return nil
      }
    
    static func getRom(for katInput: String) -> String? {
        for (outerIndex, subArray) in kat.enumerated() {
            if let innerIndex = subArray.firstIndex(of: katInput) {
                return rom[outerIndex+1][innerIndex]
            }
        }
        return nil
    }
}

    
    
    

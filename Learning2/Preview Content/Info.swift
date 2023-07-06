//
//  Katakana_Info.swift
//  UITest
//
//  Created by Emmet Carey on 22/05/2023.
//

import Foundation

struct Info {
    
    static let backgroundSymbols = [ "ア", "イ", "ウ", "エ", "オ","カ", "キ", "ク", "ケ", "コ","サ", "シ", "ス", "セ", "ソ","タ", "チ", "ツ", "テ", "ト","ナ", "ニ", "ヌ", "ネ", "ノ", "あ","い","う", "え", "お","か", "き"]
    
    static let fontSizes1: [CGFloat] = [
        8, 10, 10,10,10,20,20,20,20, 30, 30, 30, 40, 40, 40, 40, 40, 40, 60,150
    ]

    
    static let romList: [[String]] = [
        
        ["a", "e", "i", "o", "u"],
        ["ka", "ke", "ki", "ko", "ku"],
        ["sa", "se", "shi", "so", "su"],
        ["ta", "te", "ti", "to", "tsu"],
        ["na", "ne", "ni", "no", "nu"],
        ["ha", "he", "hi", "ho", "hu"],
        ["ma", "me", "mi", "mo", "mu"],
        ["ra", "re", "ri", "ro", "ru"],
        ["ya", "yo", "yu","wa", "we", "wo"],
        ["ga", "ge", "gi", "go", "gu"],
        ["za", "ze", "zi", "zo", "zu"],
        ["da", "de", "di", "do", "du"],
        ["ba", "be", "bi", "bo", "bu"],
        ["pa", "pe", "pi", "po", "pu"],
        ["kya", "kyo", "kyu"],
        ["sha", "sho", "shu"],
        ["cha", "cho", "chu"],
        ["nya", "nyo", "nyu"],
        ["hya", "hyo", "hyu"],
        ["mya", "myo", "myu"],
        ["rya", "ryo", "ryu"],
        ["gya", "gyo", "gyu"],
        ["ja", "jo", "ju"],
        ["dja", "djo", "dju"],
        ["bya", "byo", "byu"],
        ["pya", "pyo", "pyu"],
    ]
    static let katList: [[String]] = [
        ["ア", "エ", "イ", "オ", "ウ"],
        ["カ", "ケ", "キ", "コ", "ク"],
        ["サ", "セ", "シ", "ソ", "ス"],
        ["タ", "テ", "チ", "ト", "ツ"],
        ["ナ", "ネ", "ニ", "ノ", "ヌ"],
        ["ハ", "ヘ", "ヒ", "ホ", "フ"],
        ["マ", "メ", "ミ", "モ", "ム"],
        ["ラ", "レ", "リ", "ロ", "ル"],//r
        ["ヤ","ヨ", "ユ","ワ", "ヱ", "ヲ"],//w
        ["ガ", "ゲ", "ギ", "ゴ", "グ"],
        ["ザ", "ゼ", "ジ", "ゾ", "ズ"],
        ["ダ", "デ", "ヂ", "ド", "ヅ"],
        ["バ", "ベ", "ビ", "ボ", "ブ"],
        ["パ", "ペ", "ピ", "ポ", "プ"],
  
        ["キャ", "キョ", "キュ"],
        ["シャ", "ショ", "シュ"],
        ["チャ", "チョ", "チュ"],
   
        ["ニャ", "ニョ", "ニュ"],
        ["ヒャ", "ヒョ", "ヒュ"],
        ["ミャ", "ミョ", "ミュ"],
  
        ["リャ", "リョ", "リュ"],
        ["ギャ", "ギョ", "ギュ"],
        ["ジャ", "ジョ", "ジュ"],
 
        ["ヂャ", "ヂョ", "ヂュ"],
        ["ビャ", "ビョ", "ビュ"],
        ["ピャ", "ピョ", "ピュ"],
     
    ]
    static let hirList: [[String]] = [
         ["あ", "え", "い", "お", "う"],
         ["か", "け", "き", "こ", "く"],
         ["さ", "せ", "し", "そ", "す"],
         ["た", "て", "ち", "と", "つ"],
         ["な", "ね", "に", "の", "ぬ"],
         ["は", "へ", "ひ", "ほ", "ふ"],
         ["ま", "め", "み", "も", "む"],
         ["ら", "れ", "り", "ろ", "る"],
         ["や","よ", "ゆ","わ", "ゑ", "を"],
         ["が", "げ", "ぎ", "ご", "ぐ"],
         ["ざ", "ぜ", "じ", "ぞ", "ず"],
         ["だ", "で", "ぢ", "ど", "づ"],
         ["ば", "べ", "び", "ぼ", "ぶ"],
         ["ぱ", "ぺ", "ぴ", "ぽ", "ぷ"],
         ["きゃ", "きょ", "きゅ"],
         ["しゃ",  "しょ", "しゅ"],
         ["ちゃ",  "ちょ", "ちゅ"],
         ["にゃ", "にょ", "にゅ"],
         ["ひゃ", "ひょ", "ひゅ"],
         ["みゃ","みょ", "みゅ"],
         ["りゃ", "りょ", "りゅ"],
         ["ぎゃ", "ぎょ", "ぎゅ"],
         ["じゃ", "じょ", "じゅ"],
         ["ぢゃ",  "ぢょ", "ぢゅ"],
         ["びゃ", "びょ", "びゅ"],
         ["ぴゃ", "ぴょ", "ぴゅ"],
     ]
   
    
    static let katNEW1: [[String]] = [
        ["ア", "エ", "イ", "オ", "ウ"],
        ["カ", "ケ", "キ", "コ", "ク"],
        ["サ", "セ", "シ", "ソ", "ス"],
        [],
        ["タ", "テ", "チ", "ト", "ツ"],
        ["ナ", "ネ", "ニ", "ノ", "ヌ"],
        ["ハ", "ヘ", "ヒ", "ホ", "フ"],
        [],
        ["マ", "メ", "ミ", "モ", "ム"],
        ["ラ", "レ", "リ", "ロ", "ル"],//r
        ["ヤ","ヨ", "ユ","ワ", "ヱ", "ヲ"],//w
        [],
        ["ガ", "ゲ", "ギ", "ゴ", "グ"],
        ["ザ", "ゼ", "ジ", "ゾ", "ズ"],
        ["ダ", "デ", "ヂ", "ド", "ヅ"],
        ["バ", "ベ", "ビ", "ボ", "ブ"],
        ["パ", "ペ", "ピ", "ポ", "プ"],
        [],
        ["キャ", "キョ", "キュ"],
        ["シャ", "ショ", "シュ"],
        ["チャ", "チョ", "チュ"],
        [],
        ["ニャ", "ニョ", "ニュ"],
        ["ヒャ", "ヒョ", "ヒュ"],
        ["ミャ", "ミョ", "ミュ"],
        [],
        ["リャ", "リョ", "リュ"],
        ["ギャ", "ギョ", "ギュ"],
        ["ジャ", "ジョ", "ジュ"],
        [],
        ["ヂャ", "ヂョ", "ヂュ"],
        ["ビャ", "ビョ", "ビュ"],
        ["ピャ", "ピョ", "ピュ"],
        []
    ]

   static let hirNEW1: [[String]] = [
    ["あ", "え", "い", "お", "う"],
    ["か", "け", "き", "こ", "く"],
    ["さ", "せ", "し", "そ", "す"],
    [],
    ["た", "て", "ち", "と", "つ"],
    ["な", "ね", "に", "の", "ぬ"],
    ["は", "へ", "ひ", "ほ", "ふ"],
    [],
    ["ま", "め", "み", "も", "む"],
    ["ら", "れ", "り", "ろ", "る"],
    ["や","よ", "ゆ","わ", "ゑ", "を"],
    [],
    ["が", "げ", "ぎ", "ご", "ぐ"],
    ["ざ", "ぜ", "じ", "ぞ", "ず"],
    ["だ", "で", "ぢ", "ど", "づ"],
    ["ば", "べ", "び", "ぼ", "ぶ"],
    ["ぱ", "ぺ", "ぴ", "ぽ", "ぷ"],
    [],
    ["きゃ", "きょ", "きゅ"],
    ["しゃ",  "しょ", "しゅ"],
    ["ちゃ",  "ちょ", "ちゅ"],
    [],
    ["にゃ", "にょ", "にゅ"],
    ["ひゃ", "ひょ", "ひゅ"],
    ["みゃ","みょ", "みゅ"],
    [],
    ["りゃ", "りょ", "りゅ"],
    ["ぎゃ", "ぎょ", "ぎゅ"],
    ["じゃ", "じょ", "じゅ"],
    [],
    ["ぢゃ",  "ぢょ", "ぢゅ"],
    ["びゃ", "びょ", "びゅ"],
    ["ぴゃ", "ぴょ", "ぴゅ"],
    []
    ]
    
    static let romNEW1: [[String]] = [
        
        ["a", "e", "i", "o", "u"],
        ["ka", "ke", "ki", "ko", "ku"],
        ["sa", "se", "shi", "so", "su"],
        [],
        ["ta", "te", "ti", "to", "tsu"],
        ["na", "ne", "ni", "no", "nu"],
        ["ha", "he", "hi", "ho", "hu"],
        [],
        ["ma", "me", "mi", "mo", "mu"],
        ["ra", "re", "ri", "ro", "ru"],
        ["ya", "yo", "yu","wa", "we", "wo"],
        [],
        ["ga", "ge", "gi", "go", "gu"],
        ["za", "ze", "zi", "zo", "zu"],
        ["da", "de", "di", "do", "du"],
        ["ba", "be", "bi", "bo", "bu"],
        ["pa", "pe", "pi", "po", "pu"],
        [],
        ["kya", "kyo", "kyu"],
        ["sha", "sho", "shu"],
        ["cha", "cho", "chu"],
        [],
        ["nya", "nyo", "nyu"],
        ["hya", "hyo", "hyu"],
        ["mya", "myo", "myu"],
        [],
        ["rya", "ryo", "ryu"],
        ["gya", "gyo", "gyu"],
        ["ja", "jo", "ju"],
        [],
        ["dja", "djo", "dju"],
        ["bya", "byo", "byu"],
        ["pya", "pyo", "pyu"],
        []
    ]
    
    
}


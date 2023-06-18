//
//  Katakana_Info.swift
//  UITest
//
//  Created by Emmet Carey on 22/05/2023.
//

import Foundation

let rom_a = ["a","ka","sa","ta","na","ha","ma","ya","ra","wa","ga","za","da","ba","pa"]
let rom_e = ["e", "ke", "se", "te", "ne", "he", "me", "re", "we", "ge", "ze", "de", "be", "pe"]
let rom_i = ["i", "ki", "shi", "chi", "ni", "hi", "mi", "ri", "wi", "gi", "ji", "dji", "bi", "pi"]
let rom_o = ["o", "ko", "so", "to", "no", "ho", "mo", "yo", "ro", "wo", "go", "zo", "do", "bo", "po"]
let rom_u = ["u", "ku", "su", "tsu", "nu", "hu", "mu", "yu", "ru", "gu", "zu", "dzu", "bu", "pu"]
let rom_vn = ["v", "n"]



let kat_a = ["ア", "カ", "サ", "タ", "ナ", "ハ", "マ", "ヤ", "ラ", "ワ", "ガ", "ザ", "ダ", "バ", "パ"]
let kat_i = ["イ", "キ", "シ", "チ", "ニ", "ヒ", "ミ", "リ", "ヰ", "ギ", "ジ", "ヂ", "ビ", "ピ"]
let kat_o = ["オ", "コ", "ソ", "ト", "ノ", "ホ", "モ", "ヨ", "ロ", "ヲ", "ゴ", "ゾ", "ド", "ボ", "ポ"]
let kat_e = ["エ", "ケ", "セ", "テ", "ネ", "ヘ", "メ", "レ", "ヱ", "ゲ", "ゼ", "デ", "ベ", "ペ"]
let kat_u = ["ウ", "ク", "ス", "ツ", "ヌ", "フ", "ム", "ユ", "ル", "グ", "ズ", "ヅ", "ブ", "プ"]
let kat_vn = ["ヴ", "ン"]

let hir_a = ["あ","か","さ","た","な","は","ま","や","ら","わ","が","ざ","だ","ば","ぱ"]
let hir_i = ["い","き","し","ち","に","ひ","み","り","ゐ","ぎ","じ","ぢ","び","ぴ"]
let hir_o = ["お","こ","そ","と","の","ほ","も","よ","ろ","を","ご","ぞ","ど","ぼ","ぽ"]
let hir_e = ["え","け","せ","て","ね","へ","め","れ","ゑ","げ","ぜ","で","べ","ぺ"]
let hir_u = ["う","く","す","つ","ぬ","ふ","む","ゆ","る","ぐ","ず","づ","ぶ","ぷ"]
let hir_vn = ["ゔ","ん"]



struct Info {
    
    static let rom_vowels = [rom_a[0] , rom_e[0] , rom_i[0] , rom_o[0] , rom_u[0]]
    static let kat_vowels = [kat_a[0] , kat_e[0] , kat_i[0] , kat_o[0] , kat_u[0]]
    static let hir_vowels = [hir_a[0] , hir_e[0] , hir_i[0] , hir_o[0] , hir_u[0]]
    
    static let rom_k = [rom_a[1] , rom_e[1] , rom_i[1] , rom_o[1] , rom_u[1]]
    static let rom_s = [rom_a[2] , rom_e[2] , rom_i[2] , rom_o[2] , rom_u[2]]
    static let rom_t = [rom_a[3] , rom_e[3] , rom_i[3] , rom_o[3] , rom_u[3]]
    static let rom_n = [rom_a[4] , rom_e[4] , rom_i[4] , rom_o[4] , rom_u[4]]
    static let rom_h = [rom_a[5] , rom_e[5] , rom_i[5] , rom_o[5] , rom_u[5]]
    static let rom_m = [rom_a[6] , rom_e[6] , rom_i[6] , rom_o[6] , rom_u[6]]
    static let rom_r = [rom_a[7] , rom_e[7] , rom_i[7] , rom_o[7] , rom_u[7]]
    
    
    static let kat_k = [kat_a[1] , kat_e[1] , kat_i[1] , kat_o[1] , kat_u[1]]
    static let kat_s = [kat_a[2] , kat_e[2] , kat_i[2] , kat_o[2] , kat_u[2]]
    static let kat_t = [kat_a[3] , kat_e[3] , kat_i[3] , kat_o[3] , kat_u[3]]
    static let kat_n = [kat_a[4] , kat_e[4] , kat_i[4] , kat_o[4] , kat_u[4]]
    static let kat_h = [kat_a[5] , kat_e[5] , kat_i[5] , kat_o[5] , kat_u[5]]
    static let kat_m = [kat_a[6] , kat_e[6] , kat_i[6] , kat_o[6] , kat_u[6]]
    static let kat_r = [kat_a[7] , kat_e[7] , kat_i[7] , kat_o[7] , kat_u[7]]
    
    
    static let hir_k = [hir_a[1] , hir_e[1] , hir_i[1] , hir_o[1] , hir_u[1]]
    static let hir_s = [hir_a[2] , hir_e[2] , hir_i[2] , hir_o[2] , hir_u[2]]
    static let hir_t = [hir_a[3] , hir_e[3] , hir_i[3] , hir_o[3] , hir_u[3]]
    static let hir_n = [hir_a[4] , hir_e[4] , hir_i[4] , hir_o[4] , hir_u[4]]
    static let hir_h = [hir_a[5] , hir_e[5] , hir_i[5] , hir_o[5] , hir_u[5]]
    static let hir_m = [hir_a[6] , hir_e[6] , hir_i[6] , hir_o[6] , hir_u[6]]
    static let hir_r = [hir_a[7] , hir_e[7] , hir_i[7] , hir_o[7] , hir_u[7]]
     
    static let allRoms = rom_a + rom_e + rom_i + rom_o + rom_u + rom_vn
    static let allKats = kat_a + kat_e + kat_i + kat_o + kat_u + kat_vn
    static let allHir =  hir_a + hir_e + hir_i + hir_o + hir_u + hir_vn

    static let easyRom = ["a","ka","sa","ta","na","ha","ma","ya","ra","e", "ke", "se", "te", "ne", "he", "me", "re","we","i", "ki", "shi", "chi", "ni", "hi", "mi", "ri","o", "ko", "so", "to", "no", "ho", "mo", "yo", "ro","u", "ku", "su", "tsu", "nu", "hu", "mu", "yu", "ru","n"]
    static let easyKat = ["ア", "カ", "サ", "タ", "ナ", "ハ", "マ", "ヤ", "ラ","エ", "ケ", "セ", "テ", "ネ", "ヘ", "メ", "レ","イ", "キ", "シ", "チ", "ニ", "ヒ", "ミ", "リ","オ", "コ", "ソ", "ト", "ノ", "ホ", "モ", "ヨ", "ロ","ウ", "ク", "ス", "ツ", "ヌ", "フ", "ム", "ユ", "ル","ン"]
    static let easyHir = ["あ","か","さ","た","な","は","ま","や","ら","え","け","せ","て","ね","へ","め","れ","ゑ","い","き","し","ち","に","ひ","み","り","お","こ","そ","と","の","ほ","も","よ","ろ","う","く","す","つ","ぬ","ふ","む","ゆ","る","ん"]
    
    static let backgroundSymbols = [ "ア", "イ", "ウ", "エ", "オ","カ", "キ", "ク", "ケ", "コ","サ", "シ", "ス", "セ", "ソ","タ", "チ", "ツ", "テ", "ト","ナ", "ニ", "ヌ", "ネ", "ノ", "あ","い","う", "え", "お","か", "き", "く", "け", "こ","さ", "し", "す", "せ", "そ","た", "ち", "つ", "て", "と","な", "に", "ぬ", "ね", "の"]
    
    static let fontSizes1: [CGFloat] = [
        8, 10, 10,10,10,20,20,20,20,20,20,20,20,20,20,20, 30, 30, 30, 40, 40, 40, 60,150
    ]
    static let fontSizes2: [CGFloat] = [
        8, 10, 10,10,10,20,20,20,20
    ]
    
    static let buttonNamesKat : Array = [
        Info.kat_vowels.joined(),
        Info.kat_k.joined(),
        Info.kat_s.joined(),
        Info.kat_t.joined(),
        Info.kat_n.joined(),
        Info.kat_h.joined(),
        Info.kat_m.joined(),
        Info.kat_r.joined(),
    
    ]
    
    static let buttonNamesHir : Array = [
        Info.hir_vowels.joined(),
        Info.hir_k.joined(),
        Info.hir_s.joined(),
        Info.hir_t.joined(),
        Info.hir_n.joined(),
        Info.hir_h.joined(),
        Info.hir_m.joined(),
        Info.hir_r.joined(),
    
    ]
    

    
}


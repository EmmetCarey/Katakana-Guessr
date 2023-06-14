//
//  GetLevels.swift
//  Learning2
//
//  Created by Emmet Carey on 13/06/2023.
//

import Foundation

func getArray() -> [Int] {
    
    var kat1 = Info.kat_vowels
    var kat2 = combineArrays(array1: kat1, array2: Info.kat_k)
    var kat3 = combineArrays(array1: kat2, array2: Info.kat_s)
    var kat4 = combineArrays(array1: kat3, array2: Info.kat_t)
    var kat5 = combineArrays(array1: kat4, array2: Info.kat_n)
    var kat6 = combineArrays(array1: kat5, array2: Info.kat_h)
    var kat7 = combineArrays(array1: kat6, array2: Info.kat_m)
    var kat8 = combineArrays(array1: kat7, array2: Info.kat_r)
    
    var rom1 = Info.rom_vowels
    var rom2 = combineArrays(array1: rom1, array2: Info.rom_k)
    var rom3 = combineArrays(array1: rom2, array2: Info.rom_s)
    var rom4 = combineArrays(array1: rom3, array2: Info.rom_t)
    var rom5 = combineArrays(array1: rom4, array2: Info.rom_n)
    var rom6 = combineArrays(array1: rom5, array2: Info.rom_h)
    var rom7 = combineArrays(array1: rom6, array2: Info.rom_m)
    var rom8 = combineArrays(array1: rom7, array2: Info.rom_r)

    var hir1 = Info.hir_vowels
    var hir2 = combineArrays(array1: hir1, array2: Info.hir_k)
    var hir3 = combineArrays(array1: hir2, array2: Info.hir_s)
    var hir4 = combineArrays(array1: hir3, array2: Info.hir_t)
    var hir5 = combineArrays(array1: hir4, array2: Info.hir_n)
    var hir6 = combineArrays(array1: hir5, array2: Info.hir_h)
    var hir7 = combineArrays(array1: hir6, array2: Info.hir_m)
    var hir8 = combineArrays(array1: hir7, array2: Info.hir_r)
    
    let level1kat = [kat1, rom1]
    let level2kat = [kat2, rom2]
    let level3kat = [kat3, rom3]
    let level4kat = [kat4, rom4]
    let level5kat = [kat5, rom5]
    let level6kat = [kat6, rom6]
    let level7kat = [kat7, rom7]
    let level8kat = [kat8, rom8]
    
    let level1hir = [hir1, rom1]
    let level2hir = [hir2, rom2]
    let level3hir = [hir3, rom3]
    let level4hir = [hir4, rom4]
    let level5hir = [hir5, rom5]
    let level6hir = [hir6, rom6]
    let level7hir = [hir7, rom7]
    let level8hir = [hir8, rom8]
    
    

    

    
    
   print(level8kat)

    

    
    return [0]
}

func combineArrays(array1: [String], array2: [String]) -> [String] {
    // Perform operations on array1 and array2
    var resultArray : [String] = []
    
    let elementsToSelect = array1.count / 2
    
    for _ in 0..<elementsToSelect {
        if let randomElement = array1.randomElement() {
            // Add selected element to array2
            resultArray.append(randomElement)
        }
    }
    resultArray+=array2
    // Return the resulting array
    return resultArray
}

//
//  SaveView.swift
//  Learning2
//
//  Created by Emmet Carey on 07/07/2023.
//

import SwiftUI

struct SaveView: View {
    var body: some View {
       
       
        VStack{
            
        }.onAppear(){
            
            
            resetJSON()
            //let index = Info.normalDist.firstIndex(of: getIndex())
            changeJSON(searchString: "a", isPlus: true)
            print(getWeight(searchString: "a"))
            //print(getJSON())
            }
        }
        
    }
    
    func getIndex( searchString: String) -> [Int]{
        if let rowIndex = Info.romList.firstIndex(where: { $0.contains(searchString) }),
           let columnIndex = Info.romList[rowIndex].firstIndex(of: searchString) {
            return [rowIndex,columnIndex]
        } else{
            return [1,1]
        }
       
    }
    
    func getWeight(searchString: String)->String{
        let index = getIndex(searchString: searchString)
        var array2 : [[String]] = [[]]
        
        if let retrievedArray = retrieveArrayFromJson(fileName: "array.json") {
            for subArray in retrievedArray {
                array2.append(subArray)
            }
            array2.removeFirst()
          
        }
        return array2[index[0]][index[1]]
        //return array2[[index[0]][index[1]]]
    }
    
        
    func changeJSON(searchString : String, isPlus: Bool){
            var array2 : [[String]] = [[]]
            
            if let retrievedArray = retrieveArrayFromJson(fileName: "array.json") {
                for subArray in retrievedArray {
                    array2.append(subArray)
                }
                array2.removeFirst()
                
                
                var index = getIndex(searchString: searchString)
                
                print(index)
                /*
                array2[index[0]][index[1]] = isPlus ? String(format: "%.2f",Double(array2[index[0]][index[1]])! + modifier) : String(format: "%.2f",Double(array2[index[0]][index[1]])! - modifier)
               */
                
               
                let index1 = Int(Info.normalDist.firstIndex(of: array2[index[0]][index[1]])!)
                
                //print(Info.normalDist.firstIndex(of:array2[index[0]][index[1]]))
                let index2 = isPlus ? (index1 == 92 ? index1 : index1 + 1) : (index1 == 0 ? index1 : index1 - 1)
                
                // normalDISt has 92 values

                /*
                if index2 != nil || index1 != "0.000" {
                    array2[index[0]][index[1]] = Info.normalDist[index2]
                }else{
                    array2[index[0]][index[1]] = Info.normalDist[index1]
                }
                 */
                array2[index[0]][index[1]] = Info.normalDist[index2]
                
               
                overwriteArrayToJson(array2, fileName: "array.json")
                
            }
            
        }

    func getJSON() -> [[String]]{
        
        var array2 : [[String]] = [[]]
        
        if let retrievedArray = retrieveArrayFromJson(fileName: "array.json") {
            for subArray in retrievedArray {
                array2.append(subArray)
            }
            array2.removeFirst()
          
        }
        return array2
    }
    
    func resetJSON(){
        let i = "0.5000"
        let array: [[String]] = [
            [i, i, i, i, i],
            [i, i, i, i, i],
            [i, i, i, i, i],
            [i, i, i, i, i],
            [i, i, i, i, i],
            [i, i, i, i, i],
            [i, i, i, i, i],
            [i, i, i, i, i],
            [i, i, i, i, i],
            [i, i, i, i, i],
            [i, i, i, i, i],
            [i, i, i, i, i],
            [i, i, i, i, i],
            [i, i, i, i, i],
            [i, i, i, i],
            [i, i, i],
            [i, i, i],
            [i, i, i],
            [i, i, i],
            [i, i, i],
            [i, i, i],
            [i, i, i],
            [i, i, i],
            [i, i, i],
            [i, i, i],
            [i, i, i],
            [i, i, i],
            [i, i, i]
        ]
        
        overwriteArrayToJson(array, fileName: "array.json")
    }


    func overwriteArrayToJson(_ array: [[String]], fileName: String) {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        do {
            let jsonData = try encoder.encode(array)
            
            // Specify the file URL to save the JSON data
            let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(fileName)
            
            // Remove the existing file if it exists
            if FileManager.default.fileExists(atPath: fileURL!.path) {
                try FileManager.default.removeItem(at: fileURL!)
            }
            
            // Write the JSON data to the file
            try jsonData.write(to: fileURL!)
            
            print("Array overwritten to JSON successfully.")
        } catch {
            print("Error overwriting array to JSON: \(error.localizedDescription)")
        }
    }

    
    func retrieveArrayFromJson(fileName: String) -> [[String]]? {
        // Specify the file URL of the JSON file
        guard let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(fileName) else {
            print("JSON file not found.")
            return nil
        }
        
        do {
            // Read the JSON data from the file
            let jsonData = try Data(contentsOf: fileURL)
            
            // Decode the JSON data into the array
            let decoder = JSONDecoder()
            let array = try decoder.decode([[String]].self, from: jsonData)
            
            return array
        } catch {
            print("Error retrieving array from JSON: \(error.localizedDescription)")
            return nil
        }
    }

    // Usage example




struct SaveView_Previews: PreviewProvider {
    static var previews: some View {
        SaveView()
    }
}

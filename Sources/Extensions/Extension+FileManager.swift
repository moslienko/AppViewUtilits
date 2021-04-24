//
//  Extension+FileManager.swift
//  
//
//  Created by Pavel Moslienko on 19.09.2020
//

import Foundation

public extension FileManager {
    
    func removeItemIfExisted(_ url: URL) {
        if self.fileExists(atPath: url.path) {
            do {
                try self.removeItem(atPath: url.path)
            } catch {
                print("Failed to delete file")
            }
        }
    }
    
    func clearDocumentsDirectory() {
        guard let documentsUrl = self.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        do {
            let fileURLs = try self.contentsOfDirectory(at: documentsUrl,
                                                        includingPropertiesForKeys: nil,
                                                        options: .skipsHiddenFiles)
            for fileURL in fileURLs {
                try? self.removeItem(at: fileURL)
            }
        } catch {
            print("Could not clear documents folder: \(error)")
        }
    }
    
    func clearTempFilesDirectory() {
        let tempFolderPath = NSTemporaryDirectory()
        
        do {
            let filePaths = try self.contentsOfDirectory(atPath: tempFolderPath)
            for filePath in filePaths {
                try? self.removeItem(atPath: tempFolderPath + filePath)
            }
        } catch {
            print("Could not clear temp folder: \(error)")
        }
    }
    
}

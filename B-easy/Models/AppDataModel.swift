import Foundation
class AppDataModel {

    static let shared = AppDataModel()

    let dataModel: DataModel

     init() {
        let db = SQLiteDatabase.shared
        dataModel = DataModel(database: db)
    }
}


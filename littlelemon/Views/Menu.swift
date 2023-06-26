//
//  Menu.swift
//  littlelemon
//
//  Created by Adolfo Calderon on 6/21/23.
//

import SwiftUI
import CoreData

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        VStack (spacing: 10) {
            Text("Little Lemon Application")
                .font(.title)
            Text("Chicago")
                .font(.headline)
            Text("Your local mediterranean Bistro")
            Spacer()
            FetchedObjects<Dish, AnyView>(content: { (dishes: [Dish]) in
                AnyView(
                    List(dishes, id: \.self) { dish in
                        HStack {
                            Text("\(dish.title ?? ""),  \(dish.price ?? "")")
                            AsyncImage(url: URL(string: dish.image ?? "")){ phase in
                                switch phase {
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50)
                                default:
                                    // Placeholder image in case of failure
                                    Image(systemName: "photo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 100)
                                }
                            }
                        }
                    })
                })
            }
        .onAppear(perform: {getMenuData()})

        }
    
    //MARK: - Helper Functions
    
    func getMenuData() {
        do {
            // Fetch all Dish entities
            let fetchRequest = NSFetchRequest<Dish>(entityName: "Dish")
            let dishes = try viewContext.fetch(fetchRequest)

            // If there are no dishes in Core Data, fetch them from the API
            if dishes.isEmpty {
                PersistenceController.shared.clear()

                let url = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
                let menuUrl = URL(string: url)!
                let task = URLSession.shared.dataTask(with: menuUrl){
                    data, response, error in
                    if let data = data {
                        do {
                            let fullMenu = try JSONDecoder().decode(MenuList.self, from: data)
                            for menuItem in fullMenu.menu {
                                let newDish = Dish(context: self.viewContext)
                                newDish.title = menuItem.title
                                newDish.price = menuItem.price
                                newDish.image = menuItem.image
                            }
                            do {
                                try self.viewContext.save()
                            } catch {
                                print("Failed to save dishes: \(error)")
                            }
                        } catch {
                            print("Failed to decode JSON: \(error)")
                        }
                    }
                }
                task.resume()
            }
        } catch {
            print("Failed to fetch dishes: \(error)")
        }
    }


}

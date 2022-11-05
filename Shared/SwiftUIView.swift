import SwiftUI

struct StockView: View {
    
    @ObservedObject var stockManager: StockManager
    
    var body: some View {
        NavigationView {
            Form {
                Section("Not done") {
                    TodoListDoneOrNotView(stockManager: stockManager, showDone: false)
                }
                Section("Done") {
                    TodoListDoneOrNotView(stockManager: stockManager, showDone: true)
                }
            }
            .navigationTitle("Todos")
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        StockView(stockManager: StockManager())
    }
}

struct TodoListDoneOrNotView: View {
    
    @ObservedObject var todoManager: StockManager
    var showDone: Bool
    
    var body: some View {
        ForEach($todoManager.stockItems ) { $todoItem in
            if showDone == stockItem.isDone {
                NavigationLink(destination: TodoDetailView(todoItem: $stockItem)) {
                    HStack {
                        Image(systemName: stockItem.isDone ? "checkmark.circle.fill" : "circle")
                            .onTapGesture {
                                withAnimation {
                                    stockItem.isDone.toggle()
                                }
                            }
                        Text(stockItem.title)
                    }
                }
            }
        }
    }
}


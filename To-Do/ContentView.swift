//
//  ContentView.swift
//  To-Do
//
//  Created by CCS038 on 01/02/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TaskView(viewModel: TaskViewModel())
    }
}

#Preview {
    ContentView()
}

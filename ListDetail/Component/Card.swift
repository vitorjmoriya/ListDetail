// Card.swift

import SwiftUI

struct Card: View {
    let viewModel: ViewModel
    let onTap: () -> Void

    init(viewModel: ViewModel, onTap: @escaping () -> Void) {
        self.viewModel = viewModel
        self.onTap = onTap
    }

    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 10) {
                Text(viewModel.title)
                    .font(.title2)
                    .foregroundStyle(.black)
                Text(viewModel.subtitle)
                    .font(.caption)
                    .foregroundStyle(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 10)
            .padding(.leading, 20)
            .background(Color.black.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

extension Card {
    struct ViewModel {
        let title: String
        let subtitle: String
    }
}

#Preview {
    Card(viewModel: .init(
        title: "Foobar",
        subtitle: "Lorem Ipsum"
    ), onTap: {})
    .padding(10)
}

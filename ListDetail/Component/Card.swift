// Card.swift

import SwiftUI

struct Card: View {
    let viewModel: ViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(viewModel.title)
                .font(.title2)
            Text(viewModel.subtitle)
                .font(.caption)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 10)
        .padding(.leading, 20)
        .background(Color.black.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
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
    ))
    .padding(10)
}

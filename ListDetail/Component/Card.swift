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
            renderContent()
        }
    }

    @ViewBuilder private func renderContent() -> some View {
        HStack(spacing: 10) {
            renderImage()
            renderInfo()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 10)
        .padding(.leading, 20)
        .background(Color.black.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }

    @ViewBuilder private func renderImage() -> some View {
        AsyncImage(url: viewModel.imageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            default:
                Image(systemName: "exclamationmark.triangle")
                    .foregroundStyle(.red)
            }
        }
        .clipShape(Circle())
        .frame(width: 50, height: 50)
    }

    @ViewBuilder private func renderInfo() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(viewModel.title)
                .font(.title2)
                .foregroundStyle(.black)
            Text(viewModel.subtitle)
                .font(.caption)
                .foregroundStyle(.black)
        }
    }
}

extension Card {
    struct ViewModel {
        let imageURL: URL?
        let title: String
        let subtitle: String
    }
}

#Preview {
    Card(viewModel: .init(
        imageURL: nil,
        title: "Foobar",
        subtitle: "Lorem Ipsum"
    ), onTap: {})
    .padding(10)
}

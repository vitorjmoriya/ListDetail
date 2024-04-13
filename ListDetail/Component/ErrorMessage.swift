// ErrorMessage.swift

import SwiftUI

struct ErrorMessage: View {
    let onRetry: (() -> Void)?

    var body: some View {
        VStack(spacing: 10) {

            Image(systemName: "exclamationmark.triangle")
                .foregroundStyle(.red)

            Text("Something went wrong")

            Button {
                onRetry?()
            } label: {
                Text("Try again")
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .foregroundStyle(.white)
            }
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

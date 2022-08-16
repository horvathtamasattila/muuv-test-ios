import SwiftUI

struct UserUpdateView: View {
    @Binding var name: String
    @Binding var job: String
    let cancelDidTap: () -> Void
    let updateDidTap: () -> Void
    init(
        name: Binding<String>,
        job: Binding<String>,
        cancelDidTap: @escaping () -> Void,
        updateDidTap: @escaping () -> Void
    ) {
        _name = name
        _job = job
        self.cancelDidTap = cancelDidTap
        self.updateDidTap = updateDidTap
    }

    var body: some View {
        ZStack {
            Color.blue
                .opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                TextField("update_name", text: $name)

                TextField("update_job", text: $job)
                Spacer()
                HStack {
                    MuuvButton(
                        action: cancelDidTap,
                        label: "cancel_button".localized,
                        color: .neutral
                    )

                    MuuvButton(
                        action: updateDidTap,
                        label: "update_button".localized,
                        color: .primaryGreen
                    )
                }
            }
            .padding(16)
            .frame(width: 204, height: 204)
            .background(Color.neutral.opacity(0.3))
            .cornerRadius(16)
        }
    }
}

struct UserUpdateView_Previews: PreviewProvider {
    static var previews: some View {
        UserUpdateView(
            name: .constant(""),
            job: .constant(""),
            cancelDidTap: {},
            updateDidTap: {}
        )
    }
}

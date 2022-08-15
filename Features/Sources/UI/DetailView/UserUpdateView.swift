import SwiftUI

struct UserUpdateView: View {
    @Binding var name: String
    @Binding var job: String
    init(
        name: Binding<String>,
        job: Binding<String>
    ) {
        _name = name
        _job = job
    }
    var body: some View {
        VStack(alignment: .leading) {
            TextField("update_name", text: $name)
            TextField("update_job", text: $job)
        }
        .padding(.horizontal, 16)
        .frame(width: 204, height: 204)
        .background(Color.neutral)
    }
}

struct UserUpdateView_Previews: PreviewProvider {
    static var previews: some View {
        UserUpdateView(name: .constant(""), job: .constant(""))
    }
}

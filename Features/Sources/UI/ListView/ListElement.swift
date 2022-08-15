import Kingfisher
import SwiftUI

struct ListElement: View {
    let name: String
    let avatar: URL?
    var body: some View {
        VStack {
            KFImage(avatar)
                .placeholder({ ProgressView() })
                .cornerRadius(8)
            Text(name)
                .font(.title2)
        }
    }
}

struct ListElement_Previews: PreviewProvider {
    static var previews: some View {
        ListElement(
            name: "John  Doe",
            avatar: URL(string: "https://reqres.in/img/faces/11-image.jpg")!
        )
    }
}

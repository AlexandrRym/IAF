import FirebaseAuth
import FirebaseFirestore
import Foundation

class AuthViewModel: ObservableObject {
    
    @Published var user = UserModel(name: "", email: "", password: "" , arrayWords: [""])
    
    @Published var userId: String {
        didSet {
            updateUserDefaults()
        }
    }
    
    @Published var isAuth: Bool {
        didSet {
            updateUserDefaults()
        }
    }
    
    init() {
        self.isAuth = UserDefaults.standard.bool(forKey: "isAuth")
        self.userId = UserDefaults.standard.string(forKey: "userId") ?? ""
    }
    
    func signIn(){
        Auth.auth().signIn(withEmail: user.email, password: user.password) { result , error in
            if let error = error {
                print("Error creating user: \(error.localizedDescription)")
                return
            }
            
            if let uid = result?.user.uid {
                self.isAuth = true
                self.userId = uid
            }
        }
    }
    
    func clearUserDefaults() {
        let defaults = UserDefaults.standard
        let domain = Bundle.main.bundleIdentifier ?? ""
        defaults.removePersistentDomain(forName: domain)
        defaults.synchronize()
        self.isAuth = false
    }
    
    func registerNewUser() {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { result, error in
            if let error = error {
                print("Error creating user: \(error.localizedDescription)")
                return
            }
            
            if let uid = result?.user.uid {
                self.isAuth = true
                self.userId = uid
                Firestore.firestore()
                    .collection("users")
                    .document(uid)
                    .setData([
                        "name": self.user.name,
                        "email": self.user.email,
                        "createdAt": Timestamp(),
                        "isValide": false,
                        "arrayWords": self.user.arrayWords
                    ], merge: true) { error in
                        if let error = error {
                            print("Error saving user data: \(error.localizedDescription)")
                        } else {
                            print("User data saved successfully")
                        }
                    }
            }
        }
    }
    
    private func updateUserDefaults() {
        print("Updating UserDefaults with isAuth: \(isAuth) and userId: \(userId)")
        UserDefaults.standard.set(isAuth, forKey: "isAuth")
        UserDefaults.standard.set(userId, forKey: "userId")
    }

}

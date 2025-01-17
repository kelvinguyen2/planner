import SwiftUI

struct LoginSignupView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Gradient Background
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.white]),
                               startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                Image("travelBackground")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.3)
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    Spacer()
                    
                    Image(systemName: "mappin.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5)
                    
                    Text("Welcome to Plannr!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .multilineTextAlignment(.center)
                    
                    Text("""
Let’s get started by creating your personalized itinerary.
We’ll help you organize your trip and make it unforgettable.
""")
                        .font(.custom("HelveticaNeue-Bold", size: 14))
                        .foregroundColor(.black.opacity(0.7))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        NavigationLink(destination: LoginView()) {
                            Text("Log In")
                                .fontWeight(.bold)
                                .frame(width: 200, height: 50)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(25)
                                .shadow(radius: 5)
                        }
                        
                        NavigationLink(destination: SignupView()) {
                            Text("Sign Up")
                                .fontWeight(.bold)
                                .frame(width: 200, height: 50)
                                .background(Color.white)
                                .foregroundColor(.blue)
                                .cornerRadius(25)
                                .shadow(radius: 5)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
        }
    }
}

struct LoginSignupView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSignupView()
    }
}

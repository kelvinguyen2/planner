//
//  AgreementPageView.swift
//  planner
//
//  Created by Kelvin Nguyen on 1/17/25.
//

import SwiftUI
struct AgreementPageView: View {
    @Binding var hasReviewedTerms: Bool
    @Environment(\.presentationMode) var presentationMode
    @State private var hasScrolledToEnd = false
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [Color.cyan.opacity(0.3), Color.white]),
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                // Title
                Text("Terms and Conditions")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.top, 20)
                // Scrollable Content
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Plannr - Terms and Conditions")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("Effective Date: January 5th, 2025\nLast Updated: January 5th, 2025")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        Text("""
Welcome to Plannr! These Terms and Conditions (“Terms”) constitute a legally binding agreement between you (“User,” “you,” or “your”) and Plannr (“we,” “us,” or “our”) regarding the use of our services (“Services”) through the Plannr mobile application (“App”). By accessing, downloading, or using the App, you agree to comply with these Terms. If you do not agree, you must cease using the App immediately.
""")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("1. Acceptance of Terms")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("""
• By clicking “I Agree” during registration or by continuing to use the App, you confirm that:
  - You have read and understood these Terms.
  - You agree to be bound by these Terms and our Privacy Policy [insert link].
• If you are under 18 years of age, you must obtain parental or legal guardian consent before using the App.
""")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("2. User Responsibilities")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("""
• Account Registration:
  - You agree to provide accurate, complete, and current information when creating an account.
  - You are responsible for maintaining the confidentiality of your account credentials.
• Prohibited Activities:
  - You agree not to use the App for unlawful purposes, to distribute harmful content, or to engage in behavior that violates these Terms or applicable laws.
  - Unauthorized access, reverse-engineering, or hacking of the App is strictly prohibited.
""")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("3. Privacy and Data Collection")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("""
• Privacy Compliance:
  - Your use of the App is subject to our Privacy Policy [insert link], which outlines how we collect, use, and store your data.
• Consent to Data Sharing:
  - By using collaborative features (e.g., itinerary sharing), you consent to the sharing of data with designated participants.
""")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("4. Services")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("""
• Nature of Services:
  - Plannr provides tools for itinerary creation, travel expense management, and recommendations. These are for informational purposes only.
  - Plannr is not a travel agency and does not guarantee the availability or quality of third-party services or locations.
• No Warranty:
  - The App and Services are provided on an “as-is” and “as-available” basis without warranties of any kind, either express or implied.
""")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("5. Payment and Subscription")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("""
• Subscription Services:
  - Some features are available through subscription plans. By subscribing, you authorize Plannr to charge your payment method for recurring fees until cancellation.
• Refund Policy:
  - Refunds are issued only as required by applicable law.
• Free Trials:
  - Free trials may convert to paid subscriptions unless canceled before the trial ends.
""")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("6. Limitations of Liability")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("""
• General Disclaimer:
  - Plannr is not liable for any loss, damage, or injury resulting from reliance on the App, missed travel arrangements, or disruptions caused by third parties.
• Force Majeure:
  - Plannr is not responsible for delays or failures caused by events beyond its reasonable control, including natural disasters, internet outages, or government actions.
• Liability Cap:
  - To the fullest extent permitted by law, Plannr’s liability to you for any claims arising from your use of the App is limited to the amount you have paid (if any) in the last 12 months.
""")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("7. Intellectual Property")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("""
All intellectual property rights in the App, including logos, designs, and software, are owned by Plannr. You may not copy, distribute, or reverse-engineer the App without prior written consent.
""")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("8. Termination")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("""
• Plannr reserves the right to terminate or suspend your account at its sole discretion for violations of these Terms or misuse of the App.
• Upon termination, your access to the App will cease, but these Terms will survive termination to the extent necessary to enforce rights or obligations.
""")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("9. Dispute Resolution")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("""
• Governing Law:
  - These Terms are governed by the laws of [Insert Jurisdiction].
• Arbitration:
  - Any disputes will be resolved through binding arbitration in [Insert City], under the rules of [Insert Arbitration Provider], except where prohibited by law.
• Class Action Waiver:
  - You agree to resolve disputes on an individual basis and waive your right to participate in a class action or representative proceeding.
""")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("10. Contact Information")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("""
For questions or concerns regarding these Terms, please contact us:
• Email: support@plannr7@gmail.com
• Address: [Insert Company Address]
""")
                            .font(.body)
                            .foregroundColor(.black)
                        // Invisible Trigger to Detect End of Scroll
                        Color.clear
                            .frame(height: 1)
                            .onAppear {
                                hasScrolledToEnd = true
                            }
                    }
                    .padding()
                }
                // Accept Button
                Button(action: {
                    hasReviewedTerms = true
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Accept Terms")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(hasScrolledToEnd ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }
                .disabled(!hasScrolledToEnd)
                .padding(.horizontal, 20)
            }
        }
    }
}

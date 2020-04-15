//	The MIT License (MIT)
//
//	Copyright (c) 2017 Eric Conner
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in all
//	copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//	SOFTWARE.

import Foundation
import StoreKit

public class SwiftyReview {
	/// User default keys
	private enum UserDefaultKey: String {
		case requestCounter	= "SwiftyReviewRequestCounterKey"
		case alertsThisYear	= "SwiftyReviewThisYearKey"
		case savedMonth		= "SwiftyReviewSavedMonthKey"
		case savedYear		= "SwiftyReviewSavedYearKey"
	}

	/// Request counter
	private static var requestCounter: Int {
		get { return UserDefaults.standard.integer(forKey: UserDefaultKey.requestCounter.rawValue) }
		set { UserDefaults.standard.set(newValue, forKey: UserDefaultKey.requestCounter.rawValue) }
	}

	/// Alerts shown this year
	private static var alertsThisYear: Int {
		get { return UserDefaults.standard.integer(forKey: UserDefaultKey.alertsThisYear.rawValue) }
		set { UserDefaults.standard.set(newValue, forKey: UserDefaultKey.alertsThisYear.rawValue) }
	}

	/// Saved month
	private static var savedMonth: Int {
		get { return UserDefaults.standard.integer(forKey: UserDefaultKey.savedMonth.rawValue) }
		set { UserDefaults.standard.set(newValue, forKey: UserDefaultKey.savedMonth.rawValue) }
	}

	/// Saved year
	private static var savedYear: Int {
		get { return UserDefaults.standard.integer(forKey: UserDefaultKey.savedYear.rawValue) }
		set { UserDefaults.standard.set(newValue, forKey: UserDefaultKey.savedYear.rawValue) }
	}

	/// Request review
	/// - parameter requestsBeforeAlert: The number of requestReviews before an alert is shown. Default is 15.
	public class func requestReview(requestsBeforeAlert: Int = 15) {
		requestCounter += 1

		#if os(tvOS)
			print("[SwiftyReview] - tvOS is not currently supported")
		#elseif os(OSX)
			if canShowReview(requestsBeforeAlert: requestsBeforeAlert) {
				print("[SwiftyReview] - Review requested")

				if #available(macOS 10.14, *) {
					//SKStoreReviewController.requestReview()
				} else {
					print("[SwiftyReview] - Not supported on this macOS version")
				}
			}
		#elseif os(iOS)
			if canShowReview(requestsBeforeAlert: requestsBeforeAlert) {
				print("[SwiftyReview] - Review requested")

				if #available(iOS 10.3, *) {
					SKStoreReviewController.requestReview()
				} else {
					print("[SwiftyReview] - Not supported on this iOS version")
				}
			}
		#endif
	}

	/// Determine if the review dialog can be shown.
	private class func canShowReview(requestsBeforeAlert: Int) -> Bool {
		// Get date
		let date = Date()
		let formatter = DateFormatter()
		formatter.locale = Locale(identifier: "en_US")
		formatter.dateFormat = "MM.yyyy"
		let dateResult = formatter.string(from: date)

		// Get month string
		guard let monthString = dateResult.components(separatedBy: ".").first else {
			print("[SwiftyReview] - Month String error")
			return false
		}

		// Get month int
		guard let month = Int(monthString) else {
			print("[SwiftyReview] - Month Int error")
			return false
		}

		// Get year string
		guard let yearString = dateResult.components(separatedBy: ".").last else {
			print("[SwiftyReview] - Year String error")
			return false
		}

		// Get year int
		guard let year = Int(yearString) else {
			print("[SwiftyReview] - Year Int error")
			return false
		}

		// Update saved month/year if never set before
		if savedMonth == 0 {
			savedMonth = month
		}

		if savedYear == 0 {
			savedYear = year
		}

		// If year has changed reset everything
		if year > savedYear {
			savedYear = year
			alertsThisYear = 0
			requestCounter = 0
		}

		print("[SwiftyReview]")
		print("\tRequest count: \(requestCounter)/\(requestsBeforeAlert)")
		print("\tAlerts this year: \(alertsThisYear)")
		print("\tDate: \(savedMonth)-\(savedYear)")

		// Check that max number of 3 alerts shown per year is not reached
		guard alertsThisYear < 3 else {
			return false
		}

		// Show alert if needed
		if requestCounter == requestsBeforeAlert {
			alertsThisYear += 1
			savedMonth = month
			return true
		} else if requestCounter > requestsBeforeAlert, month >= (savedMonth + 4) {
			alertsThisYear += 1
			savedMonth = month
			return true
		}

		// No alert is needed to show
		return false
	}
}

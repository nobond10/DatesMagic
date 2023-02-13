import Foundation

public enum DMPeriod {
    case second(Int)
    case minute(Int)
    case hour(Int)
    case day(Int)
    case week(Int)
    case month(Int)
    case year(Int)
}

public enum DMStartPeriod {
    case minute
    case hour
    case day
    case week
    case month
    case year
}

private enum Constants {
    static let secondsInMinute = 60
    static let secondsInHour = 60 * 60
    static let secondsInDay = 60 * 60 * 24
    static let secondsInWeek = 60 * 60 * 24 * 7
}

public extension Date {
    func add(period: DMPeriod) -> Date {
        switch period {
        case .second(let countOfSeconds):
            return self.addingTimeInterval(TimeInterval(countOfSeconds))
        case .minute(let countOfMinutes):
            return self.addingTimeInterval(TimeInterval(countOfMinutes * Constants.secondsInMinute))
        case .hour(let countOfHours):
            return self.addingTimeInterval(TimeInterval(countOfHours * Constants.secondsInHour))
        case .day(let countOfDays):
            return self.addingTimeInterval(TimeInterval(countOfDays * Constants.secondsInDay))
        case .week(let countOfWeeks):
            return self.addingTimeInterval(TimeInterval(countOfWeeks * Constants.secondsInWeek))
        case .month(let countOfMonths):
            return Calendar.current.date(byAdding: .month, value: countOfMonths, to: self)!
        case .year(let countOfYears):
            return Calendar.current.date(byAdding: .year, value: countOfYears, to: self)!
        }
    }
}

public extension Date {
    func startOf(period: DMStartPeriod) -> Date {
        switch period {
        case .minute:
            let components = Calendar.current.dateComponents([.hour, .minute], from: self)
            return Calendar.current.date(bySettingHour: components.hour!, minute: components.minute!, second: 0, of: self)!
        case .hour:
            let hour = Calendar.current.component(.hour, from: self)
            return Calendar.current.date(bySettingHour: hour, minute: 0, second: 0, of: self)!
        case .day:
            return Calendar.current.startOfDay(for: self)
        case .week:
            return Calendar.current.dateComponents([.calendar, .yearForWeekOfYear, .weekOfYear], from: self).date!
        case .month:
            return Calendar.current.dateComponents([.calendar, .year, .month], from: self).date!
        case .year:
            return Calendar.current.dateComponents([.calendar, .year], from: self).date!
        }
        
    }
}

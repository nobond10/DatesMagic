import XCTest
@testable import DatesMagic

final class DatesMagicTests: XCTestCase {
    enum Constants {
        static let year = 2022
        static let month = 2
        static let day = 14
        static let hour = 20
        static let minute = 19
        static let seconds = 30
    }
    let calendar = Calendar.current
    lazy var date: Date = {
        let components = DateComponents(calendar: .current, year: Constants.year, month: Constants.month, day: Constants.day, hour: Constants.hour, minute: Constants.minute, second: Constants.seconds)
        return self.calendar.date(from: components)!
    }()
    
    // MARK: seconds
    func testWhenAddPositiveSecondsWithoutOverflow_ThenTheyWillBeAddedRighly() throws {
        // when
        let secondsToAdd = 4
        let newDate = date.add(period: .second(secondsToAdd))
        
        //then
        let components = DateComponents(calendar: .current, year: Constants.year, month: Constants.month, day: Constants.day, hour: Constants.hour, minute: Constants.minute, second: Constants.seconds + secondsToAdd)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }

    func testWhenAddPositiveSecondsWithOverflow_ThenTheyWillBeAddedRighly() throws {
        // when
        let secondsToAdd = 59
        let newDate = date.add(period: .second(secondsToAdd))
        
        //then
        let secondsNew = (Constants.seconds + secondsToAdd) - 60
        let minuteAddition = Constants.seconds + secondsToAdd > 60 ? 1 : 0
        let components = DateComponents(calendar: .current, year: Constants.year, month: Constants.month, day: Constants.day, hour: Constants.hour, minute: Constants.minute + minuteAddition, second: secondsNew)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }

    func testWhenAddNegativeSecondsWithoutOverflow_ThenTheyWillBeAddedRighly() throws {
        // when
        let secondsToAdd = -4
        let newDate = date.add(period: .second(secondsToAdd))
        
        //then
        let components = DateComponents(calendar: .current, year: Constants.year, month: Constants.month, day: Constants.day, hour: Constants.hour, minute: Constants.minute, second: Constants.seconds + secondsToAdd)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }

    func testWhenAddNegativeSecondsWithOverflow_ThenTheyWillBeAddedRighly() throws {
        // when
        let secondsToAdd = -59
        let newDate = date.add(period: .second(secondsToAdd))
        
        //then
        let secondsNew = (Constants.seconds + secondsToAdd) + 60
        let minuteAddition = Constants.seconds + secondsToAdd < 0 ? -1 : 0
        let components = DateComponents(calendar: .current, year: Constants.year, month: Constants.month, day: Constants.day, hour: Constants.hour, minute: Constants.minute + minuteAddition, second: secondsNew)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }

    // MARK: minutes
    func testWhenAddPositiveMinutesWithoutOverflow_ThenTheyWillBeAddedRighly() throws {
        // when
        let minutesToAdd = 4
        let newDate = date.add(period: .minute(minutesToAdd))
        
        //then
        let components = DateComponents(calendar: .current, year: Constants.year, month: Constants.month, day: Constants.day, hour: Constants.hour, minute: Constants.minute + minutesToAdd, second: Constants.seconds)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }
    
    func testWhenAddPositiveMinutesWithOverflow_ThenTheyWillBeAddedRighly() throws {
        // when
        let minutesToAdd = 59
        let newDate = date.add(period: .minute(minutesToAdd))
        
        //then
        let minutesNew = (Constants.minute + minutesToAdd) - 60
        let hourAddition = Constants.minute + minutesToAdd > 60 ? 1 : 0
        let components = DateComponents(calendar: .current, year: Constants.year, month: Constants.month, day: Constants.day, hour: Constants.hour + hourAddition, minute: minutesNew, second: Constants.seconds)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }

    func testWhenAddNegativeMinutesWithoutOverflow_ThenTheyWillBeAddedRighly() throws {
        // when
        let minutesToAdd = -4
        let newDate = date.add(period: .minute(minutesToAdd))
        
        //then
        let components = DateComponents(calendar: .current, year: Constants.year, month: Constants.month, day: Constants.day, hour: Constants.hour, minute: Constants.minute + minutesToAdd, second: Constants.seconds)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }
    
    func testWhenAddNegativeMinutesWithOverflow_ThenTheyWillBeAddedRighly() throws {
        // when
        let minutesToAdd = -59
        let newDate = date.add(period: .minute(minutesToAdd))
        
        //then
        let minutesNew = (Constants.minute + minutesToAdd) + 60
        let hourAddition = Constants.minute + minutesToAdd < 0 ? -1 : 0
        let components = DateComponents(calendar: .current, year: Constants.year, month: Constants.month, day: Constants.day, hour: Constants.hour + hourAddition, minute: minutesNew, second: Constants.seconds)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }

    // MARK: hour
    func testWhenAddPositiveHoursWithoutOverflow_ThenTheyWillBeAddedRighly() throws {
        // when
        let hoursToAdd = 2
        let newDate = date.add(period: .hour(hoursToAdd))
        
        //then
        let components = DateComponents(calendar: .current, year: Constants.year, month: Constants.month, day: Constants.day, hour: Constants.hour + hoursToAdd, minute: Constants.minute, second: Constants.seconds)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }
    
    func testWhenAddPositiveHoursWithOverflow_ThenTheyWillBeAddedRighly() throws {
        // when
        let hoursToAdd = 25
        let newDate = date.add(period: .hour(hoursToAdd))
        
        //then
        let hoursNew = (Constants.hour + hoursToAdd) - 24
        let daysAddition = Constants.hour + hoursToAdd > 24 ? 1 : 0
        let components = DateComponents(calendar: .current, year: Constants.year, month: Constants.month, day: Constants.day + daysAddition, hour: hoursNew, minute: Constants.minute, second: Constants.seconds)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }

    func testWhenAddNegativeHoursWithoutOverflow_ThenTheyWillBeAddedRighly() throws {
        // when
        let hoursToAdd = -2
        let newDate = date.add(period: .hour(hoursToAdd))
        
        //then
        let components = DateComponents(calendar: .current, year: Constants.year, month: Constants.month, day: Constants.day, hour: Constants.hour + hoursToAdd, minute: Constants.minute, second: Constants.seconds)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }
    
    func testWhenAddNegativeHoursWithOverflow_ThenTheyWillBeAddedRighly() throws {
        // when
        let hoursToAdd = -25
        let newDate = date.add(period: .hour(hoursToAdd))
        
        //then
        let hoursNew = (Constants.hour + hoursToAdd) + 24
        let daysAddition = Constants.hour + hoursToAdd < 0 ? -1 : 0
        let components = DateComponents(calendar: .current, year: Constants.year, month: Constants.month, day: Constants.day + daysAddition, hour: hoursNew, minute: Constants.minute, second: Constants.seconds)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }

    // MARK: day
    func testWhenAddPositiveDayWithoutOverflow_ThenTheyWillBeAddedRighly() throws {
        // when
        let daysToAdd = 2
        let newDate = date.add(period: .day(daysToAdd))
        
        //then
        let components = DateComponents(calendar: .current, year: Constants.year, month: Constants.month, day: Constants.day + daysToAdd, hour: Constants.hour, minute: Constants.minute, second: Constants.seconds)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }

    func testWhenAddPositiveDayWithOverflow_ThenTheyWillBeAddedRighly() throws {
        // when
        let daysToAdd = 30
        let newDate = date.add(period: .day(daysToAdd))
        
        //then
        let dateForCompare = calendar.date(byAdding: .day, value: daysToAdd, to: date)
        XCTAssertEqual(newDate, dateForCompare)
    }

    func testWhenAddNegativeDayWithoutOverflow_ThenTheyWillBeAddedRighly() throws {
        // when
        let daysToAdd = -2
        let newDate = date.add(period: .day(daysToAdd))
        
        //then
        let components = DateComponents(calendar: .current, year: Constants.year, month: Constants.month, day: Constants.day + daysToAdd, hour: Constants.hour, minute: Constants.minute, second: Constants.seconds)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }
    
    func testWhenAddNegativeDayWithOverflow_ThenTheyWillBeAddedRighly() throws {
        // when
        let daysToAdd = -30
        let newDate = date.add(period: .day(daysToAdd))
        
        //then
        let dateForCompare = calendar.date(byAdding: .day, value: daysToAdd, to: date)
        XCTAssertEqual(newDate, dateForCompare)
    }

    //MARK: week
    func testWhenAddWeek_ThenTheyWillBeAddedRighly() throws {
        // when
        let weeksToAdd = 2
        let newDate = date.add(period: .week(weeksToAdd))
        
        //then
        let dateForCompare = calendar.date(byAdding: .day, value: 14, to: date)
        XCTAssertEqual(newDate, dateForCompare)
    }

    func testWhenAddNegativeWeek_ThenTheyWillBeAddedRighly() throws {
        // when
        let weeksToAdd = -2
        let newDate = date.add(period: .week(weeksToAdd))
        
        //then
        let dateForCompare = calendar.date(byAdding: .day, value: -14, to: date)
        XCTAssertEqual(newDate, dateForCompare)
    }

    //MARK: month
    func testWhenAddPositiveMonthWithoutOverflow_ThenTheyWillBeAddedRighly() throws {
        // when
        let monthsToAdd = 4
        let newDate = date.add(period: .month(monthsToAdd))
        
        //then
        let components = DateComponents(calendar: .current, year: Constants.year, month: Constants.month + monthsToAdd, day: Constants.day, hour: Constants.hour, minute: Constants.minute, second: Constants.seconds)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }

    func testWhenAddPositiveMonthWithOverflow_ThenTheyWillBeAddedRighly() throws {
        // when
        let monthsToAdd = 14
        let newDate = date.add(period: .month(monthsToAdd))
        
        //then
        let components = DateComponents(calendar: .current, year: Constants.year + 1, month: Constants.month + 2, day: Constants.day, hour: Constants.hour, minute: Constants.minute, second: Constants.seconds)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }

    func testWhenAddNegativeMonthWithoutOverflow_ThenTheyWillBeAddedRighly() throws {
        // when
        let monthsToAdd = -1
        let newDate = date.add(period: .month(monthsToAdd))
        
        //then
        let components = DateComponents(calendar: .current, year: Constants.year, month: Constants.month + monthsToAdd, day: Constants.day, hour: Constants.hour, minute: Constants.minute, second: Constants.seconds)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }
    
    func testWhenAddNegativeMonthWithOverflow_ThenTheyWillBeAddedRighly() throws {
        // when
        let monthsToAdd = -14
        let newDate = date.add(period: .month(monthsToAdd))
        
        //then
        let components = DateComponents(calendar: .current, year: Constants.year - 1, month: Constants.month - 2, day: Constants.day, hour: Constants.hour, minute: Constants.minute, second: Constants.seconds)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }

    //MARK: year
    func testWhenAddYear_ThenTheyWillBeAddedRighly() throws {
        // when
        let yearsToAdd = 2
        let newDate = date.add(period: .year(yearsToAdd))
        
        //then
        let components = DateComponents(calendar: .current, year: Constants.year + yearsToAdd, month: Constants.month, day: Constants.day, hour: Constants.hour, minute: Constants.minute, second: Constants.seconds)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }

    func testWhenAddNegativeYear_ThenTheyWillBeAddedRighly() throws {
        // when
        let yearsToAdd = -2
        let newDate = date.add(period: .year(yearsToAdd))
        
        //then
        let components = DateComponents(calendar: .current, year: Constants.year + yearsToAdd, month: Constants.month, day: Constants.day, hour: Constants.hour, minute: Constants.minute, second: Constants.seconds)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }

    //MARK: Start
    func testWhenStartMinute_thenSecondsShouldBe0() {
        // when
        let newDate = date.startOf(period: .minute)

        //then
        let components = DateComponents(calendar: .current, year: Constants.year, month: Constants.month, day: Constants.day, hour: Constants.hour, minute: Constants.minute, second: 0)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }

    func testWhenStartHour_thenSecondsAndMinutesShouldBe0() {
        // when
        let newDate = date.startOf(period: .hour)
        
        //then
        let components = DateComponents(calendar: .current, year: Constants.year, month: Constants.month, day: Constants.day, hour: Constants.hour, minute: 0, second: 0)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }

    func testWhenStartDay_thenSecondsMinutesHoursShouldBe0() {
        // when
        let newDate = date.startOf(period: .day)
        
        //then
        let components = DateComponents(calendar: .current, year: Constants.year, month: Constants.month, day: Constants.day, hour: 0, minute: 0, second: 0)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }

    func testWhenStartWeek_thenSecondsAndMinutesShouldBe0() {
        // when
        let newDate = date.startOf(period: .week)
        
        //then
        let components = DateComponents(calendar: .current, year: Constants.year, month: Constants.month, day: 13, hour: 0, minute: 0, second: 0)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }

    func testWhenStartMonth_thenSecondsMinutesHoursShouldBe0DayShouldBe1() {
        // when
        let newDate = date.startOf(period: .month)
        
        //then
        let components = DateComponents(calendar: .current, year: Constants.year, month: Constants.month, day: 1, hour: 0, minute: 0, second: 0)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }

    func testWhenStartYear_thenHoursSecondsAndMinutesShouldBe0DayAndMonthShouldBe1() {
        // when
        let newDate = date.startOf(period: .year)
        
        //then
        let components = DateComponents(calendar: .current, year: Constants.year, month: 1, day: 1, hour: 0, minute: 0, second: 0)
        let dateForCompare = calendar.date(from: components)
        XCTAssertEqual(newDate, dateForCompare)
    }
}

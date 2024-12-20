//
//  CalendarView.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/19.
//

import UIKit

@available(iOS 16.0, *)
class CalendarViewVC: UIViewController, UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
    
    var calendarView: UICalendarView! = nil
    var decorations: [Date?: UICalendarView.Decoration] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the calendar view.
        calendarView = UICalendarView(frame: .init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height - 300))
        calendarView.delegate = self
        // Create an instance of the Gregorian calendar.
        let gregorianCalendar = Calendar(identifier: .gregorian)
        
        // Set the calendar displayed by the view.
        calendarView.calendar = gregorianCalendar
        
        // Set the calendar view's locale.
        calendarView.locale = Locale(identifier: "zh_TW")
        
        // Set the font design to the rounded system font.
        calendarView.fontDesign = .rounded
        
        calendarView.visibleDateComponents = DateComponents(
            calendar: gregorianCalendar,
            year: 2024,
            month: 2,
            day: 1
        )
        
        // Specify the starting date.
        let fromDateComponents = DateComponents(
            calendar: gregorianCalendar,
            year: 2024,
            month: 1,
            day: 1
        )
        
        
        // Specify the ending date.
        let toDateComponents = DateComponents(
            calendar: gregorianCalendar,
            year: 2024,
            month: 12,
            day: 31
        )
        
        
        // Verify that you have valid start and end dates.
        guard let fromDate = fromDateComponents.date, let toDate = toDateComponents.date else {
            // Handle the error here.
            fatalError("Invalid date components: \(fromDateComponents) and \(toDateComponents)")
        }
        
        
        // Set the range of dates that people can view.
        let calendarViewDateRange = DateInterval(start: fromDate, end: toDate)
        calendarView.availableDateRange = calendarViewDateRange
        
        
        
        let valentinesDay = DateComponents(
            calendar: Calendar(identifier: .gregorian),
            year: 2024,
            month: 2,
            day: 14
        )
        
        // Create a calendar decoration for Valentine's day.
        let heart = UICalendarView.Decoration.image(
            UIImage(systemName: "heart.fill"),
            color: UIColor.red,
            size: .large
        )
        
        decorations = [valentinesDay.date: heart]
        
        
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        calendarView.selectionBehavior = dateSelection
        
        let date = DateComponents(
            calendar: Calendar(identifier: .gregorian),
            year: 2024,
            month: 2,
            day: 14
        )


        // Programmatically set the selected date.
        dateSelection.selectedDate = date
        
        view.addSubview(calendarView)
        
    }
    
    // Control whether a person can select a given date.
    func dateSelection(
        _ selection: UICalendarSelectionSingleDate,
        canSelectDate dateComponents: DateComponents?
    ) -> Bool {
        // Allow all dates by returning true if the selection parameter contains
        // a date component instance. Prevent someone from clearing the selection
        // by returning false if the selection parameter is nil.
        return dateComponents != nil
    }


    // Respond when someone selects or deselects a date. If they selected
    // a date, the dateComponent parameter contains the selected date. If they
    // cleared the selection, the parameter is nil.
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        // Update your app.
    }
    
    // Return a decoration (if any) for the specified day.
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        // Get a copy of the date components that only contain
        // the calendar, year, month, and day.
        let day = DateComponents(
            calendar: dateComponents.calendar,
            year: dateComponents.year,
            month: dateComponents.month,
            day: dateComponents.day
        )
        
        // Return any decoration saved for that date.
        return decorations[day.date]
    }
    
    // Add a decoration to the specified date.
    func add(decoration: UICalendarView.Decoration, on date: Date) {
        // Get the calendar, year, month, and day date components for
        // the specified date.
        let dateComponents = Calendar.current.dateComponents(
            [.calendar, .year, .month, .day ],
            from: date
        )
        
        // Add the decoration to the decorations dictionary.
        decorations[dateComponents.date] = decoration
        
        // Reload the calendar view's decorations.
        if let calendarView {
            calendarView.reloadDecorations(
                forDateComponents: [dateComponents],
                animated: true
            )
        }
    }

}

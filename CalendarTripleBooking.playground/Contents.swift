
class MyCalendarTwo {
    
    var calendar :[(Int,Int)] = []
    var overlap :[(Int, Int)] = []
    
    func book(_ start: Int, _ end: Int) -> Bool {
        if start < 0 || end < 0 || start > end {
            return false
        }
        
        for (overlapStart, overlapEnd ) in overlap {
            if overlapStart < end && overlapEnd > start {
                return false
            }
        }
        
        for (calendarStart, calendarEnd) in calendar {
            if calendarStart < end && calendarEnd > start {
                overlap.append((max(calendarStart, start), min(calendarEnd, end)))
            }
        }
        
        calendar.append((start, end))
        return true
    }
}

/**
 * Your MyCalendarTwo object will be instantiated and called as such:
 * let obj = MyCalendarTwo()
 * let ret_1: Bool = obj.book(start, end)
 */

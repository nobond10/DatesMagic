# DatesMagic

Date extension that allow to add some count of seconds/minutes/days/weeks/months/years to some date.

```
	let date = Date()
	let date1 = date.add(period: .second(10)) // add 10 seconds
	let date1 = date.add(period: .day(-10)) // subtract 10 days
```

Also you can receive start date of any period minute/hour/day/week/month/year from some date

```
	let date = Date()
	let startOfDay = date.startOf(period: .day)
	let startOfYear = date.startOf(period: .year)
```

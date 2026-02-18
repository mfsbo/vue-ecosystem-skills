---
number: 45
title: Chart for timestamp, way of display
category: Q&A
created: 2024-07-02
url: "https://github.com/graphieros/vue-data-ui/discussions/45"
upvotes: 1
comments: 1
answered: true
---

# Chart for timestamp, way of display

For the time-stamp in Chart with x-axis,
Please see the time like "13:20:00" that time is over 12 oclock


Time display  for 13:10:10
1. 01:10:10 AM
2. 13:10:10
Hope you understand what I mean.

Thanks


---

## Accepted Answer

**@graphieros** [maintainer]:

Hi @manulsan ^^

There is no formatting made by the library for timestamps, it only displays the strings you pass to the config.

I recommend you use your own formatting function (or use a library for that).
Here is a function you can use to format your time:

```js
function convertTimestampToAmPm(timestamp) {
    const timestampRegex = /^(\d{4})\/(\d{2})\/(\d{2}) (\d{2}):(\d{2}):(\d{2})$/;

    const match = timestamp.match(timestampRegex);
    if (!match) {
        return "Invalid timestamp format. Please use 'YYYY/MM/DD HH:MM:SS'.";
    }

    const [_, year, month, day, hoursStr, minutesStr, secondsStr] = match;

    const date = new Date(`${year}-${month}-${day}T${hoursStr}:${minutesStr}:${secondsStr}`);

    let hours = date.getHours();
    const minutes = date.getMinutes();
    const seconds = date.getSeconds();

    const amPm = hours >= 12 ? 'PM' : 'AM';

    hours = hours % 12 || 12;

    const formattedMinutes = minutes < 10 ? '0' + minutes : minutes;
    const formattedSeconds = seconds < 10 ? '0' + seconds : seconds;

    const formattedTime = `${hours}:${formattedMinutes}:${formattedSeconds} ${amPm}`;

    return formattedTime;
}

console.log(convertTimestampToAmPm('2024/07/02 13:17:06')) // Result: "1:17:06 PM"
```...
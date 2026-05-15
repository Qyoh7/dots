#!/usr/bin/env python3
import json
from datetime import datetime, timedelta
import os
import sys

# You can dynamically set this via environment, CLI, etc.
current_day = os.getenv("SCHEDULE_DAY", "A")

schedule_templates = {
    "A": [
        ("1st Period", "08:55", "10:04"),
        ("Passing", "10:04", "10:10"),
        ("3rd Period", "10:10", "11:19"),
        ("Passing", "11:19", "11:25"),
        ("4th Period", "11:25", "12:34"),
        ("Lunch", "12:34", "1:18"),
        ("Passing", "1:18", "1:24"),
        ("6th Period", "1:24", "2:33"),
        ("Passing", "2:33", "2:39"),
        ("7th Period", "2:39", "3:48"),
    ],

    "B": [
        ("2nd Period", "08:55", "10:04"),
        ("Passing", "10:04", "10:10"),
        ("3rd Period", "10:10", "11:19"),
        ("Passing", "11:19", "11:25"),
        ("5th Period", "11:25", "12:34"),
        ("Lunch", "12:34", "1:18"),
        ("Passing", "1:18", "1:24"),
        ("6th Period", "1:24", "2:33"),
        ("Passing", "2:33", "2:39"),
        ("7th Period", "2:39", "3:48"),
    ],
    "C": [
        ("1st Period", "08:55", "10:04"),
        ("Passing", "10:04", "10:10"),
        ("2nd Period", "10:10", "11:19"),
        ("Passing", "11:19", "11:25"),
        ("4th Period", "11:25", "12:34"),
        ("Lunch", "12:34", "1:18"),
        ("Passing", "1:18", "1:24"),
        ("5th Period", "1:24", "2:33"),
        ("Passing", "2:33", "2:39"),
        ("7th Period", "2:39", "3:48"),
    ],
    "A_WED": [
        ("1st Period", "09:05", "10:13"),
        ("Passing", "10:13", "10:19"),
        ("3rd Period", "10:19", "11:27"),
        ("Passing", "11:27", "11:33"),
        ("4th Period", "11:33", "12:41"),
        ("Lunch", "12:41", "1:20"),
        ("Passing", "1:20", "1:26"),
        ("6th Period", "1:26", "2:34"),
        ("Passing", "2:34", "2:40"),
        ("Free Period", "2:40", "3:48"),
        ],
    "B_WED": [
        ("2st Period", "09:05", "10:13"),
        ("Passing", "10:13", "10:19"),
        ("3rd Period", "10:19", "11:27"),
        ("Passing", "11:27", "11:33"),
        ("5th Period", "11:33", "12:41"),
        ("Lunch", "12:41", "1:20"),
        ("Passing", "1:20", "1:26"),
        ("6th Period", "1:26", "2:34"),
        ("Passing", "2:34", "2:40"),
        ("7th Period", "2:40", "3:48"),
        ],
    "C_WED": [
        ("1st Period", "09:05", "10:13"),
        ("Passing", "10:13", "10:19"),
        ("2nd Period", "10:19", "11:27"),
        ("Passing", "11:27", "11:33"),
        ("4th Period", "11:33", "12:41"),
        ("Lunch", "12:41", "1:20"),
        ("Passing", "1:20", "1:26"),
        ("5th Period", "1:26", "2:34"),
        ("Passing", "2:34", "2:40"),
        ("7th Period", "2:40", "3:48"),
        ]
}

def get_current_period(schedule):
    now = datetime.now()

    for period_name, start_str, end_str in schedule:
        start = datetime.strptime(start_str, "%H:%M").replace(
            year = now.year, month = now.month, day = now.day)
        end = datetime.strptime(end_str, "%H:%M").replace(
            year=now.year, month=now.month, day=now.day)

        if start <= now <= end:
            minutes_left = int((end - now).total_seconds() / 60)
            return {
                "text": f"{period_name} ({minutes_left}m left)",
                "tooltip": f"Ends at {end.strftime('%H:%M')}"
            }
    return {
        "text": "No active period",
        "tooltip": "Outside scheduled time"
    }

def main():
    schedule = schedule_templates.get(current_day)
    if not schedule:
        print(json.dumps({"text": "Invalid day", "tooltip": "No schedule"}))
        return

    output = get_current_period(schedule)
    print(json.dumps(output))

if __name__ == "__main__":
    main()

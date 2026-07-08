import random
from datetime import datetime, timedelta

import pandas as pd

from config import RANDOM_SEED, NUM_RECRUITERS

random.seed(RANDOM_SEED)


def generate_recruiters():

    first_names = [
        "Aarav", "Vivaan", "Aditya", "Arjun", "Rohan",
        "Rahul", "Karan", "Aditi", "Ananya", "Priya",
        "Sneha", "Neha", "Meera", "Pooja", "Isha",
        "Ritika", "Nikhil", "Varun", "Sanya", "Kavya"
    ]

    last_names = [
        "Sharma", "Verma", "Gupta", "Singh", "Patel",
        "Kapoor", "Joshi", "Nair", "Reddy", "Iyer",
        "Mehta", "Bansal", "Chopra", "Khanna", "Das"
    ]

    hiring_levels = (
        ["Junior"] * 15 +
        ["Associate"] * 18 +
        ["Senior"] * 15 +
        ["Lead"] * 9 +
        ["Principal"] * 3
    )

    department_weights = {
        1: 18,   # Engineering
        2: 10,   # Data Analytics
        3: 8,    # Data Science
        4: 6,    # Product
        5: 4,    # Marketing
        6: 4,    # Sales
        7: 3,    # Finance
        8: 2,    # HR
        9: 2,    # Operations
        10: 1,   # Customer Success
        11: 1,   # Design
        12: 1    # Legal
    }

    department_choices = []

    for dept, weight in department_weights.items():
        department_choices.extend([dept] * weight)

    location_weights = {
        1: 15,   # Bengaluru
        2: 12,   # Hyderabad
        3: 8,    # Pune
        4: 7,    # Mumbai
        5: 7,    # Delhi
        6: 5,    # Noida
        7: 5,    # Gurugram
        8: 5,    # Chennai
        9: 3,
        10: 3,
        11: 2,
        12: 2,
        13: 2,
        14: 2,
        15: 1,
        16: 1,
        17: 1,
        18: 1,
        19: 1,
        20: 1
    }

    location_choices = []

    for loc, weight in location_weights.items():
        location_choices.extend([loc] * weight)

    used_emails = set()

    recruiters = []

    start_date = datetime(2016, 1, 1)
    end_date = datetime(2025, 6, 30)

    for recruiter_id in range(1, NUM_RECRUITERS + 1):

        first = random.choice(first_names)
        last = random.choice(last_names)

        base_email = f"{first.lower()}.{last.lower()}"

        email = f"{base_email}@talentlens.ai"

        counter = 2

        while email in used_emails:
            email = f"{base_email}{counter}@talentlens.ai"
            counter += 1

        used_emails.add(email)

        phone = str(random.choice([6, 7, 8, 9])) + "".join(
            str(random.randint(0, 9)) for _ in range(9)
        )

        experience = random.choices(
            population=[
                random.randint(0, 2),
                random.randint(3, 5),
                random.randint(6, 10),
                random.randint(11, 18)
            ],
            weights=[20, 35, 30, 15]
        )[0]

        performance = round(
            random.triangular(2.8, 4.9, 4.0),
            2
        )

        join_date = start_date + timedelta(
            days=random.randint(
                0,
                (end_date - start_date).days
            )
        )

        recruiters.append({
            "recruiter_id": recruiter_id,
            "first_name": first,
            "last_name": last,
            "email": email,
            "phone": phone,
            "department_id": random.choice(department_choices),
            "location_id": random.choice(location_choices),
            "experience_years": experience,
            "hiring_level": random.choice(hiring_levels),
            "performance_rating": performance,
            "join_date": join_date.date(),
            "is_active": random.choices(
                [1, 0],
                weights=[95, 5]
            )[0]
        })

    return pd.DataFrame(recruiters)
import pandas as pd

def generate_locations():
    locations = [
        ("Bengaluru", "Karnataka"),
        ("Hyderabad", "Telangana"),
        ("Pune", "Maharashtra"),
        ("Mumbai", "Maharashtra"),
        ("Delhi", "Delhi"),
        ("Noida", "Uttar Pradesh"),
        ("Gurugram", "Haryana"),
        ("Chennai", "Tamil Nadu"),
        ("Kolkata", "West Bengal"),
        ("Ahmedabad", "Gujarat"),
        ("Jaipur", "Rajasthan"),
        ("Lucknow", "Uttar Pradesh"),
        ("Indore", "Madhya Pradesh"),
        ("Kochi", "Kerala"),
        ("Bhubaneswar", "Odisha"),
        ("Chandigarh", "Chandigarh"),
        ("Nagpur", "Maharashtra"),
        ("Coimbatore", "Tamil Nadu"),
        ("Visakhapatnam", "Andhra Pradesh"),
        ("Mysuru", "Karnataka")
    ]

    df = pd.DataFrame(locations, columns=["city", "state"])
    df.insert(0, "location_id", range(1, len(df) + 1))
    df["country"] = "India"

    return df
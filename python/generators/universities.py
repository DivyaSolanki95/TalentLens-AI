import pandas as pd


def generate_universities():

    universities = [

        "IIT Delhi",
        "IIT Bombay",
        "IIT Madras",
        "IIT Kanpur",
        "IIT Kharagpur",
        "IIM Bangalore",
        "IIM Ahmedabad",
        "BITS Pilani",
        "NSUT Delhi",
        "DTU Delhi",
        "NIT Trichy",
        "NIT Warangal",
        "IIIT Hyderabad",
        "VIT Vellore",
        "SRM University",
        "Manipal Institute of Technology",
        "Amity University",
        "Christ University",
        "Delhi University",
        "Mumbai University"

    ]

    df = pd.DataFrame(
        universities,
        columns=["university_name"]
    )

    df.insert(
        0,
        "university_id",
        range(1, len(df)+1)
    )

    return df
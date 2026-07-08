import pandas as pd


def generate_departments():

    departments = [
        "Engineering",
        "Data Analytics",
        "Data Science",
        "Product Management",
        "Marketing",
        "Sales",
        "Finance",
        "Human Resources",
        "Operations",
        "Customer Success",
        "Design",
        "Legal"
    ]

    df = pd.DataFrame(
        departments,
        columns=["department_name"]
    )

    df.insert(
        0,
        "department_id",
        range(1, len(df)+1)
    )

    return df
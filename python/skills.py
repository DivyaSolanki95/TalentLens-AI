import pandas as pd


def generate_skills():

    skills = [

        "Python",
        "SQL",
        "Excel",
        "Power BI",
        "Tableau",
        "Machine Learning",
        "Statistics",
        "Java",
        "Spring Boot",
        "React",
        "AWS",
        "Azure",
        "Docker",
        "Kubernetes",
        "Git",
        "Data Visualization",
        "Pandas",
        "NumPy",
        "Scikit Learn",
        "TensorFlow",
        "Communication",
        "Leadership",
        "Problem Solving",
        "Project Management",
        "Agile",
        "Figma",
        "UI Design",
        "Digital Marketing",
        "SEO",
        "Salesforce"

    ]

    df = pd.DataFrame(
        skills,
        columns=["skill_name"]
    )

    df.insert(
        0,
        "skill_id",
        range(1, len(df)+1)
    )

    return df
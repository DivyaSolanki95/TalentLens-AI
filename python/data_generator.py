import os

from generators.locations import generate_locations
from generators.departments import generate_departments
from generators.skills import generate_skills
from generators.universities import generate_universities


print("=" * 60)
print("TalentLens AI Enterprise Data Generator")
print("=" * 60)


os.makedirs("../data/synthetic", exist_ok=True)


locations = generate_locations()
departments = generate_departments()
skills = generate_skills()
universities = generate_universities()


locations.to_csv(
    "../data/synthetic/locations.csv",
    index=False
)

departments.to_csv(
    "../data/synthetic/departments.csv",
    index=False
)

skills.to_csv(
    "../data/synthetic/skills.csv",
    index=False
)

universities.to_csv(
    "../data/synthetic/universities.csv",
    index=False
)


print("✅ Master data generated successfully")

print("\nFiles created:")
print("- locations.csv")
print("- departments.csv")
print("- skills.csv")
print("- universities.csv")
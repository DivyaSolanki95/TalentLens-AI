import numpy as np
import random

from config import *

# ==========================================
# Initialize Random Seed
# ==========================================

random.seed(RANDOM_SEED)
np.random.seed(RANDOM_SEED)

print("=" * 50)
print("TalentLens AI Enterprise Data Generator")
print("=" * 50)

print(f"Candidates   : {NUM_CANDIDATES}")
print(f"Applications : {NUM_APPLICATIONS}")
print(f"Jobs         : {NUM_JOBS}")

print("\nInitialization Successful ✅")
# Data Dictionary

This document describes every table used in the TalentLens AI Recruitment Intelligence Platform.

---

## Candidates

Stores candidate demographic and professional information.

Primary Key:
- candidate_id

---

## Applications

Stores every job application submitted by candidates.

Primary Key:
- application_id

Foreign Keys:
- candidate_id
- job_id
- recruiter_id

---

## Jobs

Stores job openings.

Primary Key:
- job_id

---

## Departments

Stores company departments.

Primary Key:
- department_id

---

## Recruiters

Stores recruiter information.

Primary Key:
- recruiter_id

---

## Hiring Managers

Stores hiring manager information.

Primary Key:
- manager_id

---

## Interview Stages

Stores recruitment stages.

Examples:

- Resume Screening
- HR Interview
- Technical Interview
- Manager Round
- Offer
- Joined

---

## Interviews

Stores interview details.

---

## Offers

Stores offer information.

---

## Onboarding

Stores candidate joining status.

---

## Sources

Stores recruitment channels.

Examples:

- LinkedIn
- Referral
- Company Website
- Campus
- Naukri
- Indeed

---

## Skills

Master table containing technical and non-technical skills.

---

## Candidate Skills

Mapping table between Candidates and Skills.

---

## Job Skills

Mapping table between Jobs and Skills.

---

## Universities

Stores educational institutions.

---

## Locations

Stores office locations.
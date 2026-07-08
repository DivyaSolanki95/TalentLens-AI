-- =====================================================
-- Project      : TalentLens AI
-- Description  : Enterprise Recruitment Intelligence Platform
-- Author       : Divya Solanki
-- Version      : 1.0
-- Database     : MySQL 8.0
-- =====================================================

DROP DATABASE IF EXISTS TalentLensAI;

CREATE DATABASE TalentLensAI;

USE TalentLensAI;



-- =====================================================
-- TABLE : Locations
-- =====================================================

CREATE TABLE Locations (

    location_id INT PRIMARY KEY AUTO_INCREMENT,

    city VARCHAR(100) NOT NULL,

    state VARCHAR(100) NOT NULL,

    country VARCHAR(100) NOT NULL,

    region VARCHAR(100)




);
-- =====================================================
-- TABLE : Departments
-- =====================================================

CREATE TABLE Departments (

    department_id INT PRIMARY KEY AUTO_INCREMENT,

    department_name VARCHAR(100) NOT NULL UNIQUE,

    department_head VARCHAR(150),

    budget DECIMAL(15,2),

    location_id INT,

    created_at DATE,

    FOREIGN KEY (location_id)
        REFERENCES Locations(location_id)

);

-- =====================================================
-- TABLE : Sources
-- =====================================================

CREATE TABLE Sources (

    source_id INT PRIMARY KEY AUTO_INCREMENT,

    source_name VARCHAR(100) UNIQUE NOT NULL

);

-- =====================================================
-- TABLE : Skills
-- =====================================================

CREATE TABLE Skills (

    skill_id INT PRIMARY KEY AUTO_INCREMENT,

    skill_name VARCHAR(100) UNIQUE NOT NULL,

    category VARCHAR(100)

);

-- =====================================================
-- TABLE : Universities
-- =====================================================

CREATE TABLE Universities (

    university_id INT PRIMARY KEY AUTO_INCREMENT,

    university_name VARCHAR(200) NOT NULL,

    city VARCHAR(100),

    state VARCHAR(100),

    country VARCHAR(100),

    ranking INT

);

-- =====================================================
-- TABLE : InterviewStages
-- =====================================================

CREATE TABLE InterviewStages (

    stage_id INT PRIMARY KEY AUTO_INCREMENT,

    stage_name VARCHAR(100) UNIQUE,

    sequence_number INT

);
-- =====================================================
-- TABLE : Recruiters
-- =====================================================

CREATE TABLE Recruiters (

    recruiter_id INT PRIMARY KEY AUTO_INCREMENT,

    first_name VARCHAR(100) NOT NULL,

    last_name VARCHAR(100) NOT NULL,

    email VARCHAR(150) UNIQUE NOT NULL,

    phone VARCHAR(20),

    department_id INT NOT NULL,

    location_id INT NOT NULL,

    joining_date DATE,

    experience_years DECIMAL(4,1),

    status ENUM('Active','Inactive','On Leave') DEFAULT 'Active',

    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),

    FOREIGN KEY (location_id)
        REFERENCES Locations(location_id)

);
-- =====================================================
-- TABLE : HiringManagers
-- =====================================================

CREATE TABLE HiringManagers (

    manager_id INT PRIMARY KEY AUTO_INCREMENT,

    first_name VARCHAR(100) NOT NULL,

    last_name VARCHAR(100) NOT NULL,

    designation VARCHAR(100),

    email VARCHAR(150) UNIQUE,

    department_id INT NOT NULL,

    location_id INT NOT NULL,

    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),

    FOREIGN KEY (location_id)
        REFERENCES Locations(location_id)

);
-- =====================================================
-- TABLE : Jobs
-- =====================================================

CREATE TABLE Jobs (

    job_id INT PRIMARY KEY AUTO_INCREMENT,

    job_title VARCHAR(150) NOT NULL,

    department_id INT NOT NULL,

    manager_id INT NOT NULL,

    location_id INT NOT NULL,

    employment_type ENUM('Full-Time','Part-Time','Contract','Internship') DEFAULT 'Full-Time',

    experience_required DECIMAL(4,1),

    salary_min DECIMAL(10,2),

    salary_max DECIMAL(10,2),

    vacancies INT DEFAULT 1,

    posting_date DATE,

    closing_date DATE,

    status ENUM('Open','Closed','On Hold') DEFAULT 'Open',

    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),

    FOREIGN KEY (manager_id)
        REFERENCES HiringManagers(manager_id),

    FOREIGN KEY (location_id)
        REFERENCES Locations(location_id)

);
-- =====================================================
-- TABLE : Candidates
-- =====================================================

CREATE TABLE Candidates (

    candidate_id INT PRIMARY KEY AUTO_INCREMENT,

    first_name VARCHAR(100) NOT NULL,

    last_name VARCHAR(100) NOT NULL,

    gender ENUM('Male','Female','Other'),

    date_of_birth DATE,

    email VARCHAR(150) UNIQUE NOT NULL,

    phone VARCHAR(20),

    years_experience DECIMAL(4,1),

    current_company VARCHAR(150),

    current_ctc DECIMAL(10,2),

    expected_ctc DECIMAL(10,2),

    notice_period INT,

    university_id INT,

    city VARCHAR(100),

    state VARCHAR(100),

    country VARCHAR(100),

    FOREIGN KEY (university_id)
        REFERENCES Universities(university_id)

);
-- =====================================================
-- TABLE : CandidateSkills
-- =====================================================

CREATE TABLE CandidateSkills (

    candidate_skill_id INT PRIMARY KEY AUTO_INCREMENT,

    candidate_id INT NOT NULL,

    skill_id INT NOT NULL,

    proficiency_level ENUM('Beginner','Intermediate','Advanced','Expert'),

    years_of_experience DECIMAL(4,1),

    FOREIGN KEY (candidate_id)
        REFERENCES Candidates(candidate_id),

    FOREIGN KEY (skill_id)
        REFERENCES Skills(skill_id)

);

-- =====================================================
-- TABLE : JobSkills
-- =====================================================

CREATE TABLE JobSkills (

    job_skill_id INT PRIMARY KEY AUTO_INCREMENT,

    job_id INT NOT NULL,

    skill_id INT NOT NULL,

    mandatory BOOLEAN DEFAULT TRUE,

    FOREIGN KEY (job_id)
        REFERENCES Jobs(job_id),

    FOREIGN KEY (skill_id)
        REFERENCES Skills(skill_id)

);
-- =====================================================
-- TABLE : Applications
-- =====================================================

CREATE TABLE Applications (

    application_id INT PRIMARY KEY AUTO_INCREMENT,

    candidate_id INT NOT NULL,

    job_id INT NOT NULL,

    recruiter_id INT NOT NULL,

    source_id INT NOT NULL,

    application_date DATE NOT NULL,

    current_status ENUM(
        'Applied',
        'Screening',
        'Interview',
        'Offered',
        'Rejected',
        'Hired',
        'Withdrawn'
    ) DEFAULT 'Applied',

    resume_score DECIMAL(5,2),

    FOREIGN KEY (candidate_id)
        REFERENCES Candidates(candidate_id),

    FOREIGN KEY (job_id)
        REFERENCES Jobs(job_id),

    FOREIGN KEY (recruiter_id)
        REFERENCES Recruiters(recruiter_id),

    FOREIGN KEY (source_id)
        REFERENCES Sources(source_id)

);
-- =====================================================
-- TABLE : Interviews
-- =====================================================

CREATE TABLE Interviews (

    interview_id INT PRIMARY KEY AUTO_INCREMENT,

    application_id INT NOT NULL,

    stage_id INT NOT NULL,

    interviewer_name VARCHAR(150),

    interview_date DATE,

    result ENUM('Pass','Fail','Pending'),

    feedback_score DECIMAL(4,2),

    duration_minutes INT,

    FOREIGN KEY (application_id)
        REFERENCES Applications(application_id),

    FOREIGN KEY (stage_id)
        REFERENCES InterviewStages(stage_id)

);
-- =====================================================
-- TABLE : Offers
-- =====================================================

CREATE TABLE Offers (

    offer_id INT PRIMARY KEY AUTO_INCREMENT,

    application_id INT NOT NULL,

    offer_date DATE,

    offered_ctc DECIMAL(10,2),

    offer_status ENUM(
        'Pending',
        'Accepted',
        'Rejected',
        'Expired',
        'Withdrawn'
    ) DEFAULT 'Pending',

    acceptance_date DATE,

    FOREIGN KEY (application_id)
        REFERENCES Applications(application_id)

);
-- =====================================================
-- TABLE : Onboarding
-- =====================================================

CREATE TABLE Onboarding (

    onboarding_id INT PRIMARY KEY AUTO_INCREMENT,

    application_id INT NOT NULL,

    joining_date DATE,

    joining_status ENUM(
        'Joined',
        'Declined',
        'Delayed',
        'No Show'
    ) DEFAULT 'Joined',

    background_verification ENUM(
        'Pending',
        'Completed',
        'Failed'
    ) DEFAULT 'Pending',

    probation_status ENUM(
        'Not Started',
        'Ongoing',
        'Completed'
    ) DEFAULT 'Not Started',

    FOREIGN KEY (application_id)
        REFERENCES Applications(application_id)

);

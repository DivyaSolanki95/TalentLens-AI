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
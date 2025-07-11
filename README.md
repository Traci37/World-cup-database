# World-Cup-Database
 It involves creating a Bash script that enters information from World Cup games into a PostgreSQL database. 
 The database will store game data and allow for querying useful statistics related to the World Cup.

## Table of Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [Getting Started](#getting-started)
4. [Project Tasks](#project-tasks)
5. [Usage](#usage)
   

## Introduction

The World Cup Database project focuses on managing and analyzing data from the final rounds of the World Cup tournament since 2014. It aims to provide insights into game outcomes and team performance through structured data storage and querying. 

## Features

- Bash script for data entry into PostgreSQL.
- Structured database schema for storing game information.
- Query functions to extract statistics and insights from the data.

 ## User Instructions

### Prerequisites

- PostgreSQL installed on your machine.
- Bash shell for running the script.
- Access to the `games.csv` file containing the game data.

   
## Project Task
1. Data Importation
   
   Create a Bash script that reads the games.csv file. This script should:
   * Analyze the CSV file and extract relevant data.
   * Insert the data into the PostgreSQL database, ensuring that all necessary fields (year, round, winner, opponent, goals) are correctly mapped to the corresponding database table columns.
2. Database

   Create a PostgreSQL database schema that includes:
   * A table for storing game information, with appropriate data types for each field.
3. Querying

   Implement SQL queries to extract useful statistics from the database, such as:
   *


   

#!/bin/bash

echo "Hello and welcome to the data engineering folder setup script!"
echo "Please enter your project name:"
read PROJECT_NAME

if [[ -z "$PROJECT_NAME" ]]; then
  echo "Project name cannot be empty."
  exit 1
fi

mkdir "$PROJECT_NAME"
cd "$PROJECT_NAME" || exit

echo "Will you be using Snowflake? y/n"
read SNOWFLAKE
[[ "$SNOWFLAKE" == "y" ]] && mkdir -p SQL

echo "Will you be using Docker? y/n"
read DOCKER
[[ "$DOCKER" == "y" ]] && mkdir -p docker

echo "Will you be using Airflow? y/n"
read AIRFLOW
[[ "$AIRFLOW" == "y" ]] && mkdir -p airflow

mkdir -p data schema

echo "Initializing git..."
git init

echo "Creating .env and .gitignore..."
touch .env .gitignore
echo ".venv/" >> .gitignore
echo ".env" >> .gitignore

echo "Creating Python virtual environment..."
python3 -m venv .venv

echo "Opening VS Code..."
code .

echo "DONE!"
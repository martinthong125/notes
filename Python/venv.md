# Python Virtual Environment

## Why use it?

Isolate python versions and library / module versions.

## Setup venv in VS code

1. Create a new folder
2. Create the venv
   - `python3 -m venv .venv`
3. Activate the venv
   - `source .venv/bin/activate`
4. Install library / module
   - `pip3 install boto3`
5. Start coding

## To exit venv

- `deactivate`

## To generate requirements.txt

1. Activate the venv
2. `pip freeze > requirements.txt`

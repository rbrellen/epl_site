# Toy website for English Premier League results

This repo is a toy website that provides details about the 2019-2020 English Premier League season.
It includes a schedule and league table along with individualized schedules for each team.
It also provides basic login/logout admin features to update match results and, if needed, teams.

First admin role should be established by changing `devise` admin model to `registerable`.
Once the appropriate admin role (or roles) has been established, remove the ability to sign up by
removing the `registerable` attribute from the `devise` admin model.

Entire list of teams and schedule must be created from scratch.
Best option would be to upload data directly into database from CSV.
Alternatively, data can be created by admin role directly in application.

Areas for future improvement:

* Testing (unit and integration)
* Database optimization
* Database initialization
* General infrastructure

# Task Manager

Welcome to the Task Manager! This app is a group task manager, suitable for organizations with sub-groups to easily categorize and manage their to-do lists. Users can view all tasks and other users belonging to their group, create new tasks, or claim existing ones to complete. Admin users have the additional ability to see to-do lists belonging to all cohorts, as well as add/delete cohorts and tasks.

## Usage

When signing up, users select which cohort (group) they belong to. Then upon logging in, their profile page will show tasks they have claimed, and contain links to view other members of their cohort. Any person can create a new task for their cohort. Once a task has been created, it will appear in the to-do tab. From this page, users can claim tasks to do themselves (which will then appear on their profile page), mark items as complete, or create new ones.

Admin users have the ability to view all tasks belonging to each cohort, create new tasks, and create/edit new cohorts.

## Installation & Starting the Program

To use this program, clone or download the project using the link above this document.

**To start the program,** first install the dependencies by typing the following command in the terminal:

    $ bundle install

Then start the server by typing the following command:

    $ rails s

Once the server is started, open up a browser window and visit the url listed in the terminal (usually localhost:3000).

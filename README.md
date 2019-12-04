# Bookbuster_management_system

This project is a local-end library management system to demonstrate the students' understanding toward the creation of 3-tier online application with all what have been learned during the semester on software development.

## Getting started

The project is 

### Prerequisites

There are some dependencies that needed to be installed prior to engage the overall installation and development process. The following are the Python dependencies:

- psycoph2
- virtualenv
- django

Please use `pip search <package_name>` to look up if your machine has the package available.

### Installing

#### Create database 

Since we use Postgres, let's launch the database server,

```
sudo -u postgres psql
```

And enter your OS user password. Once you are in, you will be using `postgres` as the user to create the table, and the role needs a password for security reason. Since you already logged in in the `postgres` role, you only need to add a password for the role.

```sql
ALTER ROLE postgress WITH PASSWORD = 'postgres' ;
```
we assign `postgres` as the password for the role `postgres`. 

Now, since the dataset has never being created, you can go ahead and issue the command. The database `lms` should be created.

```sql
CREATE DATABASE lms ;
```

The database should be created by now. Let's connect the database to import the datasets. 

```sql
\c lms
```

#### Import datasets

There are two ways to do so. In the first method, you can manually import the SQL file to import the datasets, or maybe to have the Python script do that for you, but make sure you have setup the database, role, and the password beforehand. Make sure that you have switch to the directory where the scripts are. Let's quit the Postgres for now, and make sure we do so.

```
cd /the/path/to/Bookmaster_management_system/database_layer/
```

Make sure you can see a Python script `sql_processor.py`. If you find the script file, make sure you are in the same directory as the file. Next, either logging to Postgres server

```sql
sudo -u postgres psql
\c lms
\i sql_processor.sql
```

Or not logging into the SQL server, but run the script

```
python3 sql_processor.py
```

To check whether the datasets have been imported, log into the SQL server and insert the following commands

```sql
sudo -u postgres psql
\c lms
\dt
```

if the terminal reveals the tables of all relations, such as the one below,

```
               List of relations
 Schema |       Name        | Type  |  Owner   
--------+-------------------+-------+----------
 public | admin             | table | postgres
 public | author            | table | postgres
 public | book_table        | table | postgres
 public | category          | table | postgres
 public | inventory_table   | table | postgres
 public | inventry_table    | table | postgres
 public | issue_book        | table | postgres
 public | last_inventory    | table | postgres
 public | last_inventry     | table | postgres
 public | publisher         | table | postgres
 public | sequence_issue_id | table | postgres
 public | serial_number     | table | postgres
 public | student_table     | table | postgres
(13 rows)
```

And then proceed to browse the content of one of the relations: admin using the command

```sql
SELECT * FROM admin ;
```

with which to have the result:

```
 sl_no | user_name | password 
-------+-----------+----------
     1 | j         | j
(1 row)
```

You are all set.

### Set up the server

TODO

### Get the website up and running

TODO

### Running the tests

To run the differnet unit tests, cd to the directory containing `scripts/`, i.e., 

```
cd /to/the/path/containing/your/Bookmaster_management_system/scripts
```

From there, run the unit test as

```
python3 -m unitttest scripts/test/<the unit test file>
```

For example,

```
python3 -m unittest scripts/tests/unit_test_Admin_use
```

You can drop the extension _.py_ or have it.

## Deployment

There will be a CD / CI mechanism up and running shortly.

## Built with

- Linux Ubuntu 18.04
- Python 3.6.8
- Django
- psychopg2
- pip3
- Postgres and PostgreSQL

## Contributing

Make sure to follow the [Google Style Guides | styleguide](http://google.github.io/styleguide/) and the [Git Workflow | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/comparing-workflows) for version control. 

Fork from this repository and pull request to us for peer revisions !

## Versioning

We use Git and follow the Git Workflow to design, manage, and manage the development progress.

There is also a [CHANGELOG.md](changelog.md) to register all the adds-on, changes and removals in each unreleased versions. The difference between this document and the **git_logs** is that the messages are more readable and directed towards the clients as well as tjhe developers to give a general glance for each version of the software.

## Authors

- [Rhidhi Gulati]()
- [Jingyi Zhao]()
- [Charly Huang](huangc11@rpi.edu)

## License

This project is licensed under the MIT license. See the [License.md](LICENSE.md) for details.
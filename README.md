# README

[![Build Status](https://travis-ci.org/LiteracyVolunteersOfMA/lvm-rails.svg?branch=master)](https://travis-ci.org/LiteracyVolunteersOfMA/lvm-rails)
[![Code Climate](https://codeclimate.com/github/LiteracyVolunteersOfMA/lvm-rails/badges/gpa.svg)](https://codeclimate.com/github/LiteracyVolunteersOfMA/lvm-rails)
[![Coverage Status](https://coveralls.io/repos/github/LiteracyVolunteersOfMA/lvm-rails/badge.svg?branch=master)](https://coveralls.io/github/LiteracyVolunteersOfMA/lvm-rails?branch=master)

This is a service learning project for CS4500 Spring 2017.

See the live version here: https://lvm-rails.herokuapp.com/

This repo was initially intended to be a spike to test the feasibility of starting from scratch.

**Instructions detailed for MacOS; however, it can easily be adapted to linux/unix environments**

To get started, fork and clone down the repo as defined in the [git flow article](https://cs5500.ccs.neu.edu/confluence/display/CS4500Sp16TEAM4/Git+Workflow).

## Getting Setup

This section will walk through the installation of everything you'll need to get up and running. We'll be installing:

1. Homebrew
2. RVM
3. Ruby
4. Rails

#### Homebrew

Firstly, make sure you have standard command line tools installed for MacOS:

```
xcode-select --install
```

Agree to the prompts and wait until it has finished.

Now, run the following to install Homebrew (taken from the Homebrew front page):

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

#### RVM, Ruby, and Rails

RVM is a ruby version manager that allows you to easily install and switch between different ruby versions on the fly.

Running the following command will install RVM along with the latest version of ruby and rails:

```
curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
```

In order to bundle the dependancies for the rails app, you need to install the `bundler` gem:

```
gem install bundler
```

## Running Locally

Once you've run through the initial setup, its time to get your local version up and running.

While inside the cloned repo:

```
bundle install
```

**Note: If you get an error installing Nokogiri, try running the following command:**

```
gem install nokogiri -- --use-system-libraries --with-xml2-include=/usr/include/libxml2 --with-xml2-lib=/usr/lib/
```

After everything installs we need to run database migrations to setup our local database:

```
rake db:migrate
```

Now you're all set to run the rails server:

```
rails server
```

Now you're all set to run the rails server:

```
rails server
```

The application should be running and accessible at `http://localhost:3000`!

## Seeding the database
Run `rake db:seed_fu` to seed the database with:
* 20 students
* 20 tutors
* 20 coordinators
* A random assortment of relationships between students/tutors/coordinators
* 3 user accounts
  * tutor@email.com (role: tutor)
  * coordinator@email.com (role: coordinator)
  * admin@email.com (role: admin)
  * all passwords are "password"

## Troubleshooting

* If you get "ActiveRecord::PendingMigrationError", this means that you need to
  migrate your database; that is, the application is expecting a newer version
  of your database schema than you have current set up. Simply run:
    ```
    rake db:migrate
    ```

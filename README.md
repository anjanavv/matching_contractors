# README

## Problem Statement

### Matching algorithm
Description
Find a matching general contractors with homeowners to perform their
renovation project. Each homeowner typically gets 3 matches
depending on their renovation project details so they can compare bids and choose
the best contractor for the job.
You have been tasked with coming up with a matching algorithm that allows every
homeowner to vet 3 contractors for their project.

Entities
Renovation projects:
- Location (lat & lng)
- Minimum budget ($)
- Maximum budget ($)
- Design services needed (boolean)
- Build services needed (boolean)
General contractors:
- Business location (lat & lng)
- Minimum project budget they're willing to take on ($)
- Maximum project budget they're willing to take on ($)
- Offers design services (boolean)
- Offers build services (boolean)

Match funnel:
- A homeowner can say yes/no to each of the contractors
- A homeowner can award their project to one contractor
- A contractor can say yes/no to a project

A match is active by default unless one of the two parties opts out (which can happen
at any stage outside of the contract being signed).

## Installation
### Dependencies

    Ruby 2.6.0
    Rails 5.2.2
    MySQL or MariaDB server
    Geocoder 1.3

### Clone 

git clone https://github.com/anjanavv/matching_contractors.git

### Install bundler and required gems

Once the specified version of Ruby is installed with all its dependencies satisfied, run the following command from the root directory of the application. 
```
gem install bundler
bundle install
```
## Create and configure database

Update the credentials in database.yml with actual values.

Now you can create the database and perform migrations
```
rake db:create
rake db:migrate
```

## Start the application

You can start the Rails server using
```
rails server
```
This can be accessed from the browser by navigating to http://localhost:3000/contractors.

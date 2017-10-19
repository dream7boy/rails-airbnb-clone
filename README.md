# Workflow on Github
## ▼Before starting new tasks
### ◎On Github 
1. `git pull origin master` to get latest master
1. `bundle install` if new gem file added
1. `rails db:migrate` if any new model created
  - If you need to create DB again, run `rails db:drop db:create db:migrate` or `rails db:reset`
1. `git branch` check which branch you are on
1. `git checkout -b "branch-name"` Create and switch the branch
1. Write and edit code

### ◎On Trello
1. Pick the card from User Story or create new card for your task
1. Move the card to "In Progress" and assign you to the card

## ▼After finishing tasks
### ◎On Github 
1. Check it works properly or not on your local **(This step is really important!!)**
1. `git status` to check the files you've modified
1. `git add .` to add all the changes to the staging
1. `git commit -m “edit comments”` The comments should be easier for others to understand it.
1. `git push origin "your branchname"` to push it to origin
1. Go to [Github](https://github.com/dream7boy/rails-airbnb-clone) and create pull request. Don't forget to assign it to @dream7boy.
1. Check the pull reqest and resolve conflict if needed

### ◎On Trello
1. Move the card to "Review" and assign to @junggunlee.

## ▼【For lead dev】Merge Pull Requests
### ◎On Github 
1. Lead dev merge code on Github (master is changed on Github but not local repo)
1. Delete merged branch right after it's merged to master.

### ◎On Trello
1. Move the card to "To Deploy" when finishing code review and merge.

## ▼【For lead dev】Deploy master to heroku
### ◎On Github 
1. Check what will be deployed to heroku 
1. `git push heroku master` to deploy the files to heroku
1. If you need to change DB structures, run `heroku run db:migrate`
1. Go to [heroku url](https://airbnb-dream7boy.herokuapp.com/) to check the changes are applied on heroku.

### ◎On Trello
1. Move the card to "Done" when finishing deployment.

## ▼Start another tasks
1. `git status` to check if clean before pull, checkout or merge
1. `git checkout master`
1. `git pull origin master` to pull the latest master
1. `git sweep` to clean unused branches

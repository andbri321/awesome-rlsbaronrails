# Awesome RlsBarOnRails


## Development setup
For the development process we'll adopt Rails v6.0.3 (API only) and Ruby version 2.6.5.

### 1) Clone repository

    $ git clone git@gitlab.com:weareredlight/code-challenges/awesome-rlsbaronrails.git

or using HTTPS:

    $ git clone https://gitlab.com/weareredlight/code-challenges/awesome-rlsbaronrails.git

### 2) Install dependencies - Bundle
  Run:

    $ bundle

### 3) Setup database
  Run:

    $ rails db:migrate:reset; rails db:seed

### 4) Start server
  Run:

    $ rails s -p 3000 [-b 0.0.0.0]


### Challenge

For this challenge we propose you to create a simple Rails API, that should feed a cocktail recipe app.

We provide you the base code which includes an early stage of the "Ingredient" and "Category" models.

To fulfill your goal you should create two endpoints on the CocktailsController:

1) Display every detail of a certain cocktail. (i.e. Ingredients, Category, Instructions, etc) - [show]

2) List all cocktails while allowing searching by cocktail name and by ingredient name - [index with search]

You should update the Ingredient and Category models and create all the tables necessary to complete the assignment. Keep in mind that a cocktail should have many ingredients and only one category.

We provide you with a list of cocktails in the seeds file. You can use that to seed the database.

Make sure you write clean code and use Rails best practices.


### Extras

Feel free to add any endpoints or features that you find relevant (you can generate resources for other models, i.e. categories and ingredients).

If you need inspiration you check the TheCocktailDB API on https://www.thecocktaildb.com/api.php

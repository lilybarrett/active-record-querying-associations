Our brussels sprouts recipe blog needs a major makeover. We have many recipes and each of them can have many comments. We need to model this blog with ActiveRecord.

###Learning Goals
* Create a multi-table application
* Explore ways to associate tables
* Use a foreign key column

###Instructions
* Create a new Sinatra app with the [Sinatra ActiveRecord Starter Kit](https://github.com/LaunchAcademy/sinatra-activerecord-starter-kit). Follow the instructions in the reading about the basic setup.
* Create a `Recipe` model and associated migration. Determine the column names as you deem necessary. You don't have to worry about ingredients here.
* Create a `Comment` model and associated migration. Determine the column names as you deem necessary.
* Associate the two tables so that each recipe can have multiple comments posted about it.
* Load up your app in irb (see the reading for a description of how to do this) and follow these directions:
  * Create 5 recipes

  chocolate_chip_cookies = Recipe.create(name: 'Chocolate chip cookies', recipe: "This is some recipe text")
  banana_pudding = Recipe.create(name: 'Banana pudding', recipe: "This is some recipe text")
  congo_bars = Recipe.create(name: 'Congo bars', recipe: "This is some recipe text")
  stuffed_peppers = Recipe.create(name: 'Stuffed peppers', recipe: "This is some recipe text")
  mac_n_cheese = Recipe.create(name: 'Mac n cheese', recipe: "This is some recipe text")

  * Create 1-5 comments on all your recipes.

  Comment.create(comment: 'LOL', recipe_id: chocolate_chip_cookies.id)
  Comment.create(comment: 'click here for a free iPad!', recipe_id: chocolate_chip_cookies.id)
  Comment.create(comment: 'great analysis!!!', recipe_id: banana_pudding.id)
  Comment.create(comment: 'ruby is so 2010, Go is the future', recipe_id: banana_pudding.id)
  Comment.create(comment: 'i like ice cream', recipe_id: congo_bars.id)
  Comment.create(comment: 'LOL', recipe_id: congo_bars.id)
  Comment.create(comment: 'click here for a free iPad!', recipe_id: stuffed_peppers.id)
  Comment.create(comment: 'great analysis!!!', recipe_id: stuffed_peppers.id)
  Comment.create(comment: 'ruby is so 2010, Go is the future', recipe_id: mac_n_cheese.id)
  Comment.create(comment: 'i like ice cream', recipe_id: mac_n_cheese.id)
  Comment.create(comment: 'will never beat brussels sprouts', recipe_id: banana_pudding.id)

* Answer the following questions:
  * How would you return all the recipes in your database?

  recipes = Recipe.all

  * How would you return all the comments in your database?

  comments = Comment.all

  * How would you return the most recent recipe posted in your database?

  the_last_supper = Recipe.last

  OR: Recipe.order(created_at: :desc).first

  * How would you return all the comments of the most recent recipe in your database?

  the_last_supper = Recipe.last
  comments = Comment.where(recipe_id: the_last_supper.id)

  * How would you return the most recent comment of all your comments?

  the_last_comment = Comment.last

  OR: Comment.order(created_at: :desc).first

  * How would you return the recipe associated with the most recent comment in your database?

  the_last_comment = Comment.last
  recipe = Recipe.where(id: the_last_comment.recipe_id).first

  * How would you return all comments that include the string `brussels` in them?

  brussels_comments = Comment.where("comment LIKE?", "%brussels%")

  OR: Comment.where("body LIKE '%brussels%'")

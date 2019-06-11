# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Smoker.create(smoker_type: "Ugly Drum", name:"Pit Barrel Cooker")
Smoker.create(smoker_type: "Pellet", name:"Traeger")
Smoker.create(smoker_type: "Offset", name:"Yoder")
Smoker.create(smoker_type: "Electric", name:"Masterbuilt")
Smoker.create(smoker_type: "Egg/Bullet", name:"Big Green Egg")

Food.create(animal: "Beef", cut: "Brisket")
Food.create(animal: "Beef", cut: "Back Ribs")
Food.create(animal: "Beef", cut: "Plate Ribs")
Food.create(animal: "Pork", cut: "Shoulder")
Food.create(animal: "Pork", cut: "Baby Back Ribs")
Food.create(animal: "Pork", cut: "St. Loius Ribs")
Food.create(animal: "Chicken", cut: "Whole")
Food.create(animal: "Chicken", cut: "Wings")
Food.create(animal: "None", cut: "Mac and Cheese")

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Menu.all.empty?
  brunch = Menu.create(
  meal: "Brunch",
  start:  DateTime.strptime("09:00", "%H:%M"),
  stop:  DateTime.strptime("11:00", "%H:%M")
  )
  lunch = Menu.create(
  meal: "Lunch",
  start:  DateTime.strptime("12:00", "%H:%M"),
  stop:  DateTime.strptime("16:00", "%H:%M")
  )
  dinner = Menu.create(
  meal: "Dinner",
  start:  DateTime.strptime("17:00", "%H:%M"),
  stop:  DateTime.strptime("22:00", "%H:%M")
  )
  brunch_entres = brunch.categories.create(name: "Entres")
  brunch_drinks = brunch.categories.create(name: "Drinks")
  brunch_eggs = brunch.categories.create(name: "Eggs")
  brunch.items.create(
    name: "Chilaquiles",
    description: "Fried tortillas with verde sauce, eggs, and steak or chicken",
    price: 10.25,
    category: brunch_entres
  )
  brunch.items.create(
    name: "Cafe",
    description: "Freshly ground coffee brewed to perfection",
    price: 2.50,
    category: brunch_drinks
  )
  brunch.item.create(
    name "Huevos con Jamon",
    description: "Ham and eggs",
    price: 7.75,
    category: brunch_eggs
  )
  l_entre = lunch.categories.create(name: "Entre")
  l_sides = lunch.categories.create(name: "Sides")
  l_drinks = lunch.categories.create(name: "Drinks")

  lunch.items.create(
    name: "Torta",
    description: "Sandwich with fresh bread, choice of steak, chorizo, milanese pollo, or ham",
    price: 6.33,
    category: l_entre
  )
  lunch.items.create(
    name: "Chips and Salsa",
    description: "In house made tortilla chips with our house salsa",
    price: 1.55,
    category: l_sides
  )
  lunch.items.create(
    name: "Soda",
    description: "Coke, Sprite, Diet Coke, Lemonade",
    price: 1.00,
    category: l_drinks
  )

  d_entre = dinner.categories.create(name: "Entre")
  d_appetizers = dinner.categories.create(name: "Appetizers")
  d_drinks = dinner.categories.create(name: "Drink")
  d_desserts = dinner.categories.create(name: "Desserts")

  dinner.items.create(
    name: "Tacos",
    description: "Corn tortillas, onions and cilantro, your choice of steak,
    chicken, chorizo, pastor, or carnitas",
    price: 2.00,
    category: d_entre
  )
  dinner.items.create(
    name: "Burrito",
    description: "Large burrito, with your choice of steak, chicken, chorizo,
    pastor, or carnitas",
    price: 6.80,
    category: d_entre
  )
  dinner.items.create(
    name: "Chips and Guacamole",
    description: "Made at your table Guacamole with Avocados, Onions, Jalepenos,
    Cilantro, fresh squeezed lime juice, and salt",
    price: 4.50,
    category: d_appetizers
  )
  dinner.items.create(
    name: "Flan",
    description: "Perfect end to your evening",
    price: 2.75,
    category: d_desserts
  )
  dinner.items.create(
    name: "Soda",
    description: "Coke, Sprite, Diet Coke, Lemonade",
    price: 1.00,
    category: d_drinks
  )

end

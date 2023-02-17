# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

product = Product.create(
        name: "Women's Cartoon Astrounaut T-Shirts", 
        desc: "Lorem ipsum, dolor sit amet consectetur adipisicing elit. 
        Ratione, sit magnam? At quod sapiente nihil delectus suscipit consequuntur nulla neque fuga rerum! 
        Debitis repellendus quo maxime rerum, asperiores harum minus!", 
        price: 13900, 
        stock: 999, 
        category_id: 3, 
        brand: "Adidas",
        stars: 5,
        )
product.images.attach(io: File.open(Rails.root.join('frontend/src/assets/img/products/f1.jpg')), filename: "f1.jpg")
product.images.attach(io: File.open(Rails.root.join('frontend/src/assets/img/products/f2.jpg')), filename: "f2.jpg")
product.images.attach(io: File.open(Rails.root.join('frontend/src/assets/img/products/f3.jpg')), filename: "f3.jpg")
product.images.attach(io: File.open(Rails.root.join('frontend/src/assets/img/products/f4.jpg')), filename: "f4.jpg")
product.images.attach(io: File.open(Rails.root.join('frontend/src/assets/img/products/f5.jpg')), filename: "f5.jpg")

product = Product.create(
        name: "Men's Cartoon Astronaut Print Short Sleeve T-shirt", 
        desc: "Lorem ipsum, dolor sit amet consectetur adipisicing elit. 
        Ratione, sit magnam? At quod sapiente nihil delectus suscipit consequuntur nulla neque fuga rerum! 
        Debitis repellendus quo maxime rerum, asperiores harum minus!", 
        price: 7599, 
        stock: 999, 
        category_id: 3, 
        brand: "Nike",
        stars: 4,
        )
product.images.attach(io: File.open(Rails.root.join('frontend/src/assets/img/products/f2.jpg')), filename: "f2.jpg")
product.images.attach(io: File.open(Rails.root.join('frontend/src/assets/img/products/f3.jpg')), filename: "f3.jpg")
product.images.attach(io: File.open(Rails.root.join('frontend/src/assets/img/products/f4.jpg')), filename: "f4.jpg")
product.images.attach(io: File.open(Rails.root.join('frontend/src/assets/img/products/f5.jpg')), filename: "f5.jpg")
product.images.attach(io: File.open(Rails.root.join('frontend/src/assets/img/products/f6.jpg')), filename: "f6.jpg")

product = Product.create(
        name: "Cartoon Astrounaut T-Shirts", 
        desc: "Lorem ipsum, dolor sit amet consectetur adipisicing elit. 
        Ratione, sit magnam? At quod sapiente nihil delectus suscipit consequuntur nulla neque fuga rerum! 
        Debitis repellendus quo maxime rerum, asperiores harum minus!", 
        price: 8999, 
        stock: 999, 
        category_id: 2, 
        brand: "Puma",
        stars: 2,
        )
product.images.attach(io: File.open(Rails.root.join('frontend/src/assets/img/products/f8.jpg')), filename: "f8.jpg")
product.images.attach(io: File.open(Rails.root.join('frontend/src/assets/img/products/n1.jpg')), filename: "n1.jpg")
product.images.attach(io: File.open(Rails.root.join('frontend/src/assets/img/products/n2.jpg')), filename: "n2.jpg")
product.images.attach(io: File.open(Rails.root.join('frontend/src/assets/img/products/n3.jpg')), filename: "n3.jpg")

product = Product.create(
        name: "Men's Fashion T-Shirt", 
        desc: "Lorem ipsum, dolor sit amet consectetur adipisicing elit. 
        Ratione, sit magnam? At quod sapiente nihil delectus suscipit consequuntur nulla neque fuga rerum! 
        Debitis repellendus quo maxime rerum, asperiores harum minus!", 
        price: 2999, 
        stock: 999, 
        category_id: 3, 
        brand: "Adidas",
        stars: 4,
        )
product.images.attach(io: File.open(Rails.root.join('frontend/src/assets/img/products/f6.jpg')), filename: "f6.jpg")
product.images.attach(io: File.open(Rails.root.join('frontend/src/assets/img/products/f5.jpg')), filename: "f5.jpg")
product.images.attach(io: File.open(Rails.root.join('frontend/src/assets/img/products/f4.jpg')), filename: "f4.jpg")
product.images.attach(io: File.open(Rails.root.join('frontend/src/assets/img/products/f3.jpg')), filename: "f3.jpg")
product.images.attach(io: File.open(Rails.root.join('frontend/src/assets/img/products/f2.jpg')), filename: "f2.jpg")



# Categories
Category.create(name: "Children's")
Category.create(name: "Women's")
Category.create(name: "Men's")

# Posts
post = Post.create(title: "Runway-Inspired Trends", content: "Lorem ipsum dolor sit amet, 
        consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
        Neque volutpat ac tincidunt vitae semper quis lectus nulla. Congue mauris rhoncus aenean vel 
        elit scelerisque mauris. Faucibus scelerisque eleifend donec pretium. Quis lectus nulla at volutpat. 
        Vel elit scelerisque mauris pellentesque. Nulla facilisi cras fermentum odio eu. 
        Lacus suspendisse faucibus interdum posuere lorem. Eget aliquet nibh praesent tristique magna sit amet purus. 
        Non nisi est sit amet facilisis magna etiam tempor. Diam quis enim lobortis scelerisque fermentum dui.")
post.image.attach(io: File.open(Rails.root.join('frontend/src/assets/img/blog/b4.jpg')), filename: "b4.jpg")

post = Post.create(title: "Must-Have Skater Girl Iten", content: "Lorem ipsum dolor sit amet, 
        consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
        Neque volutpat ac tincidunt vitae semper quis lectus nulla. Congue mauris rhoncus aenean vel 
        elit scelerisque mauris. Faucibus scelerisque eleifend donec pretium. Quis lectus nulla at volutpat. 
        Vel elit scelerisque mauris pellentesque. Nulla facilisi cras fermentum odio eu. 
        Lacus suspendisse faucibus interdum posuere lorem. Eget aliquet nibh praesent tristique magna sit amet purus. 
        Non nisi est sit amet facilisis magna etiam tempor. Diam quis enim lobortis scelerisque fermentum dui.")
post.image.attach(io: File.open(Rails.root.join('frontend/src/assets/img/blog/b3.jpg')), filename: "b3.jpg")

post = Post.create(title: "How to Style a Quiff", content: "Lorem ipsum dolor sit amet, 
        consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
        Neque volutpat ac tincidunt vitae semper quis lectus nulla. Congue mauris rhoncus aenean vel 
        elit scelerisque mauris. Faucibus scelerisque eleifend donec pretium. Quis lectus nulla at volutpat. 
        Vel elit scelerisque mauris pellentesque. Nulla facilisi cras fermentum odio eu. 
        Lacus suspendisse faucibus interdum posuere lorem. Eget aliquet nibh praesent tristique magna sit amet purus. 
        Non nisi est sit amet facilisis magna etiam tempor. Diam quis enim lobortis scelerisque fermentum dui.")
post.image.attach(io: File.open(Rails.root.join('frontend/src/assets/img/blog/b2.jpg')), filename: "b2.jpg")

post = Post.create(title: "The Cotton-Jersey Zip-Up Hoodie", content: "Lorem ipsum dolor sit amet, 
        consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
        Neque volutpat ac tincidunt vitae semper quis lectus nulla. Congue mauris rhoncus aenean vel 
        elit scelerisque mauris. Faucibus scelerisque eleifend donec pretium. Quis lectus nulla at volutpat. 
        Vel elit scelerisque mauris pellentesque. Nulla facilisi cras fermentum odio eu. 
        Lacus suspendisse faucibus interdum posuere lorem. Eget aliquet nibh praesent tristique magna sit amet purus. 
        Non nisi est sit amet facilisis magna etiam tempor. Diam quis enim lobortis scelerisque fermentum dui.")
post.image.attach(io: File.open(Rails.root.join('frontend/src/assets/img/blog/b1.jpg')), filename: "b1.jpg")

# Products
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

# Coupons 
Coupon.create(code: 'WELCOME10', amount_off: 1000)
Coupon.create(code: 'WELCOME25', percent_off: 25.5)



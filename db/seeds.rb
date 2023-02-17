# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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


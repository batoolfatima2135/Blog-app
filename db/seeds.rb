# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: 'Bob', bio: 'I am a influencer', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSE_o0sgG09AwJR4HzIWc5J8QiQ_lcgtfen-FMzopmY5Q&s')
user2 = User.create(name: 'Alice', bio: 'I am a teacher', photo: "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAHgAUAMBIgACEQEDEQH/xAAcAAEAAQUBAQAAAAAAAAAAAAAACAMEBQYHAgH/xAA5EAABAwMBBgIGCAcBAAAAAAABAAIDBAURIQYHEhMxQSJhFUJRcYGRFBYlMlKhwfAkQ3KCkrLhCP/EABUBAQEAAAAAAAAAAAAAAAAAAAAB/8QAFBEBAAAAAAAAAAAAAAAAAAAAAP/aAAwDAQACEQMRAD8Ar0VqAaPD2WWgtgAHhWXp6MADRXjKcDsqjFQ24fhVnerlabBEyS7VUdOH54AQS5+OuANT1C0rbPeFWUlfLFZ5WsEUzoW8bNBgYLiD1JcTjsA0HuufbWXma8XZ8r6yaqjibyopJQA5zQc5ONNSSfkiuo3beRYKOmjfQCSuleTlgHBwDzz+i1F+9S7nIZRUIy/Iy1xw38PX81oRK+KDp53qsM0P2TiLA5x5uXZxrw6Yx71vGzt5tu0lI6otshJYcSRPGHsPmP1GijwrmhrqqgmEtFUywPyPFG8tz78dUEi6ijBHRYC428OB8Kobvdso73SNobrUcVzDjwnlkB7e2XdM9f8Aq2mtpgWnRVG1Mp+EDISohD4JGZLeJhbxDqMjqr+QNI0VpWUxqKWaAP4OYws4sZxkIIwbZfaN5uFfTMaGtmLZ2ceXNcNC7BAwCfZnBGp6LWVI6/br7NeaR3Jp4LXXO/mUjA5nU+qQOvlg9slcC2hpKSgvddR2+pdU0sE7o45nNwXgHGVFY5ERAREQZ7Ym5ejNpKGUxukY6UNcxrQSc9MZ6a4+SkPVNJaSRgrhG6ks+vVubJG14eJWjPY8t2v79qkBUs8J0VGfyV5JXrhXwtRGgbQbQVbqy80k4uFJBTYhpvo0OW1Tyxr3Ay+q7hcA0ZaNerjoI8VXI58n0XjMPESzjGCB8ypHbxbFfa/Z+5U2zr2F1ZOyWePmcD3tDAxzB2weFh6joRrlRumjfDK+KVvC9ji1zT2I6qK8IiICIiDfdzFB9L2yZUOaS2jgfLnsHHwj/Y/Jd4mbotM3QbL+htnBcKlmKy4gSajVkXqt+P3viPYt3lboqjLleHKqWFeS3CCmBk49qiDfKWShvNdSTy82WCokjkkxjicHEE/NTBUc9+NvjottDLDE9oqoGzOeRo52SDj5fmiueIiKAs5saLL6ep5dpJnR26I8x7Wxl/NI6MIHY9/IH2rBogmFzGPja6MgscAWkdCO2Fbyu0Ko2OelqrJRSUNTFUwCFrBLE7LXFowfzCrSMOFUZ1eHkL65WtwrKS20j6u4VMVNTR44pZnhrRnQanzQVcZXKd7e8CipIHWO0zRS1hd/ETBvGIQOrAfxHofYFdbwN4tB6BrIdnLnBJNwcJmY8Z1IGGjv164UfFFZDaC4tut2nrI2OYyTHCw+oAMYHksciICIiDft2+8T6o01TRVlLJVUcruYwRvw6N+gPXTBAHxC7Xs7tNaNp6MT2mpa93CDJA7Ali/qb+o081FZVIJ5qaZk1PK+KVhy18bi1zT5EIJk3KupbXQT11fM2GmgYXySO6Afvt3Uc9ut6Vz2nhqLbBBBTWt79GcsOke0HILnHOD0Phx71vX/AKEu74rLR2mB4AmlEtQAdeHxcA+Ja4/2rgiAiIgIiICIiAiIg3TetezdtsLm1pzFBMIWHyjHDj/IvPxWlqtWVD6urmqZPvzSOkd7ycqigIiICIiAiIgIiICIiAiIgIiICIiAiIg//9k=")
user3 = User.create( name: 'Mark', bio: 'I am a doctor', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmghqdc48d27hR-kLlrU7i_9Dl_zZaq-SwfjvQmaEl&s')
Post.create(user: user1, title: "Post 1 of first user")
Post.create(user: user1, title: "Post 2 of first user")
Post.create(user: user1, title: "Post 3 of first user")
Post.create(user: user2, title: "Post 1 of second user")
Post.create(user: user2, title: "Post 2 of second user")
Post.create(user: user2, title: "Post 3 of second user")
Post.create(user: user2, title: "Post 4 of second user")
Post.create(user: user2, title: "Post 5 of second user")
Post.create(user: user1, title: "Post 1 of first user")
Post.create(user: user1, title: "Post 1 of first user")
Post.create(user: user3, title: "Post 1 of third user")
Post.create(user: user3, title: "Post 2 of third user")
Post.create(user: user3, title: "Post 3 of third user")
Post.create(user: user3, title: "Post 5 of third user")

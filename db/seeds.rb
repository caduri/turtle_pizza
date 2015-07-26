# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
  DoeKind.destroy_all
  Topping.destroy_all
  Image.destroy_all
  Pizza.destroy_all
  Order.destroy_all
  Admin.destroy_all
  doe_kinds = DoeKind.create([{name: "Pan"}, {name: "Thin"}, {name: "Gluten Free"}])
  toppings = Topping.create([{name: "Olives"}, {name: "Mushrooms"}, {name: "Tomatos"}, {name: "Cheese"}])
  p = Pizza.create(name: "Cheesy Bites", topping_ids: toppings[0..2].collect(&:_id), doe_kind_id: doe_kinds.first._id)
  p.images.create([{order_num: 1, remote_picture_url: 'app/assets/images/pizza1.jpeg'}, {order_num: 2, remote_picture_url: 'app/assets/images/pizza2.jpeg'}, {order_num: 3, remote_picture_url: 'app/assets/images/pizza3.jpeg'}])
  p2 = Pizza.create(name: "Crispy Bites", topping_ids: toppings[1..3].collect(&:_id), doe_kind_id: doe_kinds.first._id)
  p2.images.create([{order_num: 1, remote_picture_url: 'app/assets/images/pizza1.jpeg'}, {order_num: 2, remote_picture_url: 'app/assets/images/pizza2.jpeg'}, {order_num: 3, remote_picture_url: 'app/assets/images/pizza3.jpeg'}])
  p3 = Pizza.create(name: "Turtle Bites", topping_ids: toppings[0..2].collect(&:_id), doe_kind_id: doe_kinds.first._id)
  p3.images.create([{order_num: 1, remote_picture_url: 'app/assets/images/pizza1.jpeg'}, {order_num: 2, remote_picture_url: 'app/assets/images/pizza2.jpeg'}, {order_num: 3, remote_picture_url: 'app/assets/images/pizza3.jpeg'}])
end
a = Admin.create(email: "admin@admin.com", password: "password", password_confirmation: "password", is_admin: true)

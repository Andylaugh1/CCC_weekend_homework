require('pry')
require_relative('../models/customer.rb')
require_relative('../models/film.rb')
require_relative('../models/ticket.rb')
require_relative('../models/screening.rb')

Customer.delete_all()
Film.delete_all()
Screening.delete_all()
Ticket.delete_all()


customer1 = Customer.new({
  "name" => "Andy",
  "funds" => 30
  })
customer1.save()

customer2 = Customer.new({
  "name" => "Ali",
  "funds" => 50
  })
customer2.save()

customer3 = Customer.new({
  "name" => "Kirsty",
  "funds" => 80
  })
customer3.save()

customer4 = Customer.new({
  "name" => "Ed",
  "funds" => 100
  })
customer4.save()

film1 = Film.new({
  "title" => "The Godfather",
  "price" => 12
  })
film1.save()

film2 = Film.new({
  "title" => "Seven",
  "price" => 10
  })
film2.save()

film3 = Film.new({
  "title" => "The Good, The Bad and The Ugly",
  "price" => 8
  })
film3.save()

film4 = Film.new({
  "title" => "10 Things I Hate About You",
  "price" => 6
  })
film4.save()

ticket1 = Ticket.new({
  "customer_id" => customer3.id,
  "film_id" => film4.id
  })
ticket1.save()

ticket2 = Ticket.new({
  "customer_id" => customer1.id,
  "film_id" => film1.id
  })
ticket2.save()

ticket3 = Ticket.new({
  "customer_id" => customer2.id,
  "film_id" => film1.id
  })
ticket3.save()

ticket4 = Ticket.new({
  "customer_id" => customer4.id,
  "film_id" => film2.id
  })
ticket4.save()

ticket5 = Ticket.new({
  "customer_id" => customer2.id,
  "film_id" => film3.id
  })
ticket5.save()


screening1 = Screening.new({
  "film_id" => film1.id,
  "show_time" => '18:55'
  })
screening1.save

screening2 = Screening.new({
  "film_id" => film3.id,
  "show_time" => '19:00'
  })
screening2.save

screening3 = Screening.new({
  "film_id" => film4.id,
  "show_time" => '21:25'
  })
screening3.save

screening4 = Screening.new({
  "film_id" => film2.id,
  "show_time" => '20:15'
  })
screening4.save

screening5 = Screening.new({
  "film_id" => film1.id,
  "show_time" => '20:50'
  })
screening5.save

screening6 = Screening.new({
  "film_id" => film4.id,
  "show_time" => '16:40'
  })
screening6.save

screening7 = Screening.new({
  "film_id" => film2.id,
  "show_time" => '15:45'
  })
screening7.save

  binding.pry
  nil

class Car

	def initialize(model)
		@model = model
		@speed = 0
		@fly = false
	end

	def model
		@model
	end

	def speed
		@speed
	end

	def drive
		@speed = @speed + 20
	end

	def rocket_launcher
		@speed = @speed - 40
	end

	def fly
		@speed = @speed -20
	end


end

puts "Do you want to buy a new car? -> buy"
action = gets.chomp

if action == "buy"
	puts "What car did you buy?"
	car_model = gets.chomp.to_s
	car = Car.new(car_model)
	puts "You bought a #{car.model}"
end

while action != "park" 

	actions = ["park", "drive", "rocket", "fly", "land"]

	puts "What are you going to do? " + actions.to_s
	action = gets.chomp

	if action == "drive"
		if car.speed == 120
			puts "You broke down, i guess you pushed your #{car.model} too hard."
			exit
		end
		car.drive
		puts "You are driving at #{car.speed} mph"
	end

	if action == "rocket"
		if car.speed <= 40
			puts "You were driving too slowly so you blew up!"
			exit
		else
			car.rocket_launcher
			puts "You fired a rocket launcher BOOM!"
			puts "You feel like James Bond."
			puts "Your speed is now #{car.speed} mph"
		end
	end

	if action == "fly"
		if @fly == true
			puts "You are in the air already!"
		elsif car.speed >= 60
			car.fly
			@fly = true
			puts "You take off into the air! Your speed is #{car.speed}!"
		else
			puts "You are too slow to take off!"
		end
	end

	if action == "land"
		if @fly == true 
			@fly = false
			puts "You landed safely on the ground!"
		else
			puts "Yeah you are on it!"
		end
	end

	if action == "park"
		@fly = false
		@speed = 0
		puts "You parked up."
	end

end




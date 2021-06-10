def do_game(change)
	door0 = door1 = door2 = 0
	hit = rand(3)
	if hit == 0
		door0 = 1
	elsif hit == 1
		door1 = 1
	else 
		door2 = 1
	end

	if change
		if door1 == 0
			return door2
		else
			return door1
		end
	end

	door0
end

def do_game_more(change)
	door0 = door1 = door2 = door3 = 0
	hit= rand(4)
	if hit == 0
		door0 = 1
	elsif hit == 1
		door1 = 1
	elsif hit == 2
		door2 = 1
	else
		door3 = 1
	end

	if change
		if door1 == 0
			if door2 == 0
				return door3
			else
				return door2
			end

		elsif door2 == 0
			if door3 == 0
				return door1
			else
				return door3
			end
		elsif door3 == 0
			if door2 == 0
				return door1
			else
				return door2
			end
		end
	end
	
	return door0
end


def winning_percentage(games, change)
	won = 0
	for i in (1..games)
		won += do_game(change)
	end
	won / Float(games)
end


def winning_percentage_more(games,change)
	won = 0
	for i in (1..games)
		won += do_game_more(change)
	end
	won / Float(games)
end


GAMES = 100000
puts("change: #{winning_percentage(GAMES, true)}, no-change: #{winning_percentage(GAMES, false)}")
puts("more change: #{winning_percentage_more(GAMES, true)}, no-change-more: #{winning_percentage_more(GAMES,false)}")
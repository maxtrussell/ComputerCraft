os.loadAPI("/lib/fuel.lua")
os.loadAPI("/lib/inv.lua")

moved = 0
-- dig until out of fuel or inventory full
while fuel.refuel() and not inv.isFull() do
	-- dig 2 steps of a 2x1 tunnel
	turtle.dig()
	turtle.up()
	turtle.dig()
	turtle.forward()
	turtle.dig()
	turtle.down()
	turtle.dig()
	turtle.forward()
	-- assume that everything worked bc I'm lazy
	moved = moved + 2
end

-- turn around
turtle.turnLeft()
turtle.turnLeft()

-- return to start position if fuel permits
while fuel.refuel() and moved > 0 do
	if turtle.forward() then
		moved = moved - 1
	else
		-- gravel could fall and obstruct the path
		turtle.dig()
	end
end

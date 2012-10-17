--[[
	This code is MIT licensed, see http://www.opensource.org/licenses/mit-license.php
	(C) 2010 - 2012 Elias York 

	This code provides an example of using the findCentroid() function to position 
	text labels at the center of polygons without manual calculations. 
	(A second function is provided to fidn the area of any polygon findPolygonArea())
		
	Please feel to use this code in your projects and games etc. 
]]

-- Set some default application settings to make sure it's the same for everyone.
application:setKeepAwake(true)
application:setOrientation("portrait")
application:setLogicalDimensions(320, 480)

-- A simple function since I wanted to use more then one Polygon as an example.
function drawExamplePoly(x, y, points, label, line_color)
	-- Draw the shape for example.
	local shape = Shape.new()
		
	shape:setFillStyle(Shape.SOLID, 0x00FFFF, 0.5)	
	shape:setLineStyle(3, (line_color or 0x000000))
	shape:beginPath()

	for i,pt in ipairs(points) do				
		shape:lineTo(pt.x, pt.y)		
	end

	shape:closePath()
	shape:endPath()

	-- Find the center points for this polygon.
	local cent = findCentroid(points)

	-- For an example place a text label on the polygon's center points 
	-- adjusted for text width and height.
	local t1 = TextField.new(nil, label)
	t1:setX(cent.x - t1:getWidth()/2)
	t1:setY(cent.y + t1:getHeight()/2)
	shape:addChild(t1)

	-- Add shape and text label to scene.
	stage:addChild(shape)
	
	-- Position the whole thing as desired.
	shape:setPosition(x, y)
	
	-- Output the centroid points in case someone wants to check them. :)
	print(label..":", "Center X: "..cent.x, "Center Y: "..cent.y, "# Points: "..table.getn(points))
end

-- Simple Polygon for example.
local poly = {
	{x=200, y=100},
    {x=100, y=243},
    {x=0, y=294},
    {x=000, y=21},
	{x=200, y=61},
    {x=50, y=69}
}

-- Another simple Polygon for example.
local poly2 = {
	{x=0, y=100},
    {x=100, y=50},
    {x=100, y=100}
}

-- A third simple Polygon for example.
local poly3 = {
	{x=0, y=100},
    {x=100, y=100},
    {x=100, y=0}, 
	{x=0, y=0} 
}

-- Draw out the examples.
drawExamplePoly(115, 120, poly, "Poly 1", 0x000000)
drawExamplePoly(5, 220, poly2, "Poly 2", 0xFF0000)
drawExamplePoly(50, 30, poly3, "Poly 3", 0x0000FF)

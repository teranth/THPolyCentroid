--[[
	This code is MIT licensed, see http://www.opensource.org/licenses/mit-license.php
	(C) 2010 - 2012 Elias York 

	This code was based on math formula and example ideas found at: 
		http://local.wasp.uwa.edu.au/~pbourke/geometry/polyarea/		
	
	Please feel to use this code in your projects and games. 
]]

--[[
	The purpose of this function is to take a set of polygon points and to find 
	area of the described polygon. 
	
	Arguments: this function looks for a lua table of {x, y} entries for polygon points.
]]
function findPolygonArea(points)
	local polygon_area = 0
   
    -- Go through all the points.
	for i,pt in ipairs(points) do		
		local pt2 = 0
		
		-- If this is the first run, use the last point's data, 
		-- otherwise use one point behind current counter.
		if (i == 1) then
			pt2 = points[ table.getn(points) ]
		else
			pt2 = points[i-1]		
		end		
		
		-- Only calculate if we have valid data.
		if pt2 ~= nil then
			polygon_area = polygon_area + (pt.x*pt2.y)
			polygon_area = polygon_area - (pt.y*pt2.x)
		end
		
	end	
	
	-- Divide the results to get polygon's area.
	return (polygon_area / 2)

end

--[[
	This function will find the centroid of a polygon shape and is useful if you want to 
	place a label etc on a polygon of various shapes.
	
	Arguments: this function looks for a lua table of {x, y} entries for polygon points.
]]
function findCentroid(points)		
	local polygon_area 		= 	0
	local cent_x 			=	0
	local cent_y			=	0
	local sec_fac			=	0	

	-- Go through all the points.
	for i,pt in ipairs(points) do		
		local pt2 = 0
		
		-- If this is the first run, use the last point's data, 
		-- otherwise use one point behind current counter.
		if (i == 1) then
			pt2 = points[ table.getn(points) ]
		else
			pt2 = points[i-1]		
		end		
		
		-- Calculate only on valid data.
		if pt2 ~= nil then
			
			sec_fac = (pt.x * pt2.y) - (pt2.x * pt.y)
			cent_x = cent_x + ((pt.x + pt2.x) * sec_fac)
			cent_y = cent_y + ((pt.y + pt2.y) * sec_fac)			
			
		end		
	end	
	
	-- Multiple polygon area by 6.
	sec_fac = findPolygonArea(points) * 6
	
	-- Divide results for the final centroid points.
	return {x = (cent_x / sec_fac), y = (cent_y / sec_fac)}
end
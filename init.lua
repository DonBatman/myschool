local cbox = {{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}

local cboard_box = {{-0.5, -0.5, 0.45, 1.5, 0.5, 0.5}}

local chair_box = {{-0.4, -0.5, -0.2, 0.4, 0.2, 0.4},
					{-0.4, 0, 0.3, 0.4, 0.7, 0.4}}

local desk_box = {{-0.5, -0.5, -0.25, 0.5, 0.4, 0.5}}

local schair_box = {{-0.3, -0.5, -0.3, 0.3, 0, 0.3}}

local tdesk_box = {{-0.5, -0.5, -0.5, 1.5, 0.5, 0.5}}

local fe_box = {{-0.2, -0.5, 0.2, 0.2, 0.2, 0.5}}

local fel_box = {{-0.3, -0.5, 0.1, 0.3, 0.5, 0.5}}

local book_box = {{-0.5, -0.5, 0, 0.5, 0.5, 0.5}}

local poster_box = {{-0.3, -0.5, 0.48, 0.3, 0.5, 0.5}}

local clock_box = {{-0.4, -0.4, 0.4, 0.4, 0.4, 0.5}}

local bell_box = {{-0.3, -0.3, 0.4, 0.3, 0.3, 0.5}}

local map_box = {{-0.5, -0.5, 0.48, 1.5, 0.5, 0.5}}

local lockers_box = {{-0.5, -0.5, 0, 0.5, 1.5, 0.5}}

local exit_box = {{-0.25, 0.1, -0.1, 0.25, 0.5, 0.1}}

local light_box = {{-0.5, 0.48, -0.3, 0.5, 0.5, 0.3}}

local trash_box = {{-0.3, -0.5, -0.3, 0.3, 0.1, 0.3}}

local ceiling_box = {{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}

local window_box = {{-0.5, -0.5, -0.1, 0.5, 0.5, 0.1}}

local door_box = {{-0.5, -0.5, -0.1, 0.5, 1.5, 0.1}}

local door2_box = {{-0.5, -0.5, 0, -0.3, 1.5, 1}}

local fountain_box = {{-0.3, -0.1, 0, 0.3, 0.5, 0.5}}

local book_box = {{-0.3, -0.5, -0.3, 0.3, -0.3, 0.3}}


local nodes = {--name, description, texture, model, selection_box/collision_box
			{"chalkboard", "Chaulkboard", "chalkboard", "chalkboard", cboard_box},
			{"chair", "Chair", "chair", "chair", chair_box},
			{"school_desk_chair", "School Desk Chair", "school_desk_chair", "school_desk_chair", schair_box},
			{"school_desk_chair2", "School Desk Chair 2", "school_desk_chair2", "school_desk_chair", schair_box},
			{"school_desk", "School Desk", "school_desk", "school_desk", desk_box},
			{"reception", "Reception", "reception", "reception", tdesk_box},
			{"teacher_desk", "Teacher Desk", "teacher_desk", "teacher_desk", tdesk_box},
			{"fire_extinguisher", "Fire Extinguisher", "fire_extinguisher", "fire_extinguisher", fe_box},
			{"fire_extinguisher_large", "Large Fire Extinguisher", "fire_extinguisher", "fire_extinguisher_large", fel_box},
			{"bookshelf", "Bookshelf", "bookshelf", "bookshelf", book_box},
			{"poster1", "Poster 1", "poster1", "poster", poster_box},
			{"poster2", "Poster 2", "poster2", "poster", poster_box},
			{"poster3", "Poster 3", "poster3", "poster", poster_box},
			{"poster4", "Poster 4", "poster4", "poster", poster_box},
			{"clock", "Clock", "clock", "clock", clock_box},
			{"fire_bell", "Fire Bell", "fire_bell", "fire_bell", bell_box},
			{"map", "Map", "map", "map", map_box},
			{"lockers", "Lockers", "lockers", "lockers", lockers_box},
			{"exit_sign", "Exit Sign", "exit", "exit", exit_box},
			{"light", "Light", "light", "light", light_box},
			{"trash_can", "Trash Can", "trash_can", "trash_can", trash_box},
			{"ceiling", "Ceiling/Floor", "ceiling", "ceiling", ceiling_box},
			{"bookshelf_full_1", "Bookshelf", "bookshelf_full_1", "bookshelf_full_1", book_box},
			{"bookshelf_full_2", "Bookshelf", "bookshelf_full_2", "bookshelf_full_2", book_box},
			{"bookshelf_full_3", "Bookshelf", "bookshelf_full_3", "bookshelf_full_3", book_box},
			{"window", "Window", "window", "window", window_box},
			{"door", "Door", "door", "door", door_box},
			{"door2", "Door", "door", "door2", door2_box},
			{"fountain", "Fountain", "fountain", "fountain", fountain_box},
			{"book_open", "Open Book", "book_open", "book_open", book_box},
			}

for i in ipairs(nodes) do
	local nam = nodes[i][1]
	local des = nodes[i][2]
	local img = nodes[i][3]
	local mod = nodes[i][4]
	local box = nodes[i][5]

core.register_node("myschool:"..nam,{
	description = des,
	tiles = {"myschool_"..img..".png"},
	drawtype = "mesh",
	mesh = "myschool_"..mod..".obj",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 1, choppy = 1, oddly_breakable_by_hand = 1},
	selection_box = {
		type = "fixed",
		fixed = box
		},
	collision_box = {
		type = "fixed",
		fixed = box
		},
})
end

minetest.override_item("myschool:exit_sign",{
	light_source = 8,})	
minetest.override_item("myschool:light",{
	light_source = 14,})	
minetest.override_item("myschool:window",{
	use_texture_alpha = "blend",})
minetest.override_item("myschool:door",{
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		core.set_node(pos,{name="myschool:door2", param2 = node.param2})
	end})
minetest.override_item("myschool:door2",{
	groups = {cracky = 1, choppy = 1, oddly_breakable_by_hand = 1, not_in_creative_inventory=1},
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		core.set_node(pos,{name="myschool:door", param2 = node.param2})
	end})

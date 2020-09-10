if mods["space-exploration"] and mods["Krastorio2"] then   
    
    -- adds a prerequisite to a technology
    local function addPrerequisite(tech, prerequisiteName)
        -- check if the prerequisite already exists
        for _, prereq in pairs(tech.prerequisites) do
            if prereq == prerequisiteName then
                return
            end				
        end
        -- add prerequisite to the technology
        table.insert(tech.prerequisites, prerequisiteName)
    end
	
    -- adds an ingredient to a technology
    local function addIngredient(tech, ingredientName, ingredientCount)
        -- check if the ingredient already exists
        for _,ingredient in pairs(tech.unit.ingredients) do
            if ingredient.name == ingredientName then
                return
            end				
        end
        -- add ingredient to the technology
        table.insert(tech.unit.ingredients, {ingredientName, ingredientCount})
    end

	
    local tech = data.raw.technology["spidertron"]

    -- repeat the changes that SE made that got overwritten by Krastorio 2
    addIngredient(tech, "se-rocket-science-pack", 1)
    addIngredient(tech, "se-biological-science-pack-1", 1)
    addIngredient(tech, "se-material-science-pack-1", 1) 

    -- remove AI Core tech as prerequisite since SE changes the recipe to no longer require it
	for i, prereq in pairs(tech.prerequisites) do
		if prereq == "kr-ai-core" then
			table.remove(tech.prerequisites, i)
			break
		end				
    end
    
    -- re-add the prerequisites that got overwritten by Krastorio 2
    addPrerequisite(tech, "se-biological-science-pack-1")
    addPrerequisite(tech, "se-biological-science-pack-1")
    -- addPrerequisite(tech, "se-rocket-science-pack")      
    -- addPrerequisite(tech, "se-material-science-pack-1")
        -- not needed because they are already prerequisites of Heavy Glider technology

end



--VARIABLES
local missionselect_scaleform
local instructional_button_scaleform
local global_scaleform_data

local show_next_job_selection = false

local already_voted = false
local voted_for = -1

local player_list_shown = false

local votes = {
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
}

AddEventHandler('slt_missionselect:CreateMenu', function(scaleform_data)

    if not IsPlayerSwitchInProgress() then
        SwitchOutPlayer(GetPlayerPed(-1), 0, 1)
    end

    global_scaleform_data = scaleform_data
    Citizen.CreateThread(function()

        if not HasStreamedTextureDictLoaded("cardimages") then
            RequestStreamedTextureDict("cardimages")
            while not HasStreamedTextureDictLoaded("cardimages") do Citizen.Wait(0) end
        end

        instructional_button_scaleform = create_instructional_buttons()

        missionselect_scaleform = Scaleform.Request('MP_NEXT_JOB_SELECTION')
        Scaleform.CallFunction(
            missionselect_scaleform, --scaleform_handle
            false, --no return data
            "SET_TITLE", --function
            scaleform_data.left_title, --title
            scaleform_data.right_title --right title
        )
        
        for i = 1, #scaleform_data.cards do
            Scaleform.CallFunction(
                missionselect_scaleform, --scaleform_handle
                false, --no return data
                "SET_GRID_ITEM", --function
                i - 1, --id
                scaleform_data.cards[i].title, --card title
                scaleform_data.cards[i].txd, --card texture dictionary
                scaleform_data.cards[i].txn, --card texture name
                1, --texture load type
                0, --verified type
                scaleform_data.cards[i].icon, --e icon
                false, --b check
                scaleform_data.cards[i].rp_multiplier, --rp multiplier
                scaleform_data.cards[i].cash_multiplier, --cash multiplier
                false, --d disabled
                scaleform_data.cards[i].icon_color, --icon color
                scaleform_data.cards[i].ap_multiplier --ap multiplier
            )
        end

        for i = 1, #scaleform_data.buttons do
            Scaleform.CallFunction(
                missionselect_scaleform, --scaleform_handle
                false, --no return data
                "SET_GRID_ITEM", --function
                i + 5, --id
                scaleform_data.buttons[i].title, --card title
                "", --card texture dictionary
                "", --card texture name
                -1, --texture load type
                -1, --verified type
                -1, --e icon
                false, --b check
                -1, --rp multiplier
                -1, --cash multiplier
                false, --d disabled
                1, --icon color
                -1 --ap multiplier
            )
        end

        Scaleform.CallFunction(
            missionselect_scaleform, --scaleform_handle
            false, --no return data
            "SET_SELECTION", --function
            0, --card_index
            scaleform_data.cards[1].title, --card title
            scaleform_data.cards[1].description, --card details,
            false --hide highlight
        )

        for i = 1, #scaleform_data.cards[1].details do
            Scaleform.CallFunction(
                missionselect_scaleform, --scaleform_handle
                false, --no return data
                "SET_DETAILS_ITEM", --function
                i - 1, --card_index
                0, --menu_id
                0, --unique_id
                scaleform_data.cards[1].details[i].type, --type (1 | normal text, 2 | with icon, 3 | with crew tag, 4 | with border, 5 | multiline)
                0, --initial_index
                0, --is_selectable
                scaleform_data.cards[1].details[i].left_text,
                scaleform_data.cards[1].details[i].right_text
            )
        end

        show_next_job_selection = true

    end)
end)

function toggle_player_list()
    --CODE FOR DISPLAYING A PLAYER LIST ON THE RIGHT SIDE INSTEAD OF CARDS 3, 6 AND 9
    if player_list_shown then
        Scaleform.CallFunction(
            missionselect_scaleform, --scaleform_handle
            false, --no return data
            "SET_LOBBY_LIST_VISIBILITY", --function
            false
        )

        Scaleform.CallFunction(
            missionselect_scaleform, --scaleform_handle
            false, --no return data
            "SET_ITEMS_GREYED_OUT", --function
            false
        )
    else
        for _, player in ipairs(GetActivePlayers()) do
            local ped = GetPlayerPed(player)
            
            local tmp = RegisterPedheadshot(ped)
    
            while not IsPedheadshotReady(tmp) do
                Citizen.Wait(0)
            end
    
            local headshot = "";
            if IsPedheadshotValid(tmp) then
                headshot = GetPedheadshotTxdString(tmp)
            end
    
            Scaleform.CallFunction(
                missionselect_scaleform, --scaleform_handle
                false, --no return data
                "SET_LOBBY_LIST_DATA_SLOT_EMPTY", --function
                _ - 1
            )
    
            Scaleform.CallFunction(
                missionselect_scaleform, --scaleform_handle
                false, --no return data
                "SET_LOBBY_LIST_DATA_SLOT", --function
                _ - 1,
                0,
                0,
                2,
                GetPlayerServerId(player), --rank
                true,
                GetPlayerName(player) .. "          ", --player_name
                116, --color
                false, --left_bar_color
                0, --player_status_icon (47,48,49,54,63,64,65,66)
                65, --icon (only 65 works)
                0, --not used
                "(*0SLT#0400FF", --crew_tag
                0, --kick
                "", --status
                18, --status_color
                headshot, --param10
                headshot --param11
            )
        end
    
        Scaleform.CallFunction(
            missionselect_scaleform, --scaleform_handle
            false, --no return data
            "SET_ITEMS_GREYED_OUT", --function
            true
        )

        Scaleform.CallFunction(
            missionselect_scaleform, --scaleform_handle
            false, --no return data
            "SET_LOBBY_LIST_VISIBILITY", --function
            true
        )
    
        Scaleform.CallFunction(
            missionselect_scaleform, --scaleform_handle
            false, --no return data
            "DISPLAY_LOBBY_LIST_VIEW" --function
        )
    end
end

function update_selection(selected_card) 
    if selected_card <=5 then
        Scaleform.CallFunction(
            missionselect_scaleform, --scaleform_handle
            false, --no return data
            "SET_SELECTION", --function
            selected_card, --card_index
            global_scaleform_data.cards[selected_card + 1].title, --card title
            global_scaleform_data.cards[selected_card + 1].description, --card details,
            false --hide highlight
        )

        for i = 1, #global_scaleform_data.cards[selected_card + 1].details do
            Scaleform.CallFunction(
                missionselect_scaleform, --scaleform_handle
                false, --no return data
                "SET_DETAILS_ITEM", --function
                i - 1, --card_index
                0, --menu_id
                0, --unique_id
                global_scaleform_data.cards[selected_card + 1].details[i].type, --type (1 | normal text, 2 | with icon, 3 | with crew tag, 4 | with border, 5 | multiline)
                0, --initial_index
                0, --is_selectable
                global_scaleform_data.cards[selected_card + 1].details[i].left_text,
                global_scaleform_data.cards[selected_card + 1].details[i].right_text
            )
        end
    else
        Scaleform.CallFunction(
            missionselect_scaleform, --scaleform_handle
            false, --no return data
            "SET_SELECTION", --function
            selected_card, --card_index
            global_scaleform_data.buttons[selected_card - 5].title, --card title
            "", --card details,
            false --hide highlight
        )
    end
end

function update_own_vote()
    if already_voted then
        for i = 0, 8, 1 do
            Scaleform.CallFunction(
                missionselect_scaleform, --scaleform_handle
                false, --no return data
                "SET_GRID_ITEM_VOTE", --function
                i, --card_index
                votes[voted_for + 1], --number_of_votes
                6, --votes_background_color
                false, --show_checkmark (self_voted)
                false --flash_background
            )
        end

        Scaleform.CallFunction(
            missionselect_scaleform, --scaleform_handle
            false, --no return data
            "SET_GRID_ITEM_VOTE", --function
            voted_for, --card_index
            votes[voted_for + 1] + 1, --number_of_votes
            6, --votes_background_color
            true, --show_checkmark (self_voted)
            false --flash_background
        )
    else
        Scaleform.CallFunction(
            missionselect_scaleform, --scaleform_handle
            false, --no return data
            "SET_GRID_ITEM_VOTE", --function
            voted_for, --card_index
            votes[voted_for + 1] + 1, --number_of_votes
            6, --votes_background_color
            true, --show_checkmark (self_voted)
            false --flash_background
        )
    end

        Scaleform.CallFunction(
            missionselect_scaleform, --scaleform_handle
            false, --no return data
            "SET_TITLE", --function
            global_scaleform_data.left_title, --title
            "1 / 2 Votes" --right title
        )
end

function send_vote_to_server()

end

function update_vote_on_server(old_voted_for)

end

Citizen.CreateThread(function()

    local selected_card = 0;

    while true do
        Citizen.Wait(0)
        if show_next_job_selection then
            HideHudAndRadarThisFrame()
            DrawScaleformMovieFullscreen(missionselect_scaleform, 255, 255, 255, 255)
            DrawScaleformMovieFullscreen(instructional_button_scaleform, 255, 255, 255, 255, 0)
        end

        if IsControlJustPressed(0, 172) then --UP
            if selected_card - 3 >= 0 and selected_card - 3 <= 8 then
                selected_card = selected_card - 3
                update_selection(selected_card)
            end
        elseif IsControlJustPressed(0, 173) then --DOWN
            if selected_card + 3 >= 0 and selected_card + 3 <= 8 then
                selected_card = selected_card + 3
                update_selection(selected_card)
            end
        elseif IsControlJustPressed(0, 174) then --LEFT
            if selected_card - 1 >= 0 and selected_card - 1 <= 8 then
                selected_card = selected_card - 1
                update_selection(selected_card)
            end
        elseif IsControlJustPressed(0, 175) then --RIGHT
            if selected_card + 1 >= 0 and selected_card + 1 <= 8 then
                selected_card = selected_card + 1
                update_selection(selected_card)
            end
        elseif IsControlJustPressed(0, 176) then --ENTER
            if already_voted then
                old_voted_for = voted_for
                voted_for = selected_card
                update_vote_on_server(old_voted_for)
                update_own_vote()
            else
                already_voted = true
                voted_for = selected_card
                send_vote_to_server()
                update_own_vote()
            end
        elseif IsControlJustPressed(2, 192) then --TAB
            if player_list_shown then
                player_list_shown = false
            else
                player_list_shown = true
            end
            toggle_player_list()
        elseif IsControlJustPressed(2, 322) then --ESC
            show_next_job_selection = false
            SwitchInPlayer(GetPlayerPed(-1))
        end
    end
end)
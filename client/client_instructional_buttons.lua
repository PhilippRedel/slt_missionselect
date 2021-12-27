local instructional_button_scaleform

function create_instructional_buttons()
    instructional_button_scaleform = Scaleform.Request('INSTRUCTIONAL_BUTTONS')

    DrawScaleformMovieFullscreen(instructional_button_scaleform, 255, 255, 255, 0, 0)

    Scaleform.CallFunction(
        instructional_button_scaleform, --scaleform_handle
        false, --no return data
        "CLEAR_ALL" --function
    )

    Scaleform.CallFunction(
        instructional_button_scaleform, --scaleform_handle
        false, --no return data
        "SET_CLEAR_SPACE", --function
        200
    )

    Scaleform.CreateInstructionalButton(instructional_button_scaleform, 2, 2, 322, "Quit")
    Scaleform.CreateInstructionalButton(instructional_button_scaleform, 1, 2, 191, "Vote")
    Scaleform.CreateInstructionalButton(instructional_button_scaleform, 0, -1, -1, "Continuing (0:35)")

    Scaleform.CallFunction(
        instructional_button_scaleform, --scaleform_handle
        false, --no return data
        "DRAW_INSTRUCTIONAL_BUTTONS" --function
    )

    Scaleform.CallFunction(
        instructional_button_scaleform, --scaleform_handle
        false, --no return data
        "SET_BACKGROUND_COLOUR", --function
        0,
        0,
        0,
        80
    )

    return instructional_button_scaleform
end
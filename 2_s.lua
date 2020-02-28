local timerVar
local n = 5 -- минуты для таймера

addCommandHandler( "beginTimer", function( thePlayer )
	if timerVar then
		outputChatBox( "Таймер уже считает!", thePlayer )
		return
	end

	timerVar = setTimer( function()
		local tPlayers = getElementsByType( "player" )
		local count = getPlayerCount()

		for _, player in pairs( tPlayers ) do
			triggerClientEvent( player, "testingJSON:onGenerateNumber", resourceRoot, count )
		end

		timerVar = nil
	end, n * 1000, 1 )
end )

addEvent( "testingJSON:onPrintGeneratedNumber", true )
addEventHandler( "testingJSON:onPrintGeneratedNumber", resourceRoot, function( generatedNumber )
	outputChatBox( "Ваше сгенерированное число = " .. tostring( generatedNumber ), client )
end )
//Main Tables
nz.Players = {}
nz.Players.Functions = {}
nz.Players.Data = {}

//_ Variables

//Stops players from moving if downed
hook.Add( "SetupMove", "FreezePlayersDowned", function( ply, mv, cmd )
	if !ply:GetNotDowned() then
		mv:SetUpSpeed( 0 )
		cmd:SetUpMove( 0 )
		mv:SetSideSpeed( 0 )
		cmd:SetSideMove( 0 )
		mv:SetForwardSpeed( 0 )
		cmd:SetForwardMove( 0 )
		if cmd:KeyDown( IN_JUMP ) then
			cmd:RemoveKey( IN_JUMP )
		end
		if cmd:KeyDown( IN_DUCK ) then
			cmd:RemoveKey( IN_DUCK )
		end
	end
end )

hook.Add("PlayerSpawn", "SetupHands", function(ply)
	ply:SetupHands()
end)

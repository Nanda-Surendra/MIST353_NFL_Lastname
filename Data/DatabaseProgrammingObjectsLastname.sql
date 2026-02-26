-- 3 queries
-- 1 each for ConferenceDivision and Team tables, and 1 join query

use MIST353_NFL_RDB_Lastname;

/*
1. User searches for teams using Conference name (optional) and / or Division name (optional)
To show: TeamName, ConferenceName, DivisionName
*/

go



create or alter procedure procGetTeamsByConferenceDivision
(
    @ConferenceName NVARCHAR(50) = null,
    @DivisionName NVARCHAR(50) = null
)
AS
begin
    select TeamName, TeamColors, Conference, Division
    from Team T inner join ConferenceDivision C
        on T.ConferenceDivisionID = C.ConferenceDivisionID
    where Conference = IsNull(@ConferenceName, Conference)
        and Division = IsNull(@DivisionName, Division)
end
/*
execute procGetTeamsByConferenceDivision
    @ConferenceName = 'AFC',
    @DivisionName = 'North';
*/



go

select * from Team;

declare @myTeamName nvarchar(50) = 'Pittsburgh Steelers';

select OtherTeam.TeamName
from Team MyTeam inner join Team OtherTeam
    on MyTeam.ConferenceDivisionID = OtherTeam.ConferenceDivisionID 
where MyTeam.TeamName = @myTeamName and
    OtherTeam.TeamName != @myTeamName; 
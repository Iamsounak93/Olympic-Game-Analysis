SELECT
		[ID],
		[Name] AS 'Competitor Name',
		CASE WHEN Sex = 'M' THEN 'Male' ELSE 'Female' END AS Sex, --Better name for filters and visualisation
		[Age],
		CASE  WHEN [Age] < 18 THEN 'Under 18'
			  WHEN [Age] BETWEEN 18 and 25 then '18-25'
			  when [Age] between 25 and 30 then '25-30'
			  when [Age] > 30 then 'Over 30'
		END AS [Age Grouping],
		[Height],
		[Weight],
		[NOC] as 'Nation Code', -- Explained abbreviation 
		charindex(' ', Games) - 1 as 'Example 1',
		CHARINDEX(' ', REVERSE(Games)) - 1 as 'Example 2',
		LEFT(Games, CHARINDEX(' ', Games)-1) as 'Year', -- Split column to isolate Year, based on space
		RIGHT(Games, CHARINDEX(' ', reverse(Games))-1) AS 'Season', -- Split column to isolate Season, based on space 
		[Games],
--		[City],
		[Sport],
		[Event],
		Case when Medal = 'NA' Then 'Not Registered' else Medal end as Medal -- Replaced NA with Not Registered
	From [olympic_games].[dbo].[athletes_event_results]
	where RIGHT(Games, CHARINDEX(' ', reverse(Games))-1) = 'Summer' -- where clause to filter Summer season
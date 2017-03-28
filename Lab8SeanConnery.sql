select *

From People P Inner Join Director D on D.Pid = P.Pid
			  Inner Join Positions P on P.Pid = P.Pid
			  Where D.Pid = P.Pid and P.Pid = 'p001'
;
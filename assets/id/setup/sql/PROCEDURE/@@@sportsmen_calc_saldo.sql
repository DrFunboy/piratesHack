(IN `insportsmen` int) MODIFIES SQL DATA 
BEGIN
	UPDATE @@@sportsmen s set s.saldo = 
		IFNULL((SELECT SUM(p.`sum`) FROM @@@pay p WHERE p.sportsmen = s.id AND p.payd = 1), 0)
		- IFNULL((SELECT SUM(i.`sum`) FROM @@@invoice i WHERE i.sportsmen = s.id), 0)
	WHERE s.id = insportsmen;
END
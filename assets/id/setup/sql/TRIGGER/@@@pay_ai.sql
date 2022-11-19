AFTER INSERT ON `@@@pay` FOR EACH ROW
IF (NEW.`sum`<>0 AND NEW.payd=1) THEN
	CALL @@@sportsmen_calc_saldo(NEW.`sportsmen`);
	IF (NEW.`sum`>0) THEN
		CALL @@@invoice2pay(NEW.`sportsmen`, NEW.`sum`, 0, NEW.`id`);
	END IF;
END IF
AFTER UPDATE ON `@@@pay` FOR EACH ROW
IF (NEW.`sum`<>OLD.`sum` OR NEW.`payd` <> OLD.`payd`) THEN
    DELETE FROM @@@invoicepay WHERE idpay = OLD.id;
    CALL @@@sportsmen_calc_saldo(NEW.`sportsmen`);

	IF (NEW.`sum` > 0) THEN
		CALL @@@invoice2pay(NEW.`sportsmen`, NEW.`sum`, 0, NEW.`id`);
	ELSE
		CALL @@@invoice2pay(NEW.`sportsmen`, 0, 0, 0);
	END IF;
END IF
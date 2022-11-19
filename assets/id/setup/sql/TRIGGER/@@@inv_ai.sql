AFTER INSERT ON `@@@invoice` FOR EACH ROW
BEGIN
	IF (NEW.`sum` > 0) THEN
		CALL @@@sportsmen_calc_saldo(NEW.`sportsmen`);
		#CALL @@@invoicepay_recalc(NEW.`sportsmen`);
		CALL @@@invoice2pay(NEW.`sportsmen`, NEW.`sum`, NEW.`id`, 0);
	END IF;
	IF NEW.`duedate` IS NOT NULL THEN
		CALL @@@invoice2lesson(NEW.`sportsmen`, NEW.`id`, NEW.`typeinvoice`, NEW.`dateinvoice`, NEW.`duedate`, NEW.lesson_amount);
	END IF;
END
AFTER UPDATE ON `@@@invoice` FOR EACH ROW
BEGIN
	IF (NEW.`sum`<>OLD.`sum`) THEN
		DELETE FROM @@@invoicepay where idinvoice = OLD.id;
		CALL @@@sportsmen_calc_saldo(NEW.`sportsmen`);
		IF (NEW.`sum` > 0) THEN
			CALL @@@invoice2pay(NEW.`sportsmen`, NEW.`sum`, NEW.`id`, 0);
		ELSE
			CALL @@@invoice2pay(NEW.`sportsmen`, 0, 0, 0);
		END IF;
		#CALL @@@invoicepay_recalc(NEW.`sportsmen`);
	END IF;
	IF (NEW.`duedate` <> OLD.`duedate` OR NEW.dateinvoice <> OLD.dateinvoice OR  NEW.lesson_amount <> OLD.lesson_amount) THEN
		UPDATE @@@lesson SET idinvoice = 0 WHERE idinvoice = OLD.id;
		IF NEW.`duedate` IS NOT NULL THEN
			CALL @@@invoice2lesson(NEW.`sportsmen`, NEW.`id`, NEW.`typeinvoice`, NEW.`dateinvoice`, NEW.`duedate`, NEW.lesson_amount);
		END IF;
	END IF;
END

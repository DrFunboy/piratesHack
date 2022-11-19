AFTER DELETE ON `@@@invoice` FOR EACH ROW
BEGIN
  DELETE FROM @@@invoicepay where idinvoice = OLD.id;
	
  UPDATE @@@lesson SET idinvoice = 0 WHERE idinvoice = OLD.id;
  CALL @@@sportsmen_calc_saldo(OLD.sportsmen);
  CALL @@@invoice2pay(OLD.`sportsmen`, 0, 0, 0);
  #CALL @@@invoicepay_recalc(OLD.`sportsmen`);
END
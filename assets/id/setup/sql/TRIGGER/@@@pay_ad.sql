AFTER DELETE ON `@@@pay` FOR EACH ROW
BEGIN
  DELETE FROM @@@invoicepay where idpay = OLD.id;
  CALL @@@sportsmen_calc_saldo(OLD.`sportsmen`);
  CALL @@@invoice2pay(OLD.`sportsmen`, 0, 0, 0);
END


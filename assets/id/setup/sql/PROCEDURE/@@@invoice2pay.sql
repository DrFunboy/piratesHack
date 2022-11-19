(IN insportsmen int, IN insum decimal(10,2), IN ininvoice int, IN inpay int)
BEGIN
	DECLARE invdebt, paydebt decimal(10,2);
	DECLARE idinvoice, idpay INT;
	DECLARE done SMALLINT DEFAULT FALSE;

	DECLARE free_inv CURSOR FOR
		SELECT i.id, (i.`sum` - IFNULL(SUM(ipi.`sum`), 0)) as inv_debt
		FROM @@@invoice i LEFT JOIN @@@invoicepay ipi ON (ipi.idinvoice = i.id)
		WHERE i.sportsmen = insportsmen
		GROUP BY i.id
		HAVING inv_debt > 0
		ORDER BY i.dateinvoice, i.id;
		#SELECT ip_inv.id, ip_inv.idinvoice, ip_inv.`sum`
		#FROM @@@invoicepay ip_inv
		#WHERE (ip_inv.sportsmen = insportsmen AND ip_inv.idpay = 0);

	DECLARE free_pay CURSOR FOR
		SELECT p.id, (p.`sum` - IFNULL(SUM(ipp.`sum`), 0)) as pay_debt
		FROM @@@pay p LEFT JOIN @@@invoicepay ipp ON (ipp.idpay = p.id)
		WHERE p.sportsmen = insportsmen AND p.`payd`=1
		GROUP BY p.id
		HAVING pay_debt > 0
		ORDER BY p.datepay, p.id;
		#SELECT ip_pay.id, ip_pay.idpay, ip_pay.`sum`
		#FROM @@@invoicepay ip_pay
		#WHERE (ip_pay.sportsmen = insportsmen AND ip_pay.idinvoice = 0);
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  IF `insum` = 0 THEN
		# recalc AllFree
		OPEN free_inv;	
		all_inv: LOOP
			FETCH free_inv INTO idinvoice, invdebt;
			IF done THEN LEAVE all_inv; END IF;
			
			OPEN free_pay;	
			all_pay: LOOP
				FETCH free_pay INTO idpay, paydebt;
				IF done THEN LEAVE all_pay; END IF;
				SET paydebt = LEAST(paydebt, invdebt); # сумма вставки
				INSERT INTO @@@invoicepay (`idinvoice`,`idpay`,`sum`) VALUES (idinvoice, idpay, paydebt)
					ON DUPLICATE KEY UPDATE `sum`=`sum` + paydebt;
				SET invdebt = invdebt - paydebt;
				IF (invdebt = 0) THEN LEAVE all_pay; END IF;
			END LOOP;
			CLOSE free_pay;
			
			#SET invdebt = LEAST(invdebt, insum); # сумма вставки
			#INSERT INTO @@@invoicepay (`idinvoice`,`idpay`,`sum`) VALUES (idinvoice, inpay, invdebt);
			#SET insum = insum - invdebt; #остаток платежа после вставки
			#IF (insum = 0) THEN LEAVE all_inv; END IF;
		END LOOP;	
		CLOSE free_inv;

	ELSEIF `ininvoice` = 0 THEN
		# new idPay
		OPEN free_inv;	
		read_inv: LOOP
			FETCH free_inv INTO idinvoice, invdebt;
			IF done THEN LEAVE read_inv; END IF;
			SET invdebt = LEAST(invdebt, insum); # сумма вставки
			INSERT INTO @@@invoicepay (`idinvoice`,`idpay`,`sum`) VALUES (idinvoice, inpay, invdebt)
				ON DUPLICATE KEY UPDATE `sum`=`sum` + invdebt;
			SET insum = insum - invdebt; #остаток платежа после вставки
			IF (insum = 0) THEN LEAVE read_inv; END IF;
		END LOOP;	
		CLOSE free_inv;
		
		#IF (insum > 0) THEN
		#	INSERT INTO @@@invoicepay SET sportsmen= insportsmen, idpay= inpay, `sum`= insum;
		#END IF;

	ELSEIF `inpay` = 0 THEN
		# new idInvoice
		OPEN free_pay;	
		read_pay: LOOP
			FETCH free_pay INTO idpay, paydebt;
			IF done THEN LEAVE read_pay; END IF;
			SET paydebt = LEAST(paydebt, insum); # сумма вставки
			INSERT INTO @@@invoicepay (`idinvoice`,`idpay`,`sum`) VALUES (ininvoice, idpay, paydebt)
				ON DUPLICATE KEY UPDATE `sum`=`sum` + paydebt;
			SET insum = insum - paydebt;
			IF (insum = 0) THEN LEAVE read_pay; END IF;
		END LOOP;
		CLOSE free_pay;
	END IF;
END
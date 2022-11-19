(IN in_sportsmen int, IN in_invoice int,  IN in_typeinvoice int, IN dateinvoice date, IN duedate datetime, IN lesson_amount int)
BEGIN
	DECLARE cur_lesson int;
	DECLARE cnt int DEFAULT 0;
	DECLARE done SMALLINT DEFAULT FALSE;
		
	DECLARE cur_less CURSOR FOR
		SELECT les.id
		FROM @@@lesson les
			JOIN @@@schedule sch ON (les.`schedule` = sch.`id`)
			JOIN @@@sinvtype idSInvType ON (idSInvType.stype = sch.stype AND idSInvType.typeinvoice = in_typeinvoice)
			JOIN @@@config cfg ON (cfg.`name` = CONCAT('schedule_', sch.stype))
		WHERE les.sportsmen = in_sportsmen
		    AND les.idinvoice = 0
			AND (sch.datestart BETWEEN dateinvoice AND duedate)
			AND cfg.val LIKE CONCAT('%', les.`status`, '%')
		#HAVING sum_remain > 0
		ORDER BY sch.`datestart`;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;	
	OPEN cur_less;
	
	read_loop: LOOP
    FETCH cur_less INTO cur_lesson;
    IF (done OR (lesson_amount > 0 AND cnt >= lesson_amount)) THEN LEAVE read_loop; END IF;
		UPDATE @@@lesson SET idinvoice = in_invoice WHERE id = cur_lesson;
		SET cnt = cnt + 1;
  END LOOP;
	
	CLOSE cur_less;
END
BEFORE UPDATE ON `@@@sportsmensquad` FOR EACH ROW
BEGIN
	IF ((NEW.published IS NULL) AND (OLD.published IS NOT NULL)) THEN
		SET NEW.dateend = NOW();
	END IF;
	IF ((NEW.published IS NOT NULL) AND (OLD.published IS NULL)) THEN
		SET NEW.dateend = NULL;
	END IF;
END
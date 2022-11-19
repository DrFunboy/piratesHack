AFTER INSERT ON @@@sportsmen FOR EACH ROW
INSERT INTO @@@changes
SET sportsmen = NEW.id, newvalue = 'new', author = NEW.author;
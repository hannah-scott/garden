---
title: "Command-Line Arguments"
---

In IBM-standard COBOL you can do like this

```cobol
[...]
	01 ARG PIC X(50) VALUE SPACES.
[...]
	ACCEPT ARG FROM ARGUMENT-VALUE
	PERFORM UNTIL ARG = SPACES
		{SOME PROCEDURE}
		MOVE SPACES TO ARG
		ACCEPT ARG FROM ARGUMENT-VALUE
	END-PERFORM
[...]
```
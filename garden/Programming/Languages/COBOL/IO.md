---
title: "IO"
---

I/O in COBOL is _weird_, by which I mean it makes absolute perfect sense and is fine. You have to do a couple of things:

1. Define the file you're working on
2. Define what a record in that file looks like
3. Work with those records

Really it's just very precise, which isn't necessarily a fault.

## Defining the file

This is done in the `ENVIRONMENT` division. You assign the file using the format `SELECT {fname} ASSIGN TO {path to file}`, and specific what the organization and access modes are.

### Example

```cobol
[...]
	ENVIRONMENT DIVISION.
	INPUT-OUTPUT SECTION.
	FILE-CONTROL.
	SELECT RUNS ASSIGN TO "example.data"
		ORGANIZATION IS SEQUENTIAL ACCESS MODE IS SEQUENTIAL.
[...]
```

## Defining the records

This is done in the `DATA` division, under the `FILE` section. Essentially when reading and writing records, the program needs to know what a record looks like.

For a lot of I/O purposes you're also going to want an identical record in the `WORKING-STORAGE` section too.

### Example

This is a definition for a `RUN-RECORD`, which will hold details about some runs you've been going on, for example. 

```cobol
[...]
	DATA DIVISION.
	FILE SECTION.
	FD RUNS.
	01 RUN-RECORD.
		05 RUN-ID PIC 9(5).
		05 RUN-DATE.
			10 RUN-YEAR PIC 9(4).
			10 RUN-MONTH PIC 99.
			10 RUN-DAY PIC 99.
		05 RUN-DISTANCE PIC 99V99.
		05 RUN-STRENGTH PIC 99.
		05 EOL PIC A.
	WORKING-STORAGE SECTION.
	01 WS-RUN-RECORD.
		05 WS-RUN-ID PIC 9(5).
		05 WS-RUN-DATE.
			10 WS-RUN-YEAR PIC 9(4).
			10 WS-RUN-MONTH PIC 99.
			10 WS-RUN-DAY PIC 99.
		05 WS-RUN-DISTANCE PIC 99V99.
		05 WS-RUN-STRENGTH PIC 99.
[...]
```

I had to put an end-of-line character in each file record that just gets discarded, although I haven't actually seen that documented anywhere. I'm not sure if this is standard practice.

## Working with records
---
title: "COBOL Overview"
---

Stands for **Co**mmon **B**usiness-**O**riented **L**anguage.

It's a "domain specific business-oriented language", used mainly for the kinds of record-based tasks that SQL is used for[^1].

It usually runs on [mainframes](Mainframe), so we're talking lots of reading and writing.

It was "designed with readability in mind", so it's quite verbose but uses lots of plain English words.

## Compilers

I'm going to be using `GnuCOBOL`:

```sh
sudo apt install open-cobol
```

## Program Structure

COBOL follows a columnar indenting style, that is: it "cares what column your code is in". Some compilers are quite strict on that, but others aren't.

![COBOL Program Structure](garden/Programming/Languages/Attachments/COBOL%20Program%20Structure.png)

A lot of modern COBOL editors show you reference lines, e.g. 

![COBOL](https://docs.monadical.com/uploads/upload_4792a382fe16ece63202a836f091c3e4.png)

This is because COBOL source used to be printed on punch cards and read by hardware that passed light through holes in the cards. So, knowing which column contained which information made things a lot easier on the hardware.
### Terminology

- **division**
- **section**
- **paragraph**
- **sentence**
- **statement**
- **character**

## Running `hello world`

```cobol
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. HELLO.
       PROCEDURE DIVISION.
           DISPLAY "Hello, world".
       END PROGRAM HELLO.
```

## [IO](garden/Programming/Languages/COBOL/IO.md)

IO in COBOL has its own structure which is pretty interesting conceptually.

[^1]: https://monadical.com/posts/cobol.html

[Command-Line Arguments](garden/Programming/Languages/COBOL/Command-Line%20Arguments.md)

IBM COBOL has structure for command-line arguments with `GnuCOBOL`, but I have no idea if that is standard. Normally variables seem to be set within [job](job) definitions.

## Additional resources

I'm going to put all the good stuff I find in [Resources](garden/Programming/Languages/COBOL/Resources.md).